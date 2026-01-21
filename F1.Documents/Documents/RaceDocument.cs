using F1.Common;
using System.Net;

namespace F1.Documents;

internal class RaceDocument
{
    public long Id => Date.ToFileTimeUtc();
    public required string Name;
    public required string RaceWeekName;

    public required string DocumentPath;

    public byte[]? DocumentData;
    public Dictionary<string, MemoryStream>? DocumentPageImages;

    public required string DateString;
    public DateTime Date;

    private int DownloadPercent;

    public async Task<byte[]> Download(string inPath)
    {
        using (WebClient client = new())
        {
            client.DownloadProgressChanged += Client_DownloadProgressChanged;
            return await client.DownloadDataTaskAsync(new Uri(inPath));
        }
    }

    private void Client_DownloadProgressChanged(object sender, DownloadProgressChangedEventArgs e)
    {
        if (DownloadPercent >= e.ProgressPercentage)
        {
            return;
        }

        DownloadPercent = e.ProgressPercentage;
        Console.WriteLine($"Downloading {Name} ({e.ProgressPercentage}%) Completed: {e.ProgressPercentage >= 100}");
    }
}