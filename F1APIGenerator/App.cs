using F1.Contexts;
using F1.Models;
using F1.Util;
using HtmlAgilityPack;
using Microsoft.EntityFrameworkCore;
using RestSharp;

namespace F1APIGenerator;

// https://www.formula1.com/en/results.html/2023/races/1141/race-result.html

internal class App
{
    internal static Config Cfg;

    internal static F1Db F1Db;

    internal static RestClient client => new RestClient(new RestClientOptions("https://formula1.com/en/")
    {
        ThrowOnAnyError = true,
        MaxTimeout = 5000
    });

    static async Task Main(string[] args)
    {
        if (args.Length == 0)
        {
            args = ["-races", "2024"];
        }

        Queue<string> startupParams = new Queue<string>(args);

        Cfg = Config.Load("config.json");
        F1Db = new F1Db(Cfg.MySQLConfig);

        if (!await F1Db.ConnectAsync())
        {
            Console.WriteLine("Could not connect to MySQL!");
            return;
        }

        string mode = startupParams.Dequeue();

        int year = 2024;
        int.TryParse(startupParams.Dequeue(), out year);

        switch (mode)
        {
            case "-races":
                await GetAllRaces(year);
                break;
            case "-results":
                startupParams.TryDequeue(out string? raceIdStr);
                if (int.TryParse(raceIdStr, out int raceId))
                {
                    await GetRaceResults(year, raceId, RaceType.Race);
                }
                break;
        }
    }

    static async Task GetRaceResults(int season, int raceid, RaceType raceType)
    {
        string raceTypeToEndpoint = raceType switch
        {
            RaceType.Qualifying => "qualifying",
            RaceType.FP3 => "practice-3",
            RaceType.FP2 => "practice-2",
            RaceType.FP1 => "practice-1",
            RaceType.Sprint => "sprint-results",
            RaceType.SprintQualifying => "sprint-qualifying",
            RaceType.SprintShootout => "sprint-shootout",
            _ => "race-result"
        };

        HtmlDocument? raceResults = await DownloadHTML($"results.html/{season}/races/{raceid}/race/{raceTypeToEndpoint}.html");

        await Task.CompletedTask;
    }

    static async Task GetAllRaces(int season)
    {
        await F1Db.GrandsPrix.Where(gp => gp.season == season).ExecuteDeleteAsync();

        HtmlDocument? schedules = await DownloadHTML($"racing/{season}.html");
        HtmlNodeCollection events = schedules.DocumentNode.SelectNodes("//a[contains(@class,'event-item-link')]");

        int i = 0;
        foreach (HtmlNode node in events)
        {
            string? gpName = node.Attributes["href"].Value.Split("/").LastOrDefault()?.Replace(".html", "");
            if (gpName == null || gpName.Contains("Testing"))
            {
                continue;
            }

            Race? race = await DownloadRace(season, gpName);
            if (race == null)
            {
                continue;
            }

            if (race.Schedules.Count == 0)
            {
                continue;
            }

            HtmlNode? descriptionNode = node.SelectSingleNode(".//div[@class='event-description']");
            if (descriptionNode == null)
            {
                continue;
            }

            uint raceId = uint.Parse(node.Attributes["data-meetingkey"].Value);
            string location = descriptionNode.SelectSingleNode(".//div[1]").InnerText;
            string name = descriptionNode.SelectSingleNode(".//div[2]").InnerText;
            string flag = node.SelectSingleNode(".//div[@class='country-flag']/picture/img").Attributes["data-src"].Value;

            race.Id = raceId;
            race.Name = name.Trim();
            race.CircuitLocation = location.Trim();

            GrandPrix gp = new GrandPrix
            {
                id = race.Id,
                path = gpName,
                name = race.Name,
                season = season,
                location = race.CircuitLocation,
                location_flag = flag,
                circuit = race.CircuitName,

                GrandPrixSchedules = race.Schedules,
                GrandPrixStats = race.Stats
            };

            DateTime startTime = gp.GrandPrixSchedules.First().start.Date;
            gp.weekend = startTime;

            await F1Db.GrandsPrix.AddAsync(gp);
        }

        await F1Db.SaveChangesAsync();
        Console.WriteLine("Grand Prix schedules created");
    }

    static async Task<Race?> DownloadRace(int season, string raceName)
    {
        HtmlDocument? raceGp = await DownloadHTML($"racing/{season}/{raceName}.html");
        if (raceGp == null)
        {
            Error("Race doc not valid!");
            return default;
        }

        HtmlDocument? circuitRace = await DownloadHTML($"racing/{season}/{raceName}/Circuit.html");
        if (circuitRace == null)
        {
            Error("Circuit doc not valid!");
            return default;
        }

        Race race = new Race(raceGp, circuitRace)
        {
            Season = season
        };

        race.Load();

        return race;
    }

    static async Task<HtmlDocument?> DownloadHTML(string endPoint)
    {
        RestRequest req = new RestRequest(endPoint);
        req.Method = Method.Get;

        try
        {
            RestResponse? response = await client.GetAsync(req);
            if (response == null)
            {
                return null;
            }

            HtmlDocument html = new HtmlDocument();
            html.LoadHtml(response.Content);

            return html;
        }
        catch (Exception ex)
        {
            Error(ex.Message);
        }

        return null;
    }

    public static void Success(string message)
    {
        Console.ForegroundColor = ConsoleColor.Green;
        Console.Error.WriteLine(message);
        Console.ForegroundColor = ConsoleColor.White;
    }
    public static void Error(string message)
    {
        Console.ForegroundColor = ConsoleColor.Red;
        Console.Error.WriteLine(message);
        Console.ForegroundColor = ConsoleColor.White;
    }
}