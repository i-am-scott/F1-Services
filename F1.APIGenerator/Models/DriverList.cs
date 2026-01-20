using F1.Models;

namespace F1.APIGenerator.Models;

// editorial-driverlisting/listing

public class DriverList
{
	public int season { get; set; }
	public string title { get; set; }
	public string seoTitle { get; set; }
	public string seoDescription { get; set; }
	public Promotion[]? promotions { get; set; }
	public string seasonState { get; set; }
	public int year { get; set; }
	public string? driverStandingLength { get; set; } = null!;
	public Driver[] drivers { get; set; }
}

public class Driver
{
	public int? racingNumber { get; set; }
	public int driverCurrentRacingNumber { get; set; }

	public int positionValue { get; set; }
	public int positionNumber { get; set; }
	public int championshipPoints { get; set; }

	public string? driverFirstName { get; set; }
	public string? driverLastName { get; set; }
	public string? driverReference { get; set; } // REFID LANNOR01
	public string? driverNameFormat { get; set; } // FirstNameIsPrimary LastNameIsPrimary
	public Location driverCountry { get; set; } // GBR
	public string? driverCountryCode { get; set; } // GBR
	public uint driverCountryKey { get; set; } // Lando = 2 (no idea what this is? Maybe an index to country info from another API? 2 = GBR?)
	public string? driverTLA { get; set; } // short code "NOR"
	public int driverKey { get; set; } // Internal driver key for another API
	public int teamKey { get; set; } // Internal team key for another API
	public string? teamName { get; set; }   // McLaren
	public string? teamColourCode { get; set; } // Hex code without the #
	public string? driverImage { get; set; } // direct media.formula1.com link to a driver image.
	public string? driverPodiumImage { get; set; } // winner image
	public string? driverPageUrl { get; set; } // direct page to driver info
	public string? driverCountryFlagImage { get; set; }
	public object? driverNumberImage { get; set; }
}