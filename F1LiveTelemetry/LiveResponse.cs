﻿namespace F1LiveTelemetry;

internal class Heartbeat
{
    public DateTime Utc { get; set; }
}

internal class RaceControlMessage
{
    public DateTime Utc { get; set; }
    public string Category { get; set; }
    public string RacingNumber { get; set; }

    public string Flag { get; set; }
    public string Scope { get; set; }
    public string Message { get; set; }
}

internal class RaceControlMessages
{
    public List<RaceControlMessage> Messages { get; set; }
}

internal class LiveResponse
{
    public RaceControlMessages RaceControlMessages { get; set; }
    public Heartbeat? Heartbeat { get; set; }
}
