using F1.Util;
using System.Net.WebSockets;
using System.Text;

namespace F1LiveTelemetry.SignalR;

internal sealed class WebSocket : IDisposable
{
    private static ClientWebSocket webSocket = new ClientWebSocket();

    public event Action<string>? OnMessageReceived;

    void EventMessageReceived(string message)
    {
        if (OnMessageReceived != null)
        {
            OnMessageReceived.Invoke(message);
        }
    }

    public event Func<byte[], Task>? OnDataReceived;
    async Task EventOnDataReceived(byte[] data)
    {
        if (OnDataReceived != null)
        {
            await OnDataReceived.Invoke(data);
        }
    }

    public event Action<int, string>? OnDisconnected;
    void EventOnDisconnected(int status, string message)
    {
        if (OnDisconnected != null)
        {
            OnDisconnected.Invoke(status, message);
        }
    }

    private int maxMessageSize = 65536;

    public string SubProtocol = "json";
    public bool IsConnected => webSocket != null && webSocket.State == WebSocketState.Open;

    internal WebSocket(int _maxMessageSize = 65536)
    {
        maxMessageSize = _maxMessageSize;
    }

    public void SetHeaders(Dictionary<string, string> headers)
    {
        foreach (var header in headers)
        {
            webSocket.Options.SetRequestHeader(header.Key, header.Value);
        }
    }

    public void SetHeader(string key, string value)
    {
        webSocket.Options.SetRequestHeader(key, value);
    }

    public async Task Connect(string url)
    {
        await webSocket.ConnectAsync(new Uri(url), CancellationToken.None);

        if (!IsConnected)
        {
            EventOnDisconnected((int)webSocket.State, "Websocket aborted!");
            return;
        }

        _ = Task.Run(async () =>
        {
            await ProcessMessages();
        });
    }

    private async Task ProcessMessages()
    {
        WebSocketReceiveResult? result = default;

        while (true)
        {
            if (webSocket.State != WebSocketState.Open)
            {
                await Task.Delay(500);

                if (webSocket.State == WebSocketState.Aborted || webSocket.State == WebSocketState.Closed)
                {
                    OnConnectionError();
                    break;
                }

                continue;
            }

            try
            {
                using (MemoryStream stream = new MemoryStream())
                {
                    ArraySegment<byte> byteSegment = new ArraySegment<byte>(new byte[maxMessageSize]);

                    do
                    {

                        try
                        {
                            result = await webSocket.ReceiveAsync(byteSegment, CancellationToken.None);
                            stream.Write(byteSegment.Array, byteSegment.Offset, result.Count);
                        }
                        catch (WebSocketException e)
                        {
                            Console.WriteLine(e.ToString());
                            OnConnectionError();
                        }
                    }
                    while (result != null && result.Count != 0 && !result.EndOfMessage && result.CloseStatus == WebSocketCloseStatus.Empty);

                    stream.Seek(0, SeekOrigin.Begin);

                    if (stream?.Length > 0 && stream.ToArray() != null)
                    {
                        await ManageMessage(stream.ToArray(), result.MessageType);
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Info("Processing Error", ex.ToString());
            }
        }
    }

    private void OnConnectionError()
    {
        OnDisconnected((int)webSocket?.CloseStatus, webSocket.CloseStatusDescription ?? "Disconnection Error");
    }

    private async Task ManageMessage(byte[] data, WebSocketMessageType type)
    {
        switch (type)
        {
            case WebSocketMessageType.Text:
                string payload = Encoding.ASCII.GetString(data);
                Log.Info("String Recevied", payload);

                if (!string.IsNullOrEmpty(payload))
                {
                    EventMessageReceived(payload);
                }
                break;
            case WebSocketMessageType.Binary:
                Log.Info("Binary Recevied", data.ToString());
                await EventOnDataReceived(data);
                break;
            default:
                break;
        }
    }

    public async Task Send(string message)
    {
        await webSocket.SendAsync(Encoding.ASCII.GetBytes(message), WebSocketMessageType.Text, true, CancellationToken.None);
    }

    public async Task Send(byte[] message)
    {
        await webSocket.SendAsync(message, WebSocketMessageType.Text, true, CancellationToken.None);
    }

    public async Task Disconnect(string closeReason = "Websocket closing")
    {
        await webSocket.CloseAsync(WebSocketCloseStatus.NormalClosure, closeReason, CancellationToken.None);
    }

    bool Disposing = false;
    public void Dispose()
    {
        Disposing = true;
        Disconnect().Wait();
    }

    ~WebSocket()
    {
        if (!Disposing)
        {
            Disconnect().Wait();
        }
    }
}
