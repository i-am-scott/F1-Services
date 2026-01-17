using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace F1.Models;

[Table("events_awards")]
[PrimaryKey("Key")]
public class EventAward
{
    public required string Key { get; set; }
    public required uint EventKey { get; set; }

    public RewardType RewardType { get; set; }

    public required string Title { get; set; }
    public required string Winner { get; set; }
    public uint Time { get; set; }
}
