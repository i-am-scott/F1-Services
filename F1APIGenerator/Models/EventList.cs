using F1.Models;

namespace F1APIGenerator.Models;

// editorial-eventlisting/events?season=2025

public class EventList
{
    public string seasonFromEventListing { get; set; }
    public string heading { get; set; }
    public string subHeading { get; set; }
    public string seoBodyText { get; set; }
    public Seolink[] seoLinks { get; set; }
    public Promotion[] promotions { get; set; }
    public Archiveyearimage archiveYearImage { get; set; }
    public string nextSeasonCalendarTitle { get; set; }
    public string nextSeasonCalendarSubTitle { get; set; }
    public string nextSeasonCalendarYear { get; set; }
    public string seoTitle { get; set; }
    public string seoDescription { get; set; }
    public string seasonState { get; set; }
    public string year { get; set; }
    public string currentSeasonContextYear { get; set; }
    public string raceListingOverride { get; set; }
    public string state { get; set; }
    public Event[] events { get; set; }
    public string seasonCalendarLink { get; set; }
    public int previousSeason { get; set; }
}

public class Archiveyearimage
{
    public string title { get; set; }
    public string path { get; set; }
    public string url { get; set; }
    public string public_id { get; set; }
    public string raw_transformation { get; set; }
    public int width { get; set; }
    public int height { get; set; }
}

public class Seolink
{
    public string linkId { get; set; }
    public string linkText { get; set; }
    public string url { get; set; }
    public Image image { get; set; }
}

public class Promotion
{
    public string name { get; set; }
    public Promoimage promoImage { get; set; }
    public Promologoimage promoLogoImage { get; set; }
    public string promoHeaderText { get; set; }
    public string promoBodyText { get; set; }
    public string promoCtaLabel { get; set; }
    public string promoCtaLink { get; set; }
    public bool openNewWindow { get; set; }
    public string layout { get; set; }
}

public class Promoimage
{
    public string title { get; set; }
    public string path { get; set; }
    public string url { get; set; }
    public string public_id { get; set; }
    public string raw_transformation { get; set; }
}

public class Promologoimage
{
    public string title { get; set; }
    public string path { get; set; }
    public string url { get; set; }
    public string public_id { get; set; }
    public string raw_transformation { get; set; }
}

public class Event
{
    public string meetingName { get; set; }
    public string meetingOfficialName { get; set; }
    public DateTime meetingStartDate { get; set; }
    public DateTime meetingEndDate { get; set; }
    public Location meetingLocation { get; set; }
    public uint meetingKey { get; set; }
    public Location meetingCountryName { get; set; }
    public Location meetingIsoCountryName { get; set; }
    public string meetingCountryCode { get; set; }
    public uint countryKey { get; set; }
    public string url { get; set; }
    public string countryFlag { get; set; }
    public string gmtOffset { get; set; }
    public string type { get; set; }
    public Eventstatusoverride eventStatusOverride { get; set; }
    public Thumbnail thumbnail { get; set; }
    public string circuitSmallImage { get; set; }
    public string circuitMediumImage { get; set; }
    public string roundText { get; set; }
    public string status { get; set; }
}

public class Eventstatusoverride
{
    public uint meetingKey { get; set; }
    public Session[] sessions { get; set; }
    
    // not sure what this is used for. Always seems to be empty?
    // public Event event { get; set; }
}

public class Session
{
    public string label { get; set; }
    public string status { get; set; }
    public string session { get; set; }
}

public class Thumbnail
{
    public Image image { get; set; }
}

public class Image
{
    public string path { get; set; }
    public string url { get; set; }
    public string title { get; set; }

    public string public_id { get; set; }
    public string raw_transformation { get; set; }
    public int width { get; set; }
    public int height { get; set; }
}









