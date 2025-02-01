using F1.Util;
using F1APIGenerator.Models;
using RestSharp;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace F1APIGenerator;

internal static class Requests
{
    private static RestClient client => new RestClient(new RestClientOptions("https://api.formula1.com/")
    {
        ThrowOnAnyError = true,
        Timeout = TimeSpan.FromSeconds(5),
    }, (headers) =>
    {
        headers.Add("Accept", "application/json");
        headers.Add("apikey", "BQ1SiSmLUOsp460VzXBlLrh689kGgYEZ");
        headers.Add("locale", "en");
    });

    private static bool isSerializerSetup = false;
    private static JsonSerializerOptions serializerOptions = new JsonSerializerOptions()
    {
        NumberHandling = JsonNumberHandling.AllowReadingFromString,
    };

    private static async Task<T?> fetchJsonResponse<T>(string endPoint)
    {
        RestRequest req = new RestRequest(endPoint);
        req.Method = Method.Get;

        if (!isSerializerSetup)
        {
            serializerOptions.Converters.Add(new LocationEnumConverter());
            serializerOptions.Converters.Add(new SessionTypeEnumConverter());
            serializerOptions.Converters.Add(new RewardTypeEnumConverter());

            isSerializerSetup = true;
        }

        try
        {
            RestResponse? response = await client.GetAsync(req);
            if (response == null || !response.IsSuccessful)
            {
                Error($"Returned error {response?.Content ?? "No payload"}");
                return default;
            }

            return !string.IsNullOrEmpty(response.Content) ? JsonSerializer.Deserialize<T>(response.Content, serializerOptions) : default;
        }
        catch (Exception ex)
        {
            Error(ex.Message);
        }

        return default;
    }

    internal static async Task<EventResults> GetEventResultAsync(uint? meeting)
    {
        return await fetchJsonResponse<EventResults>($"v2/fom-results/race?meeting={meeting}");
    }

    internal static async Task<DriverList?> GetDriversAsync(uint? season)
    {
        if (!season.HasValue)
        {
            season = (uint)DateTime.UtcNow.Year;
        }

        return await fetchJsonResponse<DriverList>($"v1/editorial-driverlisting/listing?season={season}");
    }

    internal static async Task<EventList?> GetEventsAsync(uint? season)
    {
        if (!season.HasValue)
        {
            season = (uint)DateTime.UtcNow.Year;
        }

        return await fetchJsonResponse<EventList>($"v1/editorial-eventlisting/events?season={season}");
    }

    internal static async Task<EventInfo?> GetEventAsync(uint? eventid)
    {
        return await fetchJsonResponse<EventInfo>($"v1/event-tracker/meeting/{eventid}");
    }

    internal static async Task<ConstructorList?> GetConstructorsAsync(uint? season)
    {
        if (!season.HasValue)
        {
            season = (uint)DateTime.UtcNow.Year;
        }

        return await fetchJsonResponse<ConstructorList>($"v1/editorial-constructorlisting/listing?season={season}");
    }

    internal static void Success(string message)
    {
        Console.ForegroundColor = ConsoleColor.Green;
        Console.Error.WriteLine(message);
        Console.ForegroundColor = ConsoleColor.White;
    }

    internal static void Error(string message)
    {
        Console.ForegroundColor = ConsoleColor.Red;
        Console.Error.WriteLine(message);
        Console.ForegroundColor = ConsoleColor.White;
    }
}