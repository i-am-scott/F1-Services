using F1.Models;

namespace F1.APIGenerator.Models;

// editorial-eventlisting/events?season=2025

public class EventList
{
    public required string seasonFromEventListing { get; set; }
    public required string heading { get; set; }
    public required string subHeading { get; set; }
    public required string seoBodyText { get; set; }
    public Seolink[]? seoLinks { get; set; }
    public Promotion[]? promotions { get; set; }
    public Archiveyearimage? archiveYearImage { get; set; }
    public required string nextSeasonCalendarTitle { get; set; }
    public required string nextSeasonCalendarSubTitle { get; set; }
    public required string nextSeasonCalendarYear { get; set; }
    public required string seoTitle { get; set; }
    public required string seoDescription { get; set; }
    public required string seasonState { get; set; }
    public required string year { get; set; }
    public required string currentSeasonContextYear { get; set; }
    public required string raceListingOverride { get; set; }
    public required string state { get; set; }
    public Event[]? events { get; set; }
    public required string seasonCalendarLink { get; set; }
    public int previousSeason { get; set; }
}

public class Archiveyearimage
{
    public required string title { get; set; }
    public required string path { get; set; }
    public required string url { get; set; }
    public required string public_id { get; set; }
    public required string raw_transformation { get; set; }
    public int width { get; set; }
    public int height { get; set; }
}

public class Seolink
{
    public required string linkId { get; set; }
    public required string linkText { get; set; }
    public required string url { get; set; }
    public Image? image { get; set; }
}

public class Promotion
{
    public required string name { get; set; }
    public Promoimage? promoImage { get; set; }
    public Promologoimage? promoLogoImage { get; set; }
    public required string promoHeaderText { get; set; }
    public required string promoBodyText { get; set; }
    public required string promoCtaLabel { get; set; }
    public required string promoCtaLink { get; set; }
    public bool openNewWindow { get; set; }
    public required string layout { get; set; }
}

public class Promoimage
{
    public required string title { get; set; }
    public required string path { get; set; }
    public required string url { get; set; }
    public required string public_id { get; set; }
    public required string raw_transformation { get; set; }
}

public class Promologoimage
{
    public required string title { get; set; }
    public required string path { get; set; }
    public required string url { get; set; }
    public required string public_id { get; set; }
    public required string raw_transformation { get; set; }
}

public class Event
{
    public required string meetingName { get; set; }
    public required string meetingOfficialName { get; set; }
    public DateTime meetingStartDate { get; set; }
    public DateTime meetingEndDate { get; set; }
    public Location meetingLocation { get; set; }
    public uint meetingKey { get; set; }
    public Location meetingCountryName { get; set; }
    public Location meetingIsoCountryName { get; set; }
    public required string meetingCountryCode { get; set; }
    public uint countryKey { get; set; }
    public required string url { get; set; }
    public required string countryFlag { get; set; }
    public required string gmtOffset { get; set; }
    public required string type { get; set; }
    public Eventstatusoverride? eventStatusOverride { get; set; }
    public Thumbnail? thumbnail { get; set; }
    public required string circuitSmallImage { get; set; }
    public required string circuitMediumImage { get; set; }
    public required string roundText { get; set; }
    public required string status { get; set; }
}

public class Eventstatusoverride
{
    public uint meetingKey { get; set; }
    public Session[]? sessions { get; set; }

    // not sure what this is used for. Always seems to be empty?
    // public Event event { get; set; }
}

public class Session
{
    public required string label { get; set; }
    public required string status { get; set; }
    public required string session { get; set; }
}

public class Thumbnail
{
    public required Image image { get; set; }
}

public class Image
{
    public required string path { get; set; }
    public required string url { get; set; }
    public required string title { get; set; }

    public required string public_id { get; set; }
    public required string raw_transformation { get; set; }
    public int width { get; set; }
    public int height { get; set; }
}









