using F1.Models;

namespace F1APIGenerator.Models;

// editorial-driverlisting/listing

public class DriverList
{
    public uint season { get; set; }
    public string title { get; set; }
    public string seoTitle { get; set; }
    public string seoDescription { get; set; }
    public Promotion[] promotions { get; set; }
    public string seasonState { get; set; }
    public uint year { get; set; }
    public string driverStandingLength { get; set; }
    public Driver[] drivers { get; set; }
}

public class Driver
{
    public uint? racingNumber { get; set; }
    public uint driverCurrentRacingNumber { get; set; }

    public uint positionValue { get; set; }
    public uint positionNumber { get; set; }
    public uint championshipPoints { get; set; }

    public string driverFirstName { get; set; }
    public string driverLastName { get; set; }
    public string driverReference { get; set; } // REFID LANNOR01
    public string driverNameFormat { get; set; } // FirstNameIsPrimary LastNameIsPrimary
    public Location driverCountry { get; set; } // GBR
    public string driverCountryCode { get; set; } // GBR
    public uint driverCountryKey { get; set; } // Lando = 2 (no idea what this is? Maybe an index to country info from another API? 2 = GBR?)
    public string driverTLA { get; set; } // short code "NOR"
    public uint driverKey { get; set; } // Internal driver key for another API
    public uint teamKey { get; set; } // Internal team key for another API
    public string teamName { get; set; }   // McLaren
    public string teamColourCode { get; set; } // Hex code without the #
    public string? driverImage { get; set; } // direct media.formula1.com link to a driver image.
    public string? driverPodiumImage { get; set; } // winner image
    public string? driverPageUrl { get; set; } // direct page to driver info
    public string? driverCountryFlagImage { get; set; }
    public string? driverNumberImage { get; set; }
}