using F1.Common;
using F1.LiveTelemetry.SignalR;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System.Text.Json;

namespace F1.LiveTelemetry;

public class App
{
    private static SignalRProcessor? Socket;

    static async Task Main(string[] args)
    {
        Console.Title = "F1 Live Telemetry";

        HostApplicationBuilder builder = Host.CreateApplicationBuilder(args);
        builder.Configuration
            .SetBasePath(AppContext.BaseDirectory)
            .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
            .AddJsonFile($"appsettings.{builder.Environment.EnvironmentName}.json", optional: true, reloadOnChange: true)
            .AddEnvironmentVariables()
            .AddCommandLine(args);

        builder.Logging.ClearProviders();
        builder.Logging.AddConsole();

        builder.Services.Configure<DbConfig>(builder.Configuration.GetSection("MySQL"));
        builder.Services.Configure<RabbitMQConfig>(builder.Configuration.GetSection("RabbitMQ"));

        builder.Services.AddSingleton<RabbitMQConnectionService>();
        builder.Services.AddHostedService<RabbitMQConnectionService>();

        using IHost host = builder.Build();

        await ConnectToWebSocket(host.Services.GetRequiredService<RabbitMQConnectionService>(), host.Services.GetRequiredService<ILogger<App>>());
        await host.RunAsync();
    }

    private static async Task ConnectToWebSocket(RabbitMQConnectionService rabbitMQConnection, ILogger<App> logger)
    {
        Socket = new(logger, new()
        {
            {"User-Agent", "BestHTTP"},
            {"Accept-Encoding", "gzip,identity"}
        })
        {
            ExpectsMessageTerminator = false
        };

        Socket.AddHub("Streaming");
        Socket.OnFeed("RaceControlMessages", (JsonElement element) =>
        {
            if (!rabbitMQConnection.IsOpen)
            {
                return;
            }

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
                logger.LogError(ex, "Error processing RaceControlMessages");
            }
        });

        await Socket.ConnectAsync("https://livetiming.formula1.com/signalr");
        await Socket.SendAsync<LiveResponse>("Subscribe", new List<string>()
        {
            "DriverList",
            "ExtrapolatedClock",
            "Heartbeat",
            "LapCount",
            "RaceControlMessages",
            "RcmSeries",
            "SessionData",
            "SessionInfo",
            "TeamRadio",
            "TimingStats",
            "TimingAppData",
            "TopThree",
            "TrackStatus",
            "WeatherData",
        });
    }
}