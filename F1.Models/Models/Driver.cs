using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace F1.Models;

[Table("drivers")]
[PrimaryKey("RacingNumber")]
public class Driver
{
    public uint Season { get; set; }
    public uint RacingNumber { get; set; }
    public uint Key { get; set; }
    public uint TeamKey { get; set; }

    public required string TLA { get; set; }

    public required string FirstName { get; set; }
    public required string LastName { get; set; }

    public Location Nationality { get; set; }

    public string? Image { get; set; } = null!;
    public string? Profile { get; set; } = null!;
}