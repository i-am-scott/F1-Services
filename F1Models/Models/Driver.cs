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

    public string TLA { get; set; }

    public string FirstName { get; set; }
    public string LastName { get; set; }

    public Location Nationality { get; set; }

    public string? Image { get; set; }
    public string? Profile { get; set; }
}