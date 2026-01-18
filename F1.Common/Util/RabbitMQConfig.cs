namespace F1.Common;

internal class RabbitMQConfig
{
    public required string Host { set; get; }
    public required string Password { set; get; }
    public required string Username { set; get; }
    public int Port { get; set; } = 3306;
}