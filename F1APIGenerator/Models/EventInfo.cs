using F1.Models;

namespace F1APIGenerator.Models;

// event-tracker/meeting/1255

public class EventInfo
{
    public string raceHubId { get; set; }
    public string locale { get; set; }
    public DateTime createdAt { get; set; }
    public DateTime updatedAt { get; set; }
    public string fomRaceId { get; set; }
    public string brandColourHexadecimal { get; set; }
    public CircuitSmallimage circuitSmallImage { get; set; }
    public object[] links { get; set; }
    public Seasoncontext seasonContext { get; set; }
    public RaceResult[] raceResults { get; set; } // if the race has finished the top 3 will be here.
    public Race race { get; set; } // Race matching this eventid.
    public string seasonYearImage { get; set; }
    public MeetingContext meetingContext { get; set; } // Race timetable matching this eventid. Not available if a race has already occured.
}

public class MeetingContext
{
    public uint season { get; set; }
    public uint meetingKey { get; set; }
    public bool isTestEvent { get; set; }
    public string state { get; set; }
    public string seasonState { get; set; }
    public Timetable[] timetables { get; set; }
}

public class RaceResult
{
    public string driverTLA { get; set; }
    public string driverFirstName { get; set; }
    public string driverLastName { get; set; }
    public string teamName { get; set; }
    public string positionNumber { get; set; }
    public string raceTime { get; set; }
    public string gapToLeader { get; set; }
    public string driverImage { get; set; }
    public string teamColourCode { get; set; }
    public string driverNameFormat { get; set; }
}

public class CircuitSmallimage
{
    public string title { get; set; }
    public string path { get; set; }
    public string url { get; set; }
    public string public_id { get; set; }
    public string raw_transformation { get; set; }
    public int width { get; set; }
    public int height { get; set; }
}

public class Seasoncontext
{
    public string id { get; set; }
    public string contentType { get; set; }
    public DateTime createdAt { get; set; }
    public DateTime updatedAt { get; set; }
    public string locale { get; set; }
    public string seasonYear { get; set; }
    public string currentOrNextMeetingKey { get; set; }
    public string state { get; set; }
    public string eventState { get; set; }
    public string liveEventId { get; set; }
    public string liveTimingsSource { get; set; }
    public Liveblog liveBlog { get; set; }
    public string seasonState { get; set; }
    public int raceListingOverride { get; set; }
    public int driverAndTeamListingOverride { get; set; }
    public Timetable[] timetables { get; set; }
    public string replayBaseUrl { get; set; }
    public int seasonContextUIState { get; set; }
}

public class Liveblog
{
    public string contentType { get; set; }
    public string title { get; set; }
    public string host { get; set; }
    public string projectId { get; set; }
    public string eventId { get; set; }
    public string eventUrl { get; set; }
}

public class Timetable
{
    public string session { get; set; }
    public SessionType description { get; set; }
    public DateTime startTime { get; set; }
    public DateTime endTime { get; set; }
    public string gmtOffset { get; set; }
    public string state { get; set; }
    public string sessionType { get; set; }
    public uint sessionNumber { get; set; }
    public string sessionStatus { get; set; }
}

public class Race
{
    public string meetingLocation { get; set; }
    public string meetingCountryName { get; set; }
    public DateTime meetingStartDate { get; set; }
    public string meetingOfficialName { get; set; }
    public DateTime meetingEndDate { get; set; }
    public string url { get; set; }
}