using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace F1.Models;

[Table("championship")]
[PrimaryKey("DriverKey")]
public class Championship
{
    public int Season { get; set; }
    public int TeamKey { get; set; }
    public int DriverKey { get; set; }
    public int Position { get; set; }
    public int Points { get; set; }
}