using F1.Common;
using F1.Contexts;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using RestSharp;

namespace F1.APIGenerator;

internal class App
{
    // TODO: TEMP: Move all calls into its own class and accept commands.

    private static ILogger<App> logger = null!;
    private static F1Db f1Db = null!;
    private static Requests requests = null!;

    static async Task Main(string[] args)
    {
        Console.Title = "F1 API Generator";

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
        builder.Services.AddSingleton<Requests>();

        using IHost host = builder.Build();

        _ = Task.Run(async () =>
        {
            await commandLinePoll(host);
        });

        await host.RunAsync();
    }

    static async Task commandLinePoll(IHost host)
    {
        logger = host.Services.GetRequiredService<ILogger<App>>();
        f1Db = host.Services.GetRequiredService<F1Db>();
        requests = host.Services.GetRequiredService<Requests>();

        while (true)
        {
            string? input = Console.ReadLine();
            if (string.IsNullOrEmpty(input))
            {
                continue;
            }

            List<string> args = input.Split(' ').ToList();

            Queue<string> commandParams = new Queue<string>(args);

            string command = commandParams.Dequeue();

            int season = DateTime.UtcNow.Year;
            if (commandParams.TryDequeue(out string? seasonStr))
            {
                int.TryParse(seasonStr, out season);
            }

            switch (command)
            {
                case "populate":
                    await GetAllDrivers(season);
                    await GetAllTeams(season);
                    await GetAllEvents(season);
                    await GetAllResults(season);
                    break;
                case "stage":
                    int eventid = int.Parse(commandParams.Dequeue());
                    if (eventid == 0)
                    {
                        logger.LogInformation("You must provide a valid event ID to stage.");
                        break;
                    }

                    await GetAllEvents(season);
                    await GetAllDrivers(season);
                    await GetAllTeams(season);
                    await GetEventResults(eventid);
                    break;
                case "results":
                    await GetEventResults(season);
                    break;
                case "seasonresults":
                    await GetAllResults(season);
                    break;
                case "teams":
                case "constructors":
                    await GetAllTeams(season);
                    break;
                case "drivers":
                case "championship":
                    await GetAllDrivers(season);
                    break;
                case "races":
                case "events":
                    await GetAllEvents(season);
                    break;
            }
        }
    }

    static async Task GetAllResults(int season)
    {
        logger.LogInformation("Getting all event results for {season}", season);

        List<F1.Models.Event> events = await f1Db.Events.Where(gp => gp.Season == season).ToListAsync();

        foreach (F1.Models.Event e in events)
        {
            logger.LogInformation("{key} {name} Collecting event results.", e.Key, e.Name);

            await GetEventResults(e.Key);
            await Task.Delay(250);
        }

        logger.LogInformation("Event results for {season} completed!", season);
    }

    static async Task GetEventResults(int meeting)
    {
        F1.APIGenerator.Models.EventResults? eventResults = await requests.GetEventResultAsync(meeting);
        if (eventResults is null)
        {
            logger.LogWarning("No event results found for meeting key {meeting}", meeting);
            return;
        }

        await f1Db.EventResults.Where(r => r.Key == meeting).ExecuteDeleteAsync();
        await f1Db.EventAwards.Where(a => a.EventKey == meeting).ExecuteDeleteAsync();

        Models.RaceresultsRace resultsRace = eventResults.raceResultsRace;
        if (resultsRace is null || resultsRace.results is null)
        {
            logger.LogError("No race results found for meeting key {meeting}", meeting);
            return;
        }

        int index = 0;
        List<F1.Models.EventResult> entities = new List<F1.Models.EventResult>();

        foreach (Models.Result result in resultsRace.results)
        {
            index++;

            F1.Models.EventResult results = new F1.Models.EventResult
            {
                Key = meeting,
                InternalPosition = index,
                Session = resultsRace.session,
                DriverKey = result.driverKey,
                Laps = result.lapsCompleted ?? 0,
                Points = result.racePoints,
                Position = index,
                Time = result.raceTime.ParseStopwatchToMilliseconds()
            };

            entities.Add(results);
        }

        var prev = f1Db.ChangeTracker.AutoDetectChangesEnabled;
        f1Db.ChangeTracker.AutoDetectChangesEnabled = false;

        try
        {
            f1Db.EventResults.AddRange(entities);
            await f1Db.SaveChangesAsync();
        }
        catch(Exception exception)
        {
            logger.LogError(exception, "Failed to save changes to EventResults");
        }
        finally
        {
            f1Db.ChangeTracker.AutoDetectChangesEnabled = prev;
            f1Db.ChangeTracker.Clear();
        }

        if (resultsRace.awards != null)
        {
            foreach (Models.Award award in resultsRace.awards)
            {
                F1.Models.EventAward dbAward = new F1.Models.EventAward
                {
                    Key = meeting + "_" + award.type,
                    EventKey = meeting,
                    Title = award.itemTitle,
                    Winner = award.winnerName,
                    RewardType = award.type,
                    Time = award.winnerTime.ParseStopwatchToMilliseconds()
                };

                await f1Db.EventAwards.AddAsync(dbAward);
            }
        }

        await f1Db.SaveChangesAsync();
        logger.LogInformation("Race results saved.");
    }

