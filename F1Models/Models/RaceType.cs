namespace F1.Models;

internal enum RaceType
{
    Race,
    FP1,
    FP2,
    FP3,
    Qualifying,
    Sprint,
    SprintQualifying,
    SprintShootout
}

internal class RaceResult
{
    public const string Race = "race-result";
    public const string Qualifying = "qualifying";
    public const string FP1 = "practice-1";
    public const string FP2 = "practice-2";
    public const string FP3 = "practice-3";
    public const string PitStopSummary = "pit-stop-summary";
    public const string FastestLaps = "fastest-laps";
    public const string StartingGrid = "starting-grid";
    public const string SprintGrid = "sprint-grid";
    public const string Sprint = "sprint-results";
}