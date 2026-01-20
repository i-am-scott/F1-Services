using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace F1.Models;

[Table("events")]
[PrimaryKey("Key")]
internal class Event
{
    public int Key { get; set; }
    public int Season { get; set; }

    public required string Name { get; set; }
    public required string OfficialName { get; set; }

    public Location Location { get; set; }

    public DateTime Start { get; set; }
    public DateTime End { get; set; }

    public int TimeOffset { get; set; }

    public string? Profile { get; set; }
    public string? Circuit { get; set; } = default;

    public DateTime Weekend => Start.Date;
    public DateTime WeekendEnd => End.Date.AddDays(1).AddTicks(-1);

    public List<EventSchedule> EventSchedules { get; set; } = new List<EventSchedule>();

    public bool IsCurrentWeekend()
    {
        DateTime dateTime = DateTime.UtcNow.Date;
        return dateTime >= Start.AddHours(-1) && dateTime < End.AddHours(1);
    }

    public EventSchedule? GetLastEvent()
    {
        DateTime dateTime = DateTime.UtcNow;
        return EventSchedules.Where(e => e.End <= dateTime).OrderByDescending(e => e.End).FirstOrDefault();
    }

    public EventSchedule? GetNextEvent()
    {
        DateTime dateTime = DateTime.UtcNow;
        return EventSchedules.Where(e => e.Start >= dateTime).OrderBy(e => e.Start).FirstOrDefault();
    }

    public EventSchedule? GetCurrentEvent()
    {
        DateTime dateTime = DateTime.UtcNow;
        return EventSchedules.Where(e => e.Start >= dateTime && e.End < dateTime).FirstOrDefault();
    }

    public DateTime GetLastEventEndTime()
    {
        return EventSchedules.OrderBy(e => e.Start).Last().End;
    }

    public DateTime GetFirstEventStartTime()
    {
        return EventSchedules.OrderBy(e => e.Start).First().Start;
    }

    public string? GetApiPath(EventSchedule schedule)
    {
        EventSchedule? ev = EventSchedules.OrderBy(e => e.Start).LastOrDefault();
        if (ev == null)
        {
            return default;
        }

        string path = string.Format("{0}/{1}-{2}-{3}_{4}_Grand_Prix/{5}-{6}-{7}_", Season, ev.Start.Year, ev.Start.Month, ev.Start.Day, this.Profile, schedule.Start.Year, schedule.Start.Month, schedule.Start.Day);
        string raceTypeToEndpoint = schedule.SessionTypeEndpoint;

        path += raceTypeToEndpoint;
        return path;
    }
}