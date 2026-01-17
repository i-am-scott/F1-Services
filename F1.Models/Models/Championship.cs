using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace F1.Models;

[Table("championship")]
[PrimaryKey("DriverKey")]
public class Championship
{
    public uint Season { get; set; }
    public uint TeamKey { get; set; }
    public uint DriverKey { get; set; }
    public uint Position { get; set; }
    public uint Points { get; set; }
}