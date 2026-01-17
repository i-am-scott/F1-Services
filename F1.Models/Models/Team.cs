using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace F1.Models;

[Table("teams")]
[PrimaryKey("Season", "Key")]
internal class Team
{
    public uint Season { get; set; }  
    public uint Key { get; set; }

    public required string Name { get; set; }
    public string? Color { get; set; }
    public string? Icon { get; set; }
    public string? Profile { get; set; }
}