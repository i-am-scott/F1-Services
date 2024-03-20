namespace F1LiveTelemetry.SignalR;

public class InvocationResponse<T>
{
    public bool IsError => ErrorMessage is not null;
    public string? ErrorMessage { get; set; }

    public bool HasValue => Response is not null;
    public T? Response { get; set; }
}
