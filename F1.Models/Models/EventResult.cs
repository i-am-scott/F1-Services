using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace F1.Models;

[Table("events_results")]
[PrimaryKey("Key")]
internal class EventResult
{
    public int Key { get; set; }
    public string Session { get; set; }
    public int InternalPosition { get; set; }

    public int DriverKey { get; set; }
    public int Position { get; set; }

    public int Points { get; set; }
    public int Laps { get; set; }
    public int Time { get; set; }
}