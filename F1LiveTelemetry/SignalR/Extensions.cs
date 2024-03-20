using Connector.SignalR.Protocol;
using System.Text;
using System.Text.Json;

namespace F1LiveTelemetry.SignalR;

public static class Extensions
{
    private static readonly char terminatorChar = (char)0x1E;
    private static readonly JsonSerializerOptions serializeOptions = new JsonSerializerOptions
    {
        PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
        DefaultIgnoreCondition = System.Text.Json.Serialization.JsonIgnoreCondition.WhenWritingNull
    };

    private static readonly JsonSerializerOptions deserializeOptions = new JsonSerializerOptions
    {
        AllowTrailingCommas = true,
        PropertyNameCaseInsensitive = true,
    };

    public static bool HasTerminator(this string str)
    {
        return str.EndsWith(terminatorChar);
    }

    public static string StripTerminator(this string str)
    {
        return str.TrimEnd(terminatorChar);
    }

    public static byte[] SeralizeMessage<T>(this T message, int messageType) where T : HubMessage
    {
        message.Type = messageType;
        string jsonObject = JsonSerializer.Serialize(message, options: serializeOptions) + terminatorChar;

        Console.WriteLine($"Sending {jsonObject}");
        return Encoding.ASCII.GetBytes(jsonObject);
    }

    public static T? DeserializeMessage<T>(this string message) where T : HubMessage
    {
        return JsonSerializer.Deserialize<T>(message, deserializeOptions);
    }

    public static T? DeserializeMessage<T>(this JsonDocument document) where T : HubMessage
    {
        return document.Deserialize<T>(deserializeOptions);
    }
}
