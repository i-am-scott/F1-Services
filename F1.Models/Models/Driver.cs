using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace F1.Models;

[Table("drivers")]
[PrimaryKey("RacingNumber")]
public class Driver
{
    public int Season { get; set; }
    public int RacingNumber { get; set; }
    public int Key { get; set; }
    public int TeamKey { get; set; }

    public string TLA { get; set; }

    public string FirstName { get; set; }
    public string LastName { get; set; }

    public Location Nationality { get; set; }

    public string? Image { get; set; } = null!;
    public string? Profile { get; set; } = null!;
}