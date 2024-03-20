using Connector.SignalR.Protocol;
using F1.Util;
using F1LiveTelemetry.SignalR.Protocols;
using System.Net;
using System.Net.Http.Json;
using System.Text.Json;
using System.Web;

namespace F1LiveTelemetry.SignalR;

public partial class SignalRProcessor
{
    private WebSocket webSocket;
    private bool handshakeCompleted = false;
    private InvocationManager invocationManager;
    private List<HubConnection> requestedHubs = new List<HubConnection>();

    public bool IsConnected => webSocket.IsConnected;
    public bool ExpectsMessageTerminator = true;

    private readonly JsonSerializerOptions jsonSerializerOptions = new JsonSerializerOptions
    {
        AllowTrailingCommas = true,
        ReadCommentHandling = JsonCommentHandling.Skip,
        MaxDepth = 10,
        WriteIndented = true,
    };

    public TimeSpan InvocationWaitResponseTimeout
    {
        get => invocationManager.WaitResponseTimeout;
        set => invocationManager.WaitResponseTimeout = value;
    }

    public string? Url { get; internal set; }

    public SignalRProcessor(Dictionary<string, string> headers = null)
    {
        invocationManager = new InvocationManager(this);

        webSocket = new WebSocket();
        webSocket.OnMessageReceived += MessageReceived;
        webSocket.OnDisconnected += Disconnected;

        if (headers is not null)
        {
            webSocket.SetHeaders(headers);
        }
    }

    private void Disconnected(int status, string reason)
    {
        Log.Info(status.ToString(), reason);

        invocationManager.ClearInvocationQueue();
        Reconnect();
    }

    private async void MessageReceived(string message)
    {
        await ProcessPayload(message);
    }

    private async Task<string> NegotiateConnection(string url)
    {
        HttpClientHandler handler = new HttpClientHandler();
        handler.UseCookies = true;
        handler.CookieContainer = new CookieContainer();

        Uri uri = new Uri(url);

        string hubRequestValue = HttpUtility.UrlEncode(JsonSerializer.Serialize(requestedHubs));
        using (HttpClient client = new HttpClient(handler))
        {
            url = $"{url}/negotiate?connectionData={hubRequestValue}&clientProtocol=1.5";

            HttpResponseMessage message = await client.GetAsync(url);
            NegotiationResponse? response = await message.Content.ReadFromJsonAsync<NegotiationResponse>();

            string encodedToken = HttpUtility.UrlEncode(response.ConnectionToken);
            string cookie = message.Headers.GetValues("Set-Cookie").First() ?? message.Headers.GetValues("set-cookie").First();

            webSocket.SetHeader("cookie", cookie);
            return $"wss://{uri.Authority}{response.Url}/connect?clientProtocol=1.5&transport=webSockets&connectionToken={encodedToken}&connectionData={hubRequestValue}&tid=10";
        }
    }

    public async Task ConnectAsync(string url)
    {
        if (url.StartsWith("http"))
        {
            url = await NegotiateConnection(url);

            if (string.IsNullOrEmpty(url))
            {
                throw new Exception("Unable to negotiate with server!");
            }

            Log.Info($"Upgraded to {url}");
        }

        Url = url;
        await webSocket.Connect(url);
        await SendConnectionHandshake();
    }

    public void Disconnect()
    {
        webSocket.Dispose();
    }

    public async Task Reconnect()
    {
        if (!string.IsNullOrEmpty(Url) && !webSocket.IsConnected)
        {
            await ConnectAsync(Url);
        }
    }

    public HubConnection AddHub(string name)
    {
        HubConnection newHubConnection = new HubConnection(name, this);
        requestedHubs.Add(new HubConnection(name, this));

        return newHubConnection;
    }

    private async Task SendConnectionHandshake()
    {
        byte[] payload = new HandshakeRequestMessage("json", 1).SeralizeMessage(0);

        if (payload != null && payload.Length > 0)
        {
            await webSocket.Send(payload);
        }
    }

    public async Task ProcessPayload(string payload)
    {
        JsonDocument? document = JsonSerializer.Deserialize<JsonDocument>(payload, jsonSerializerOptions);

        string formattedLog = JsonSerializer.Serialize(document, jsonSerializerOptions);
        File.AppendAllText("telemetry.log", formattedLog + Environment.NewLine + Environment.NewLine);

        if (document is null)
        {
            Log.Info("Error", "Invalid Json received!");
            return;
        }

        if (document.RootElement.TryGetProperty("E", out JsonElement errorElement))
        {
            Log.Info("Error", errorElement.GetString() ?? "An unkown error was received!");

            if (!handshakeCompleted)
            {
                return;
            }
        }

        if (document.RootElement.TryGetProperty("M", out JsonElement methodElement))
        {
            foreach (var message in methodElement.EnumerateArray())
            {
                string? methodName = message.GetProperty("M").GetString();
                if (methodName is null)
                {
                    continue;
                }

                JsonElement arguments = message.GetProperty("A");
                string? messageName = arguments[0].GetString();

                if (listeners.TryGetValue(messageName, out Listener listener))
                {
                    listener.Action?.Invoke(arguments[1]);
                }
            }

            return;
        }

        bool hasInvocationId = document.RootElement.TryGetProperty("I", out JsonElement invocationElement);
        if (hasInvocationId)
        {
            await OnCompletionMessage(document.DeserializeMessage<CompletionMessage>());
        }
        else if (!handshakeCompleted)
        {
            handshakeCompleted = true;
            await OnHandshakeCompletedEvent();
        }
    }

    private Task OnCompletionMessage(CompletionMessage completionMessage)
    {
        invocationManager.SetCompletionMessage(completionMessage);
        return Task.CompletedTask;
    }

    private Dictionary<string, Listener> listeners = new Dictionary<string, Listener>();

    public void OnFeed(string name, Action<JsonElement> action)
    {
        Listener subscriptionWatcher = new Listener(name, action);
        listeners.Add(name, subscriptionWatcher);
    }

    public async Task<InvocationResponse<T>?> SendAsync<T>(string invokeName, params object[] arguments)
    {
        return await invocationManager.SendInvocation<T>(true, invokeName, arguments);
    }

    public void Send(string invokeName, params object[] arguments)
    {
        _ = invocationManager.SendInvocation<bool>(false, invokeName, arguments);
    }

    public async Task Send(byte[] data)
    {
        await webSocket.Send(data);
    }
}