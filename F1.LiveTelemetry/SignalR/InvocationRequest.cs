using Connector.SignalR.Protocol;

namespace F1.LiveTelemetry.SignalR;

internal class InvocationRequest
{
	public string? InvocationId;

	public InvocationMessage? RequestMessage;
	public TaskCompletionSource<CompletionMessage?>? TaskPromise;

	public Type ResponseType { get; }
	public CompletionMessage? CompletionMessage;

	public InvocationRequest(Type _responseType)
	{
		ResponseType = _responseType;
	}
}