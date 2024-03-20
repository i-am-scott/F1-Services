using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace F1.Models;

[Table("drivers")]
[PrimaryKey("number")]
public class Driver
{
    public ulong number { get; set; }
    public string ticker { get; set; }
    public string firstname { get; set; }
    public string lastname { get; set; }
    public Nationality nationality { get; set; }
    public uint titles { get; set; }
    public string? url { get; set; }
    public DateTime dob { get; set; }
}