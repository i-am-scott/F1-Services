using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace F1.Models;

[Table("constructors")]
[PrimaryKey("Season", "TeamKey")]
public class Constructor
{
    public int Season { get; set; }
    public int TeamKey { get; set; }
    public int Position { get; set; }
    public int Points { get; set; }
}