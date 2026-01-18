namespace F1.APIGenerator.Models;

// editorial-constructorlisting/listing
public class ConstructorList
{
	public uint season { get; set; }
	public required string title { get; set; }
	public required string seoTitle { get; set; }
	public required string seoDescription { get; set; }
	public Promotion[]? promotions { get; set; }
	public required string seasonState { get; set; }
	public uint year { get; set; }
	public required string constructorStandingLength { get; set; }
	public Constructor[]? constructors { get; set; }
}

public class Constructor
{
	public uint positionValue { get; set; }
	public uint positionNumber { get; set; }
	public required string constructorSeasonName { get; set; }
	public uint championshipPoints { get; set; }
	public uint seasonPoints { get; set; }
	public uint teamKey { get; set; }
	public required string teamName { get; set; }
	public string? teamColourCode { get; set; } = null!;
	public required Driver[] drivers { get; set; }
	public required string teamPageUrl { get; set; }
	public required string teamImage { get; set; }
	public required string teamCroppedImage { get; set; }
	public required string teamLogoImage { get; set; }
	public required string teamNegativeLogoImage { get; set; }
	public required string webTeamLogoImage { get; set; }
	public required string constructorSeasonNameKey { get; set; }
}