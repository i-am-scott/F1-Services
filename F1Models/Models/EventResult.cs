using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace F1.Models;

[Table("events_results")]
[PrimaryKey("Key")]
internal class EventResult
{
    public string Key { get; set; }
    public uint EventKey { get; set; }
    public uint DriverKey { get; set; }

    public uint Position { get; set; }

    public uint? Points { get; set; }
    public uint? Laps { get; set; }
    public uint? Time { get; set; }
}