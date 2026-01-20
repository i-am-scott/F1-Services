namespace F1.APIGenerator.Models;

// editorial-constructorlisting/listing
public class ConstructorList
{
	public int season { get; set; }
	public string? title { get; set; }
	public string? seoTitle { get; set; }
	public string? seoDescription { get; set; }
	public Promotion[]? promotions { get; set; }
	public string? seasonState { get; set; }
	public int year { get; set; }
	public string? constructorStandingLength { get; set; }
	public Constructor[]? constructors { get; set; }
}

public class Constructor
{
	public int positionValue { get; set; }
	public int positionNumber { get; set; }
	public string? constructorSeasonName { get; set; }
	public int championshipPoints { get; set; }
	public int seasonPoints { get; set; }
	public int teamKey { get; set; }
	public string? teamName { get; set; }
	public string? teamColourCode { get; set; } = null!;
	public Driver[]? drivers { get; set; }
	public string? teamPageUrl { get; set; }
	public string? teamImage { get; set; }
	public string? teamCroppedImage { get; set; }
	public string? teamLogoImage { get; set; }
	public string? teamNegativeLogoImage { get; set; }
	public string? webTeamLogoImage { get; set; }
	public string? constructorSeasonNameKey { get; set; }
}