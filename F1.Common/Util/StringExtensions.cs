using HtmlAgilityPack;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace F1.Common;

internal static class StringExtensions
{
    private static JsonSerializerOptions options = new JsonSerializerOptions
    {
        WriteIndented = true,
        ReferenceHandler = ReferenceHandler.Preserve
    };

    public static string ToJson(this object str)
    {
        return JsonSerializer.Serialize(str, options);
    }

    public static async Task<string> DownloadString(this string input)
    {
        using (HttpClient client = new())
        {
            return await client.GetStringAsync(input);
        }
    }

    public static async Task<HtmlDocument?> DownloadHTML(this string input)
    {
        try
        {
            using (HttpClient client = new())
            {
                HtmlDocument html = new HtmlDocument();
                html.LoadHtml(await client.GetStringAsync(input));

                return html;
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }

        return default;
    }

    private static string[] timeFormats = [
        @"m\:s\.fff", 
        @"h\:m\:s\.fff",
        @"s\.ff",
         @"s\.fff",
        @"s\.f"
    ];

    public static int ParseStopwatchToMilliseconds(this string input)
    {
        if (input == null)
        {
            return 0;
        }

        return (int)TimeSpan.ParseExact(input, timeFormats, System.Globalization.CultureInfo.InvariantCulture).TotalMilliseconds;
    }

    public static int ParseStopwatchToSeconds(this string input)
    {
        if (input == null)
        {
            return 0;
        }

        return (int)TimeSpan.ParseExact(input, timeFormats, System.Globalization.CultureInfo.InvariantCulture).TotalSeconds;
    }
}
