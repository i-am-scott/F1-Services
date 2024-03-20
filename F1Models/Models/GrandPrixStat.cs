using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace F1.Models;

[Table("grandprix_stats")]
[PrimaryKey("id")]
internal class GrandPrixStat
{
    public int id { get; set; }
    public GrandPrix grandprix { get; set; }
    public required string name { get; set; }
    public required string value { get; set; }
}