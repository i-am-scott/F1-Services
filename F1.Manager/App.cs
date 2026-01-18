using F1.Common;
using F1.Contexts;
using F1.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Timer = System.Timers.Timer;

namespace F1.Manager;

internal class App
{
    // TODO: TEMP: Move these with the RaceSchedulerer into its own service class.
    private static ILogger<App> logger;
    private static F1Db f1Db;
    private static RabbitMQConnectionService rabbitMQConnectionService;

    static async Task Main(string[] args)
    {
        Console.Title = "F1 Manager";

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

        builder.Services.AddDbContext<F1Db>();

        builder.Services.AddSingleton<RabbitMQConnectionService>();
        builder.Services.AddHostedService<RabbitMQConnectionService>();

        using IHost host = builder.Build();

        logger = host.Services.GetRequiredService<ILogger<App>>();
        f1Db = host.Services.GetRequiredService<F1Db>();
        rabbitMQConnectionService = host.Services.GetRequiredService<RabbitMQConnectionService>();

        _ = Task.Run(StartupRaceSchedule);

        await host.RunAsync();
    }

    private static async Task StartupRaceSchedule()
    {
        while(!rabbitMQConnectionService.IsOpen)
        {
            await Task.Delay(250);
        }

        Event? currentGp = await f1Db.GetCurrentGrandPrixAsync();
        Event? nextGp = await f1Db.GetNextGrandPrix();
        Event? selectedGp;

        // Update current race for Discord title.
        if ((selectedGp = currentGp ?? nextGp) != null)
        {
            rabbitMQConnectionService?.Publish("F1.Manager.GrandPrixResync", selectedGp);
            logger.LogInformation("Synced over rabbitMQ");
        }

        ScheduleEvents(true);
    }

    private static async void ScheduleEvents(bool skipSchedule = false)
    {
        Event? targetGp = await f1Db.GetNextGrandPrix();

        if (targetGp == null)
        {
            logger.LogInformation("Season ended?!");
            return;
        }

        logger.LogInformation("Starting timers for {name} ({start})", targetGp.Name, targetGp.Start);

        DateTime now = DateTime.UtcNow;

        double targetGpEnd = (targetGp.GetLastEventEndTime().AddMinutes(30) - now).TotalSeconds;

        if (!skipSchedule)
        {
            Event? currentGrandPrix = await f1Db.GetCurrentGrandPrixAsync();
            if (currentGrandPrix == null)
            {
                logger.LogInformation("Next race weekend updated to {name}.", targetGp.Name);
                rabbitMQConnectionService?.Publish("F1.Manager.EventScheduled", targetGp);
            }
        }

        simpleTimer("GPEnd", targetGpEnd, async () =>
        {
            // Message: race has ended!
            logger.LogInformation("Race weekend ended ${name}", targetGp.Name);

            rabbitMQConnectionService?.Publish("F1.Manager.GrandPrixEnd", targetGp);
            ScheduleEvents();
        });

        // Announce all race events.
        foreach (EventSchedule schedule in targetGp.EventSchedules.OrderBy(s => s.Start))
        {
            double raceStart = (schedule.Start - now).TotalSeconds;

            simpleTimer("Event_" + schedule.SessionTypeString, raceStart, async () =>
            {
                string eventJson = schedule.ToJson();
                rabbitMQConnectionService?.Publish("F1.Manager.EventStart", targetGp);
            });
        }
    }

    private static Timer simpleTimer(string id, double seconds, Action onElapse)
    {
        logger.LogInformation("Timer {id} scheduled for {seconds} -> {toSeconds}!", id, seconds, DateTime.UtcNow.AddSeconds(seconds));

        Timer timer = new Timer(TimeSpan.FromSeconds(seconds));
        timer.AutoReset = false;
        timer.Elapsed += (s, e) =>
        {
            logger.LogInformation("{id} timer has elapsed!", id);

            onElapse.Invoke();
            timer.Dispose();
        };

        timer.Start();
        return timer;
    }
}