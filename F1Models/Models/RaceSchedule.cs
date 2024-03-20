using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace F1.Models;

[Table("grandprix_schedule")]
[PrimaryKey("id")]
internal class GrandPrixSchedule
{
    public uint id { get; set; }
    public uint? grandprixid { get; set; }

    public RaceType type { get; set; }
    public string typestring => type switch
    {
        RaceType.Qualifying => "Qualifying",
        RaceType.FP3 => "Free Practice 3",
        RaceType.FP2 => "Free Practice 2",
        RaceType.FP1 => "Free Practice 1",
        RaceType.Sprint => "Sprint",
        RaceType.SprintQualifying => "Sprint Qualifying",
        RaceType.SprintShootout => "Sprint Shootout",
        _ => "Race"
    };

    public DateTime start { get; set; }
    public DateTime end { get; set; }

    public ScheduleStatus status { get; set; }

    [ForeignKey("grandprixid")]
    public GrandPrix grandprix { get; set; }
}