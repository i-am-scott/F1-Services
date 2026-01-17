using System.Text.Json.Serialization;

namespace F1.LiveTelemetry.SignalR;

public class HubConnection
{
	public string Name { get; set; }

	[JsonIgnore]
	private SignalRProcessor processor;

	[JsonIgnore]
	public SignalRProcessor Processor { get => processor; }

	public HubConnection(string name, SignalRProcessor _processor)
	{
		Name = name;
		processor = _processor;
	}
}