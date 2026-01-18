using F1.Common;
using F1.Contexts;
using Microsoft.EntityFrameworkCore;
using RestSharp;

namespace F1.APIGenerator;

internal class App
{
	internal static Config? Cfg;
	internal static F1Db? F1Db;

	static async Task Main(string[] args)
	{
		if (args.Length == 0)
		{
			args = ["-populate", DateTime.UtcNow.Year.ToString()];
		}

		Cfg = Config.Load();
		F1Db = new F1Db(Cfg.MySQLConfig);

		if (Cfg is null || F1Db is null)
		{
			return;
		}

		if (!await F1Db.ConnectAsync())
		{
			Console.WriteLine("Could not connect to MySQL!");
			return;
		}

		Queue<string> startupParams = new Queue<string>(args);
		string mode = startupParams.Dequeue();

		uint season = (uint)DateTime.UtcNow.Year;
		if (startupParams.TryDequeue(out string? seasonStr))
		{
			uint.TryParse(seasonStr, out season);
		}

		switch (mode)
		{
			case "-populate":
				await GetAllDrivers(season);
				await GetAllTeams(season);
				await GetAllEvents(season);
				await GetAllResults(season);
				break;
			case "-stage":
				uint eventid = uint.Parse(startupParams.Dequeue());

				await GetAllEvents(season);
				await GetAllDrivers(season);
				await GetAllTeams(season);
				await GetEventResults(eventid);
				break;
			case "-results":
				await GetEventResults(season);
				break;
			case "-teams":
			case "-constructors":
				await GetAllTeams(season);
				break;
			case "-drivers":
			case "-championship":
				await GetAllDrivers(season);
				break;
			case "-races":
			case "-events":
				await GetAllEvents(season);
				break;
		}

		Console.ReadLine();
	}

	static async Task GetAllResults(uint season)
	{
		Requests.Success($"{season} Getting all event results");

		List<F1.Models.Event> events = await F1Db.Events.Where(gp => gp.Season == season).ToListAsync();

		foreach (F1.Models.Event e in events)
		{
			Requests.Success($"{e.Key} Collecting event results.");

			await GetEventResults(e.Key);
			await Task.Delay(500);
		}

		Requests.Success($"Event results completed!");
	}

	static async Task GetEventResults(uint meeting)
	{
		F1.APIGenerator.Models.EventResults? eventResults = await Requests.GetEventResultAsync(meeting);
		if (eventResults is null)
		{
			Requests.Error($"No event results found for meeting key {meeting}");
			return;
		}

		await F1Db.EventResults.Where(r => r.EventKey == meeting).ExecuteDeleteAsync();
		await F1Db.EventAwards.Where(a => a.EventKey == meeting).ExecuteDeleteAsync();

		Models.RaceresultsRace resultsRace = eventResults.raceResultsRace;

		uint index = 0;
		foreach (Models.Result result in resultsRace.results)
		{
			index++;

			F1.Models.EventResult results = new F1.Models.EventResult
			{
				Key = meeting + "_" + resultsRace.session + "_" + index,
				EventKey = meeting,
				DriverKey = result.driverKey,
				Laps = result.lapsCompleted ?? 0,
				Points = result.racePoints,
				Position = index,
				Time = result.raceTime.ParseStopwatchToMilliseconds()
			};

			await F1Db.EventResults.AddAsync(results);
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

				await F1Db.EventAwards.AddAsync(dbAward);
			}
		}

		await F1Db.SaveChangesAsync();
		Requests.Success("Race results saved.");
	}

	static async Task GetAllTeams(uint season)
	{
		F1.APIGenerator.Models.ConstructorList? constructorList = await Requests.GetConstructorsAsync(season);
		if (constructorList == null)
		{
			Requests.Error("No driver list was found.");
			return;
		}

		await F1Db.Teams.Where(d => d.Season == season).ExecuteDeleteAsync();
		await F1Db.Constructors.Where(d => d.Season == season).ExecuteDeleteAsync();

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

			await F1Db.Constructors.AddAsync(new F1.Models.Constructor
			{
				Season = season,
				TeamKey = constructor.teamKey,
				Points = constructor.championshipPoints,
				Position = constructor.positionValue
			});

			await F1Db.Teams.AddAsync(dbTeam);
		}

		await F1Db.SaveChangesAsync();
		Requests.Success("Teams saved.");
	}

	static async Task GetAllDrivers(uint season)
	{
		F1.APIGenerator.Models.DriverList? driverList = await Requests.GetDriversAsync(season);
		if (driverList == null)
		{
			Requests.Error("No driver list was found.");
			return;
		}

		await F1Db.Drivers.Where(d => d.Season == season).ExecuteDeleteAsync();
		await F1Db.Championships.Where(c => c.Season == season).ExecuteDeleteAsync();

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

			await F1Db.Championships.AddAsync(new F1.Models.Championship
			{
				Season = season,
				TeamKey = driver.teamKey,
				DriverKey = driver.driverKey,
				Points = driver.championshipPoints,
				Position = driver.positionValue,
			});

			await F1Db.Drivers.AddAsync(dbDriver);
		}

		await F1Db.SaveChangesAsync();
		Requests.Success("Drivers saved.");
	}

	static async Task GetAllEvents(uint season)
	{
		F1.APIGenerator.Models.EventList? events = await Requests.GetEventsAsync(season);
		if (events == null)
		{
			Requests.Error("No driver list was found.");
			return;
		}

		await F1Db.Events.Where(gp => gp.Season == season).ExecuteDeleteAsync();

		foreach (Models.Event e in events.events)
		{
			uint meetingKey = e.meetingKey;

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

			await F1Db.Events.AddAsync(dbGrandPrix);

			F1.APIGenerator.Models.EventInfo? eventInfo = await Requests.GetEventAsync(meetingKey);
			if (eventInfo is null)
			{
				Requests.Error($"Could not find specific event info for {meetingKey}.");
				continue;
			}

			if (eventInfo.meetingContext is null || eventInfo.meetingContext.timetables is null)
			{
				Requests.Error($"No schedule context for {meetingKey}.");
                continue;
			}

			await F1Db.EventSchedules.Where(es => es.EventKey == meetingKey).ExecuteDeleteAsync();

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

				F1Db.EventSchedules.Add(schedule);
			}
		}

		await F1Db.SaveChangesAsync();
		Requests.Success("Grand Prix schedules saved.");
	}
}