using System.Text.Json;

namespace F1.Util;

public struct F1
{
    public string CircuitImages { get; set; }
    public string ApiKey { get; set; }
}

internal class Config
{
    public DbConfig MySQLConfig { get; set; } = new DbConfig
    {
        Host = "vm",
        Database = "f1",
        Username = "root",
        Password = "9d7wL6QTy8N",
    };

    public DbConfig RabbitMQConfig { get; set; } = new DbConfig
    {
        Host = "vm",
        Port = 6379,
    };

    public DiscordConfig DiscordConfig { get; set; }

    public F1 Formula1 { get; set; }

    public static Config Load(string path)
    {
        if (File.Exists(path))
        {
            return JsonSerializer.Deserialize<Config>(File.ReadAllText(path));
        }
        else
        {
            Config cfg = new Config();

            File.WriteAllText(path, JsonSerializer.Serialize(cfg, new JsonSerializerOptions
            {
                WriteIndented = true
            }));

            return cfg;
        }
    }
}