using F1.Models;
using System.Text.Json;

namespace F1.Common;

public struct F1
{
    public string CircuitImages { get; set; }
    public string ApiKey { get; set; }
}

internal class Config
{
    public DbConfig MySQLConfig { get; set; } = null!;

    public DbConfig RabbitMQConfig { get; set; } = null!;

    public DiscordConfig DiscordConfig { get; set; } = null!;

    public F1 Formula1 { get; set; }

    public static Config Generate(string path)
    {
        Config cfg = new Config();

        File.WriteAllText(path, JsonSerializer.Serialize(cfg, new JsonSerializerOptions
        {
            WriteIndented = true
        }));

        return cfg;
    }

    public static Config Load()
    {
        string path = Options.Instance?.Config ?? "config.json";

        if (File.Exists(path))
        {
            string? configText = File.ReadAllText(path);
            Config? cfg = JsonSerializer.Deserialize<Config>(configText)!;

            return cfg ?? Generate(path);
        }
        else
        {
            return Generate(path);
        }
    }
}