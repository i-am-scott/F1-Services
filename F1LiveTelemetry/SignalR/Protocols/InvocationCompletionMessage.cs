namespace Connector.SignalR.Protocol;

public class InvocationCompletionMessage : CompletionMessage
{
    public InvocationCompletionMessage(string invocationId, string? error, object? result, bool hasResult) : base(invocationId, error, result, hasResult)
    {

    }
}