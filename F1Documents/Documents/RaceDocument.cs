using F1.Util;
using System.Net;

namespace F1Documents.Documents;

internal class RaceDocument
{
    public long Id => Date.ToFileTimeUtc();
    public string Name;
    public string RaceWeekName;
    public string DocumentPath;

    public byte[] DocumentData;
    public Dictionary<string, MemoryStream> DocumentPageImages;

    public string DateString;
    public DateTime Date;

    private int DownloadPercent;

    // TODO: Convert to the Util string extension class.
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
        Log.Info($"Downloading {Name} ({e.ProgressPercentage}%) Completed: {e.ProgressPercentage >= 100}");
    }
}
