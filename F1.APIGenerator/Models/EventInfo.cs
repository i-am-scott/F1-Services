using F1.Models;

namespace F1.APIGenerator.Models;

// event-tracker/meeting/1255

public class EventInfo
{
	public required string raceHubId { get; set; }
	public required string locale { get; set; }
	public DateTime createdAt { get; set; }
	public DateTime updatedAt { get; set; }
	public required string fomRaceId { get; set; }
	public required string brandColourHexadecimal { get; set; }
	public CircuitSmallimage? circuitSmallImage { get; set; }
	public object[]? links { get; set; }
	public Seasoncontext? seasonContext { get; set; }
	public RaceResult[]? raceResults { get; set; } // if the race has finished the top 3 will be here.
	public required Race race { get; set; } // Race matching this eventid.
	public required string seasonYearImage { get; set; }
	public MeetingContext? meetingContext { get; set; } // Race timetable matching this eventid. Not available if a race has already occured.
}

public class MeetingContext
{
	public uint season { get; set; }
	public uint meetingKey { get; set; }
	public bool isTestEvent { get; set; }
	public required string state { get; set; }
	public required string seasonState { get; set; }
	public Timetable[]? timetables { get; set; }
}

public class RaceResult
{
	public required string driverTLA { get; set; }
	public required string driverFirstName { get; set; }
	public required string driverLastName { get; set; }
	public required string teamName { get; set; }
	public required string positionNumber { get; set; }
	public required string raceTime { get; set; }
	public required string gapToLeader { get; set; }
	public required string driverImage { get; set; }
	public required string teamColourCode { get; set; }
	public required string driverNameFormat { get; set; }
}

public class CircuitSmallimage
{
	public required string title { get; set; }
	public required string path { get; set; }
	public required string url { get; set; }
	public required string public_id { get; set; }
	public required string raw_transformation { get; set; }
	public int width { get; set; }
	public int height { get; set; }
}

public class Seasoncontext
{
	public required string id { get; set; }
	public required string contentType { get; set; }
	public DateTime createdAt { get; set; }
	public DateTime updatedAt { get; set; }
	public required string locale { get; set; }
	public required string seasonYear { get; set; }
	public required string currentOrNextMeetingKey { get; set; }
	public required string state { get; set; }
	public required string eventState { get; set; }
	public required string liveEventId { get; set; }
	public required string liveTimingsSource { get; set; }
	public Liveblog? liveBlog { get; set; }
	public required string seasonState { get; set; }
	public int raceListingOverride { get; set; }
	public int driverAndTeamListingOverride { get; set; }
	public Timetable[]? timetables { get; set; }
	public required string replayBaseUrl { get; set; }
	public int seasonContextUIState { get; set; }
}

public class Liveblog
{
	public required string contentType { get; set; }
	public required string title { get; set; }
	public required string host { get; set; }
	public required string projectId { get; set; }
	public required string eventId { get; set; }
	public required string eventUrl { get; set; }
}

public class Timetable
{
	public required string session { get; set; }
	public SessionType description { get; set; }
	public DateTime startTime { get; set; }
	public DateTime endTime { get; set; }
	public required string gmtOffset { get; set; }
	public required string state { get; set; }
	public required string sessionType { get; set; }
	public uint sessionNumber { get; set; }
	public required string sessionStatus { get; set; }
}

public class Race
{
	public required string meetingLocation { get; set; }
	public required string meetingCountryName { get; set; }
	public DateTime meetingStartDate { get; set; }
	public required string meetingOfficialName { get; set; }
	public DateTime meetingEndDate { get; set; }
	public required string url { get; set; }
}