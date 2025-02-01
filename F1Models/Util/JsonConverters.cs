using F1.Models;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace F1.Util;

public class LocationEnumConverter : JsonConverter<Location>
{
    public override Location Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options)
    {
        string? id = reader.GetString()?.Replace(" ", "")?.Split('-')?.FirstOrDefault();

        if (id != null && Enum.TryParse(id, out Location enumerator))
        {
            return enumerator;
        }
        else
        {
            return Location.None;
        }
    }

    public override void Write(Utf8JsonWriter writer, Location enumerator, JsonSerializerOptions options)
    {
        throw new NotImplementedException();
    }
}

public class SessionTypeEnumConverter : JsonConverter<SessionType>
{
    public override SessionType Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options)
    {
        string? id = reader.GetString()?.Replace(" ", "");

        if (id != null && Enum.TryParse(id, out SessionType enumerator))
        {
            return enumerator;
        }
        else
        {
            return SessionType.UNKNOWN;
        }
    }

    public override void Write(Utf8JsonWriter writer, SessionType enumerator, JsonSerializerOptions options)
    {
        throw new NotImplementedException();
    }
}

public class RewardTypeEnumConverter : JsonConverter<RewardType>
{
    public override RewardType Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options)
    {
        string? id = reader.GetString()?.Replace(" ", "");

        if (id != null && Enum.TryParse(id, out RewardType enumerator))
        {
            return enumerator;
        }
        else
        {
            return RewardType.UNKNOWN;
        }
    }

    public override void Write(Utf8JsonWriter writer, RewardType enumerator, JsonSerializerOptions options)
    {
        throw new NotImplementedException();
    }
}