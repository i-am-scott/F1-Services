using F1.Models;

namespace F1.APIGenerator.Models;

// editorial-driverlisting/listing

public class DriverList
{
	public required uint season { get; set; }
	public required string title { get; set; }
	public required string seoTitle { get; set; }
	public required string seoDescription { get; set; }
	public required Promotion[]? promotions { get; set; }
	public required string seasonState { get; set; }
	public required uint year { get; set; }
	public required string driverStandingLength { get; set; }
	public required Driver[] drivers { get; set; }
}

public class Driver
{
	public uint? racingNumber { get; set; }
	public uint driverCurrentRacingNumber { get; set; }

	public uint positionValue { get; set; }
	public uint positionNumber { get; set; }
	public uint championshipPoints { get; set; }

	public required string driverFirstName { get; set; }
	public required string driverLastName { get; set; }
	public required string driverReference { get; set; } // REFID LANNOR01
	public required string driverNameFormat { get; set; } // FirstNameIsPrimary LastNameIsPrimary
	public Location driverCountry { get; set; } // GBR
	public required string driverCountryCode { get; set; } // GBR
	public required uint driverCountryKey { get; set; } // Lando = 2 (no idea what this is? Maybe an index to country info from another API? 2 = GBR?)
	public required string driverTLA { get; set; } // short code "NOR"
	public uint driverKey { get; set; } // Internal driver key for another API
	public uint teamKey { get; set; } // Internal team key for another API
	public required string teamName { get; set; }   // McLaren
	public required string teamColourCode { get; set; } // Hex code without the #
	public string? driverImage { get; set; } // direct media.formula1.com link to a driver image.
	public string? driverPodiumImage { get; set; } // winner image
	public string? driverPageUrl { get; set; } // direct page to driver info
	public string? driverCountryFlagImage { get; set; }
	public string? driverNumberImage { get; set; }
}