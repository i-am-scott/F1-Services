namespace F1.Common;

using RabbitMQ.Client;
using RabbitMQ.Client.Events;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;

internal class RabbitMQConnection
{
    private IConnection connection { get; set; }
    private Dictionary<string, IModel> channels = new Dictionary<string, IModel>();

    private JsonSerializerOptions jsonSerializerOptions = new JsonSerializerOptions
    {
        WriteIndented = true,
        ReferenceHandler = ReferenceHandler.Preserve
    };

    public RabbitMQConnection(DbConfig cfg)
    {
        ConnectionFactory connectionFactory = new ConnectionFactory
        {
            HostName = cfg.Host,
            Port = 5672,
            UserName = cfg.Username,
            Password = cfg.Password
        };

        connection = connectionFactory.CreateConnection();
    }

    private IModel getQueue(string queueName)
    {
        if (channels.TryGetValue(queueName, out IModel? channel))
            return channel;

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

    public RabbitMQConnection Subscribe<T>(string queueName, Action<T> onReceived)
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