    static async Task GetAllTeams(int season)
    {
        F1.APIGenerator.Models.ConstructorList? constructorList = await requests.GetConstructorsAsync(season);
        if (constructorList is null || constructorList.constructors is null)
        {
            logger.LogWarning("No constructor list was found.");
            return;
        }

        await f1Db.Teams.Where(d => d.Season == season).ExecuteDeleteAsync();
        await f1Db.Constructors.Where(d => d.Season == season).ExecuteDeleteAsync();

        foreach (F1.APIGenerator.Models.Constructor constructor in constructorList.constructors)
        {
            F1.Models.Team dbTeam = new F1.Models.Team
            {
                Season = season,
                Key = constructor.teamKey,
                Name = constructor.teamName,
                Color = constructor.teamColourCode,
                Icon = constructor.teamNegativeLogoImage,
                Profile = constructor.teamPageUrl
            };

            await f1Db.Constructors.AddAsync(new F1.Models.Constructor
            {
                Season = season,
                TeamKey = constructor.teamKey,
                Points = constructor.championshipPoints,
                Position = constructor.positionValue
            });

            await f1Db.Teams.AddAsync(dbTeam);
        }

        await f1Db.SaveChangesAsync();
        logger.LogInformation("Teams saved.");
    }

    static async Task GetAllDrivers(int season)
    {
        F1.APIGenerator.Models.DriverList? driverList = await requests.GetDriversAsync(season);
        if (driverList == null)
        {
            logger.LogInformation("No driver list was found.");
            return;
        }

        var state = f1Db.Database.GetDbConnection().State;
        Console.WriteLine(state.ToString());

        await f1Db.Drivers.Where(d => d.Season == season).ExecuteDeleteAsync();
        await f1Db.Championships.Where(c => c.Season == season).ExecuteDeleteAsync();

        foreach (F1.APIGenerator.Models.Driver driver in driverList.drivers)
        {
            if (!driver.racingNumber.HasValue)
            {
                continue;
            }

            F1.Models.Driver dbDriver = new F1.Models.Driver
            {
                Season = season,
                Key = driver.driverKey,

                RacingNumber = driver.racingNumber.Value,

                TeamKey = driver.teamKey,
                TLA = driver.driverTLA,

                FirstName = driver.driverFirstName,
                LastName = driver.driverLastName,
                Nationality = driver.driverCountry,

                Image = driver.driverImage,
                Profile = driver.driverPageUrl
            };

            await f1Db.Championships.AddAsync(new F1.Models.Championship
            {
                Season = season,
                TeamKey = driver.teamKey,
                DriverKey = driver.driverKey,
                Points = driver.championshipPoints,
                Position = driver.positionValue,
            });

            await f1Db.Drivers.AddAsync(dbDriver);
        }

        await f1Db.SaveChangesAsync();
        logger.LogInformation("Drivers saved.");
    }

    static async Task GetAllEvents(int season)
    {
        F1.APIGenerator.Models.EventList? events = await requests.GetEventsAsync(season);
        if (events is null || events.events is null)
        {
            logger.LogWarning("No event list was found.");
            return;
        }

        await f1Db.Events.Where(gp => gp.Season == season).ExecuteDeleteAsync();

        foreach (Models.Event e in events.events)
        {
            int meetingKey = e.meetingKey;

            if (string.IsNullOrEmpty(e.meetingName))
            {
                continue;
            }

            int timeoffset = int.Parse(e.gmtOffset.Replace("+", "").Split(':').First());

            F1.Models.Event dbGrandPrix = new F1.Models.Event
            {
                Season = season,
                Key = meetingKey,
                Name = e.meetingName,
                OfficialName = e.meetingOfficialName,
                Location = e.meetingIsoCountryName,
                Start = e.meetingStartDate.AddHours(-timeoffset),
                End = e.meetingEndDate.AddHours(-timeoffset),
                TimeOffset = timeoffset,
                Profile = e.url,
                Circuit = e.circuitMediumImage,
            };

            await f1Db.Events.AddAsync(dbGrandPrix);

            F1.APIGenerator.Models.EventInfo? eventInfo = await requests.GetEventAsync(meetingKey);
            if (eventInfo is null)
            {
                logger.LogWarning("Could not find specific event info for {meetingKey}.", meetingKey);
                continue;
            }

            if (eventInfo.meetingContext is null || eventInfo.meetingContext.timetables is null)
            {
                logger.LogWarning("No schedule context for {meetingKey}.", meetingKey);
                continue;
            }

            await f1Db.EventSchedules.Where(es => es.EventKey == meetingKey).ExecuteDeleteAsync();

            foreach (Models.Timetable timetable in eventInfo.meetingContext.timetables)
            {
                F1.Models.EventSchedule schedule = new F1.Models.EventSchedule
                {
                    Key = meetingKey + "_" + timetable.session + "_" + timetable.sessionNumber,
                    EventKey = meetingKey,
                    Session = timetable.description,
                    Start = timetable.startTime.AddHours(-timeoffset),
                    End = timetable.endTime.AddHours(-timeoffset),
                    Status = timetable.state,
                };

                f1Db.EventSchedules.Add(schedule);
            }
        }

        await f1Db.SaveChangesAsync();
        logger.LogInformation("Grand Prix schedules saved.");
    }
}