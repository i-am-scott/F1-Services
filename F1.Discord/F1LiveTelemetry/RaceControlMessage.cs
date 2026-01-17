namespace F1.Discord.F1LiveTelemetry;

internal class RaceControlMessage
{
	public DateTime Utc { get; set; }
	public string Category { get; set; }
	public string RacingNumber { get; set; }

	public int Lap { get; set; }

	public int Sector { get; set; }
	public string Flag { get; set; }
	public string Scope { get; set; }
	public string Message { get; set; }
}