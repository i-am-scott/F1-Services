using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace F1.Models;

[Table("constructors")]
[PrimaryKey("Season", "TeamKey")]
public class Constructor
{
    public uint Season { get; set; }
    public uint TeamKey { get; set; }
    public uint Position { get; set; }
    public uint Points { get; set; }
}