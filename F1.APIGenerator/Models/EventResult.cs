using F1.Models;

namespace F1.APIGenerator.Models;

public class EventResults
{
	public required RaceresultsRace raceResultsRace { get; set; }
	public required Meeting meeting { get; set; }
	public uint year { get; set; }
	public required string seasonState { get; set; }
	public required string footnote { get; set; }
}

public class RaceresultsRace
{
	public required string session { get; set; }
	public required string description { get; set; }
	public DateTime startTime { get; set; }
	public DateTime endTime { get; set; }
	public required string gmtOffset { get; set; }
	public required string state { get; set; }
	public SessionType sessionType { get; set; }
	public uint sessionNumber { get; set; }
	public required Result[] results { get; set; }
	public required Award[] awards { get; set; }
}

public class Result
{
	public required string completionStatusCode { get; set; }
	public uint racePoints { get; set; }
	public required string version { get; set; }
	public required string gapToLeader { get; set; }
	public required string gapToPrevious { get; set; }
	public required string lapsBehindLeader { get; set; }
	public required string positionValue { get; set; }
	public required string positionNumber { get; set; }
	public uint? lapsCompleted { get; set; }
	public required string raceTime { get; set; }
	public uint racingNumber { get; set; }
	public required string constructorSeasonName { get; set; }
	public required string driverFirstName { get; set; }
	public required string driverLastName { get; set; }
	public required string driverReference { get; set; }
	public required string driverNameFormat { get; set; }
	public required string driverTLA { get; set; }
	public uint driverKey { get; set; }
	public uint teamKey { get; set; }
	public required string teamName { get; set; }
	public required string teamColourCode { get; set; }
	public required string driverImage { get; set; }
	public required string driverPodiumImage { get; set; }
}

public class Award
{
	public required string itemTitle { get; set; }
	public uint fomRaceId { get; set; }
	public required string awardName { get; set; }
	public required string winnerName { get; set; }
	public required string winnerTime { get; set; }
	public RewardType type { get; set; }
}

public class Meeting
{
	public required string circuitOfficialName { get; set; }
	public required string meetingCountryName { get; set; }
	public required string meetingEndDate { get; set; }
	public required string meetingKey { get; set; }
	public required string meetingLocation { get; set; }
	public required string meetingName { get; set; }
	public required string meetingOfficialName { get; set; }
	public required string meetingSponsor { get; set; }
	public required string meetingStartDate { get; set; }
	public required string season { get; set; }
}