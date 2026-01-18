namespace F1.Discord.F1LiveTelemetry;

internal class RaceControlMessage
{
	public DateTime Utc { get; set; }
	public string? Category { get; set; } = null!;
    public string? RacingNumber { get; set; } = null!;

    public int Lap { get; set; }

	public int Sector { get; set; }
	public string? Flag { get; set; } = null!;
    public string? Scope { get; set; } = null!;
    public string? Message { get; set; } = null!;
}