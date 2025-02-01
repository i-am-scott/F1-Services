using F1;
using F1.Contexts;
using F1.Models;
using F1.Util;
using Microsoft.EntityFrameworkCore;
using Timer = System.Timers.Timer;

namespace F1Manager;

internal class App
{
    private static Config Cfg;

    private static F1Db F1Db;
    private static RabbitMQConnection rabbitMQConnection;

    static async Task Main(string[] args)
    {
        Cfg = Config.Load("config.json");

        F1Db = new F1Db(Cfg.MySQLConfig);
        rabbitMQConnection = new RabbitMQConnection(Cfg.RabbitMQConfig);

        if (!await F1Db.ConnectAsync())
        {
            Console.WriteLine("Could not connect to MySQL!");
            return;
        }

        await Task.Run(StartupRaceSchedule);
        await Task.Delay(-1);
    }

    private static async Task StartupRaceSchedule()
    {
        Event? currentGp = await F1Db.GetCurrentGrandPrixAsync();
        Event? nextGp = await F1Db.GetNextGrandPrix();
        Event? selectedGp;

        // Update current race for Discord title.
        if ((selectedGp = currentGp ?? nextGp) != null)
        {
            rabbitMQConnection.Publish("F1.Manager.GrandPrixResync", selectedGp);
            Console.WriteLine("Synced over rabbitMQ");
        }

        ScheduleEvents(true);
    }

    private static async void ScheduleEvents(bool skipSchedule = false)
    {
        Event? targetGp = await F1Db.GetNextGrandPrix();

        // Season ended?
        if (targetGp == null)
        {
            Log.Info("Season ended?!");
            return;
        }

        Log.Info($"Starting timers for {targetGp.Name} ({targetGp.Weekend})");

        DateTime now = DateTime.UtcNow;

#if DEBUG && FAKETIMINGS
        double targetGpEnd = 300;
#else
        double targetGpEnd = (targetGp.GetLastEventEndTime().AddMinutes(30) - now).TotalSeconds;
#endif

        if (!skipSchedule)
        {
            Event? currentGrandPrix = await F1Db.GetCurrentGrandPrixAsync();
            if (currentGrandPrix == null)
            {
                Log.Info($"Next race weekend updated to {targetGp.Name}.");
                rabbitMQConnection.Publish("F1.Manager.EventScheduled", targetGp);
            }
        }

        simpleTimer("GPEnd", targetGpEnd, async () =>
        {
            // Message: race has ended!
            Log.Info($"Race weekend ended ${targetGp.Name}");

            rabbitMQConnection.Publish("F1.Manager.GrandPrixEnd", targetGp);
            ScheduleEvents();
        });

        // Announce all race events.
        int count = 1;
        foreach (EventSchedule schedule in targetGp.EventSchedules.OrderBy(s => s.Start))
        {
#if DEBUG && FAKETIMINGS
            double raceStart = count++ * 60;
#else
            double raceStart = (schedule.Start - now).TotalSeconds;
#endif

            simpleTimer("Event_" + schedule.SessionTypeString, raceStart, async () =>
            {
                string eventJson = schedule.ToJson();
                rabbitMQConnection.Publish("F1.Manager.EventStart", targetGp);
            });
        }
    }

    private static Timer simpleTimer(string id, double seconds, Action onElapse)
    {
        Console.WriteLine($"Timer {id} scheduled for {seconds} -> {DateTime.UtcNow.AddSeconds(seconds)}!");

        Timer timer = new Timer(TimeSpan.FromSeconds(seconds));
        timer.AutoReset = false;
        timer.Elapsed += (s, e) =>
        {
            Console.WriteLine($"{id} timer has elapsed!");

            onElapse.Invoke();
            timer.Dispose();
        };

        timer.Start();
        return timer;
    }
}