namespace F1LiveTelemetry.SignalR;

public partial class SignalRProcessor
{
    public event Func<Task>? OnHandshakeCompleted;
    public event Func<bool, Task>? OnCloseMessage;

    async Task OnHandshakeCompletedEvent()
    {
        if (OnHandshakeCompleted != null)
        {
            await OnHandshakeCompleted.Invoke();
        }
    }

    async Task OnCloseMessageEvent(bool reconnecting)
    {
        if (OnCloseMessage != null)
        {
            await OnCloseMessage.Invoke(reconnecting);
        }
    }
}