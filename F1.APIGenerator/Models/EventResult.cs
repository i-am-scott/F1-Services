using F1.Models;

namespace F1.APIGenerator.Models;

public class EventResults
{
	public RaceresultsRace raceResultsRace { get; set; }
	public Meeting meeting { get; set; }
	public uint year { get; set; }
	public string seasonState { get; set; }
	public string footnote { get; set; }
}

public class RaceresultsRace
{
	public string session { get; set; }
	public string description { get; set; }
	public DateTime startTime { get; set; }
	public DateTime endTime { get; set; }
	public string gmtOffset { get; set; }
	public string state { get; set; }
	public SessionType sessionType { get; set; }
	public uint sessionNumber { get; set; }
	public Result[] results { get; set; }
	public Award[] awards { get; set; }
}

public class Result
{
	public string completionStatusCode { get; set; }
	public uint racePoints { get; set; }
	public string version { get; set; }
	public string gapToLeader { get; set; }
	public string gapToPrevious { get; set; }
	public string lapsBehindLeader { get; set; }
	public string positionValue { get; set; }
	public string positionNumber { get; set; }
	public uint? lapsCompleted { get; set; }
	public string raceTime { get; set; }
	public uint racingNumber { get; set; }
	public string constructorSeasonName { get; set; }
	public string driverFirstName { get; set; }
	public string driverLastName { get; set; }
	public string driverReference { get; set; }
	public string driverNameFormat { get; set; }
	public string driverTLA { get; set; }
	public uint driverKey { get; set; }
	public uint teamKey { get; set; }
	public string teamName { get; set; }
	public string teamColourCode { get; set; }
	public string driverImage { get; set; }
	public string driverPodiumImage { get; set; }
}

public class Award
{
	public string itemTitle { get; set; }
	public uint fomRaceId { get; set; }
	public string awardName { get; set; }
	public string winnerName { get; set; }
	public string winnerTime { get; set; }
	public RewardType type { get; set; }
}

public class Meeting
{
	public string circuitOfficialName { get; set; }
	public string meetingCountryName { get; set; }
	public string meetingEndDate { get; set; }
	public string meetingKey { get; set; }
	public string meetingLocation { get; set; }
	public string meetingName { get; set; }
	public string meetingOfficialName { get; set; }
	public string meetingSponsor { get; set; }
	public string meetingStartDate { get; set; }
	public string season { get; set; }
}
