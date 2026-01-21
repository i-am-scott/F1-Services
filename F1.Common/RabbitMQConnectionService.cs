using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using RabbitMQ.Client;
using RabbitMQ.Client.Events;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace F1.Common;

internal sealed class RabbitMQConnectionService : IHostedService
{
	private readonly ILogger<RabbitMQConnectionService> logger;
	private readonly RabbitMQConfig configuration;

	private IConnection connection = default!;
	private IChannel channel = default!;

	public bool IsOpen => connection?.IsOpen ?? false;

	public Action OnConnected = null!;
	public Action OnDisconnected = null!;

	private JsonSerializerOptions jsonSerializerOptions = new JsonSerializerOptions
	{
		WriteIndented = true,
		ReferenceHandler = ReferenceHandler.Preserve
	};

	public RabbitMQConnectionService(ILogger<RabbitMQConnectionService> _logger, IOptions<RabbitMQConfig> _dbConfiguration)
	{
		logger = _logger;
		configuration = _dbConfiguration.Value;
	}

	public async Task StartAsync(CancellationToken cancellationToken)
	{
		ConnectionFactory factory = new ConnectionFactory
		{
			HostName = configuration.Host,
			UserName = configuration.Username,
			Password = configuration.Password,
			Port = configuration.Port,
			AutomaticRecoveryEnabled = true,
			TopologyRecoveryEnabled = true
		};

		connection = await factory.CreateConnectionAsync();
		channel = await connection.CreateChannelAsync();

		channel.ChannelShutdownAsync += async (sender, ea) =>
		{
			logger.LogWarning("RabbitMQ Channel Shutdown: {ReplyText}", ea.ReplyText);
		};

		connection.ConnectionShutdownAsync += async (sender, ea) =>
		{
			logger.LogWarning("RabbitMQ Connection Shutdown: {ReplyText}", ea.ReplyText);
			OnDisconnected?.Invoke();
		};

		connection.CallbackExceptionAsync += async (sender, ea) =>
		{
			logger.LogWarning("RabbitMQ Connection Exception: {ExceptionMessage}", ea.Exception.Message);
		};
	}

	public async Task StopAsync(CancellationToken cancellationToken)
	{
		logger.LogInformation("Stopping RabbitMQ connection...");

		await channel.CloseAsync();
		await connection.CloseAsync();

		channel?.Dispose();
		connection?.Dispose();
	}

	private async Task<IChannel> ensureChannel(string queueName)
	{
		if (channel is null || channel.IsClosed)
		{
			channel = await connection.CreateChannelAsync();
		}

		await channel.ExchangeDeclareAsync(queueName, ExchangeType.Fanout, durable: true, autoDelete: false, noWait: true);
		await channel.QueueDeclareAsync(queueName, durable: true, exclusive: false, autoDelete: false, noWait: true);

		return channel;
	}

	public async Task<bool> PublishAsync(string queueName, dynamic obj)
	{
		await ensureChannel(queueName);

		string json = JsonSerializer.Serialize(obj, jsonSerializerOptions);
		byte[] jsonBytes = Encoding.UTF8.GetBytes(json);

		await channel.BasicPublishAsync(queueName, string.Empty, jsonBytes);
		return true;
	}

	public async Task<RabbitMQConnectionService> SubscribeAsync<T>(string queueName, Action<T> onReceived)
	{
		await ensureChannel(queueName);

		await channel.QueueBindAsync(queueName, queueName, string.Empty);

		AsyncEventingBasicConsumer consumer = new AsyncEventingBasicConsumer(channel);
		consumer.ReceivedAsync += async (model, ea) =>
		{
			string body = Encoding.UTF8.GetString(ea.Body.ToArray());

			T? result = JsonSerializer.Deserialize<T>(body, jsonSerializerOptions);
			if (result != null)
			{
				onReceived.Invoke(result);
			}
		};

		await channel.BasicConsumeAsync(queueName, true, consumer);
		return this;
	}
}