using F1.APIGenerator.Models;
using F1.Common;
using Microsoft.Extensions.Logging;
using RestSharp;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace F1.APIGenerator;

internal class Requests
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

    private ILogger<Requests> logger;

    private static bool isSerializerSetup = false;
    private static JsonSerializerOptions serializerOptions = new JsonSerializerOptions()
    {
        NumberHandling = JsonNumberHandling.AllowReadingFromString,
    };

    public Requests(ILogger<Requests> _logger)
    {
        logger = _logger;
    }

    private async Task<T?> fetchJsonResponse<T>(string endPoint)
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
                logger.LogError("Returned error {responseContent}", response?.Content ?? "No Payload");
                return default;
            }

            return !string.IsNullOrEmpty(response.Content) ? JsonSerializer.Deserialize<T>(response.Content, serializerOptions) : default;
        }
        catch (Exception ex)
        {
            logger.LogError(ex, "Error trying to fetch Json Request");
        }

        return default;
    }

    internal async Task<EventResults?> GetEventResultAsync(int? meeting)
    {
        return await fetchJsonResponse<EventResults>($"v2/fom-results/race?meeting={meeting}");
    }

    internal async Task<DriverList?> GetDriversAsync(int? season)
    {
        if (!season.HasValue)
        {
            season = DateTime.UtcNow.Year;
        }

        return await fetchJsonResponse<DriverList>($"v1/editorial-driverlisting/listing?season={season}");
    }

    internal async Task<EventList?> GetEventsAsync(int? season)
    {
        if (!season.HasValue)
        {
            season = DateTime.UtcNow.Year;
        }

        return await fetchJsonResponse<EventList>($"v1/editorial-eventlisting/events?season={season}");
    }

    internal async Task<EventInfo?> GetEventAsync(int? eventid)
    {
        return await fetchJsonResponse<EventInfo>($"v1/event-tracker/meeting/{eventid}");
    }

    internal async Task<ConstructorList?> GetConstructorsAsync(int? season)
    {
        if (!season.HasValue)
        {
            season = DateTime.UtcNow.Year;
        }

        return await fetchJsonResponse<ConstructorList>($"v1/editorial-constructorlisting/listing?season={season}");
    }
}