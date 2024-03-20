using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace F1.Models;

[Table("grandprix")]
[PrimaryKey("id")]
internal class GrandPrix
{
    public uint id { get; set; }
    public required int season { get; set; }
    public required string location { get; set; }
    public required string location_flag { get; set; }

    public required string path { get; set; }
    public string f1url => "https://www.formula1.com/en/racing/" + season + "/" + path + ".html";

    public required string name { get; set; }

    public required string circuit { get; set; }
    public string? circuit_wiki { get; set; }
    public string circuit_url { get; set; }

    public DateTime weekend { get; set; }

    public ICollection<GrandPrixSchedule> GrandPrixSchedules { get; set; }
    public ICollection<GrandPrixStat> GrandPrixStats { get; set; }

    public bool IsCurrentWeekend()
    {
        DateTime dateTime = DateTime.UtcNow.Date;
        return dateTime >= weekend && dateTime < weekend.AddDays(3);
    }

    public GrandPrixSchedule? GetLastEvent()
    {
        DateTime dateTime = DateTime.UtcNow;
        return GrandPrixSchedules.Where(e => e.end <= dateTime).OrderByDescending(e => e.end).FirstOrDefault();
    }

    public GrandPrixSchedule? GetNextEvent()
    {
        DateTime dateTime = DateTime.UtcNow;
        return GrandPrixSchedules.Where(e => e.start >= dateTime).OrderBy(e => e.start).FirstOrDefault();
    }

    public GrandPrixSchedule? GetCurrentEvent()
    {
        DateTime dateTime = DateTime.UtcNow;
        return GrandPrixSchedules.Where(e => e.start >= dateTime && e.end < dateTime).FirstOrDefault();
    }

    public DateTime GetLastEventEndTime()
    {
        return GrandPrixSchedules.OrderBy(e => e.start).Last().end;
    }

    public DateTime GetFirstEventStartTime()
    {
        return GrandPrixSchedules.OrderBy(e => e.start).First().start;
    }

    public string? GetApiPath(GrandPrixSchedule schedule)
    {
        GrandPrixSchedule ev = GrandPrixSchedules.OrderBy(e => e.start).LastOrDefault();
        if (ev == null)
        {
            return default;
        }

        string path = string.Format("{0}/{1}-{2}-{3}_{4}_Grand_Prix/{5}-{6}-{7}_", season, ev.start.Year, ev.start.Month, ev.start.Day, this.path, schedule.start.Year, schedule.start.Month, schedule.start.Day);
        string raceTypeToEndpoint = schedule.type switch
        {
            RaceType.Qualifying => "Qualifying",
            RaceType.FP3 => "Practice_3",
            RaceType.FP2 => "Practice_2",
            RaceType.FP1 => "Practice_1",
            RaceType.Sprint => "Sprint",
            RaceType.SprintQualifying => "Sprint_Qualifying",
            RaceType.SprintShootout => "Sprint_Shootout",
            _ => "Race"
        };

        path += raceTypeToEndpoint;

        Console.WriteLine(path);
        return path;
    }
}