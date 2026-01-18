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
    private Dictionary<string, IModel> channels = new Dictionary<string, IModel>();

    public bool IsOpen => connection?.IsOpen ?? false;

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

    public Task StartAsync(CancellationToken cancellationToken)
    {
        ConnectionFactory factory = new ConnectionFactory
        {
            HostName = configuration.Host,
            UserName = configuration.Username,
            Password = configuration.Password,
            Port = configuration.Port,
            DispatchConsumersAsync = true,
            AutomaticRecoveryEnabled = true,
            TopologyRecoveryEnabled = true
        };

        connection = factory.CreateConnection();

        logger.LogInformation("Connected to RabbitMQ server...");

        connection.CallbackException += (sender, ea) =>
        {
            logger.LogWarning("RabbitMQ Connection Exception: {ExceptionMessage}", ea.Exception.Message);
        };

        return Task.CompletedTask;
    }

    public Task StopAsync(CancellationToken cancellationToken)
    {
        logger.LogInformation("Stopping RabbitMQ connection...");
        connection.Dispose();

        return Task.CompletedTask;
    }

    private IModel getQueue(string queueName)
    {
        if (channels.TryGetValue(queueName, out IModel? channel))
        {
            return channel;
        }

        channel = connection.CreateModel();

        channel.QueueDeclare(queueName, false, false, false);
        channel.ExchangeDeclare(queueName, ExchangeType.Fanout);

        channels.Add(queueName, channel);
        return channel;
    }

    public bool Publish(string queueName, dynamic obj)
    {
        IModel channel = getQueue(queueName);

        string json = JsonSerializer.Serialize(obj, jsonSerializerOptions);
        byte[] jsonBytes = Encoding.UTF8.GetBytes(json);

        channel.BasicPublish(exchange: queueName,
                             routingKey: string.Empty,
                             basicProperties: null,
                             body: jsonBytes);

        return true;
    }

    public RabbitMQConnectionService Subscribe<T>(string queueName, Action<T> onReceived)
    {
        IModel channel = getQueue(queueName);

        channel.QueueBind(queue: queueName,
                          exchange: queueName,
                          routingKey: string.Empty);

        EventingBasicConsumer consumer = new EventingBasicConsumer(channel);
        consumer.Received += (model, ea) =>
        {
            string body = Encoding.UTF8.GetString(ea.Body.ToArray());

            T? result = JsonSerializer.Deserialize<T>(body, jsonSerializerOptions);

            if (result != null)
            {
                onReceived.Invoke(result);
            }
        };

        channel.BasicConsume(queue: queueName, autoAck: true, consumer: consumer);
        return this;
    }
}