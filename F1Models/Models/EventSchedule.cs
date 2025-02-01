using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace F1.Models;

[Table("events_schedule")]
[PrimaryKey("Key")]
internal class EventSchedule
{
    public string Key { get; set; }

    public uint EventKey { get; set; }
    public SessionType Session { get; set; }

    public DateTime Start { get; set; }
    public DateTime End { get; set; }

    public string SessionTypeString => Session switch
    {
        SessionType.Qualifying => "Qualifying",
        SessionType.Practice3 => "Free Practice 3",
        SessionType.Practice2 => "Free Practice 2",
        SessionType.Practice1 => "Free Practice 1",
        SessionType.Sprint => "Sprint",
        SessionType.SprintQualifying => "Sprint Qualifying",
        SessionType.SprintShootout => "Sprint Shootout",
        _ => "Race"
    };

    public string SessionTypeEndpoint => Session switch
    {
        SessionType.Qualifying => "Qualifying",
        SessionType.Practice3 => "Practice_3",
        SessionType.Practice2 => "Practice_2",
        SessionType.Practice1 => "Practice_1",
        SessionType.Sprint => "Sprint",
        SessionType.SprintQualifying => "Sprint_Qualifying",
        SessionType.SprintShootout => "Sprint_Shootout",
        _ => "Race"
    };

    public string Status { get; set; }
    public ScheduleStatus ScheduleStatus => Status switch
    {
        "TBC" => ScheduleStatus.TBC,
        "CANCELLED" => ScheduleStatus.CANCELLED,
        "CONFIRMED" => ScheduleStatus.CONFIRMED,
        _ => ScheduleStatus.TBC,
    };

    [ForeignKey("EventKey"), JsonIgnore]
    public Event? Event { get; set; }
}