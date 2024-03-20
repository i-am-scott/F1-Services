using System.Text.Json;

namespace F1LiveTelemetry.SignalR;

internal class Listener
{
    internal string? Name;
    internal Action<JsonElement> Action;

    public Listener(string name, Action<JsonElement> action)
    {
        Name = name;
        Action = action;
    }
}
