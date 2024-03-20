using System.Text.Json;
using System.Text.Json.Serialization;
using F1.Models;

namespace F1.Util;

public class DriverNationalityEnum : JsonConverter<Nationality>
{
    public override Nationality Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options)
    {
        string? nationality = reader.GetString()?.Replace(" ", "")?.Split('-')?.FirstOrDefault();

        if (nationality != null && Enum.TryParse(nationality, out Nationality nationalityEnum))
        {
            return nationalityEnum;
        }
        else
        {
            return Nationality.None;
        }
    }

    public override void Write(Utf8JsonWriter writer, Nationality nationality, JsonSerializerOptions options)
    {
        throw new NotImplementedException();
    }
}
