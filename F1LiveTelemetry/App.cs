using F1;
using F1.Contexts;
using F1.Util;
using F1LiveTelemetry.SignalR;
using System.Text.Json;

namespace F1LiveTelemetry;

public class App
{
    private static SignalRProcessor Socket;
    private static RabbitMQConnection rabbitMQConnection;
    private static F1Db F1Db;

    public static async Task Main(string[] args)
    {
        Console.Title = "F1 Live Telemetry";
        Config Cfg = Config.Load("config.json");

        F1Db = new F1Db(Cfg.MySQLConfig);
        if (!await F1Db.ConnectAsync())
        {
            Console.WriteLine("MySQL connection could not be made!");
            return;
        }

        rabbitMQConnection = new RabbitMQConnection(Cfg.RedisConfig);

        await ConnectToWebSocket();
        await Task.Delay(-1);
    }

    private static async Task ConnectToWebSocket()
    {
        Socket = new SignalRProcessor(new Dictionary<string, string>()
        {
            {"User-Agent", "BestHTTP"},
            {"Accept-Encoding", "gzip,identity"}
        })
        {
            ExpectsMessageTerminator = false
        };

        Socket.AddHub("Streaming");
        Socket.OnFeed("RaceControlMessages", async (JsonElement element) =>
        {
            try
            {
                if (element.TryGetProperty("Message", out JsonElement _))
                {
                    rabbitMQConnection.Publish("F1.RaceControlMessages", element);
                }

                if (element.TryGetProperty("Messages", out JsonElement messages))
                {
                    foreach (var message in messages.EnumerateObject())
                    {
                        rabbitMQConnection.Publish("F1.RaceControlMessages", message.Value);
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error("RaceControlMessages", ex.Message);
            }
        });

        await Socket.ConnectAsync("https://livetiming.formula1.com/signalr");
        await Socket.SendAsync<LiveResponse>("Subscribe", new List<string>() {
            "LapCount",
            "Heartbeat",
            "RaceControlMessages",
            "TrackStatus",
            "TeamRadio",
            "TimingStats",
            "WeatherData",
            "TopThree",
            "SessionInfo",
            "DriverList"
        });
    }
}