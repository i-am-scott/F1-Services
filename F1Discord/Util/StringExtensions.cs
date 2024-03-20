using HtmlAgilityPack;

namespace F1Discord.Util;

internal static class StringExtensions
{
    public static async Task<string> DownloadString(this string input)
    {
        using (HttpClient client = new())
        {
            return await client.GetStringAsync(input);
        }
    }

    public static async Task<HtmlDocument> DownloadHTML(this string input)
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

        return null;
    }
}
