using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace F1.Models;

[Table("events_awards")]
[PrimaryKey("Key")]
public class EventAward
{
    public string Key { get; set; }
    public int EventKey { get; set; }

    public RewardType RewardType { get; set; }

    public string Title { get; set; }
    public string Winner { get; set; }
    public int Time { get; set; }
}