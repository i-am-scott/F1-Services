using F1.Util;
using Ghostscript.NET;
using Ghostscript.NET.Rasterizer;
using HtmlAgilityPack;
using System.Drawing;
using System.Globalization;

namespace F1Documents.Documents;

internal class FIADocumentProcessor
{
    protected HtmlDocument document;
    protected bool IsChecking = false;

    protected readonly string BaseUrl = "https://www.fia.com";
    protected readonly string DocumentPage = "/documents/championships/fia-formula-one-world-championship-14/season/season-2024-2043";

    internal event Action<RaceDocument> OnRaceDocumentFound;

    internal async Task Poll()
    {
        if (IsChecking)
        {
            return;
        }

        IsChecking = true;
        List<RaceDocument>? documents = await GetLatestRaceDocument();

        DateTime lastDocumentTime = App.Timings.Document;

        if (documents?.Count > 0)
        {
            foreach (RaceDocument document in documents)
            {
                if (document.Date > lastDocumentTime)
                {
                    lastDocumentTime = document.Date;
                }

                try
                {
                    await ProcessDocument(document);
                    await Task.Delay(5000);
                }
                catch (Exception ex)
                {
                    Log.Info(ex.InnerException?.ToString());
                }
            }
        }

        App.Timings.Document = lastDocumentTime + TimeSpan.FromSeconds(1);
        IsChecking = false;
    }

    private async Task<List<RaceDocument>?> GetLatestRaceDocument()
    {
        document = await (BaseUrl + DocumentPage).DownloadHTML();
        List<RaceDocument>? raceDocuments = GetRaceDocuments();

        if (raceDocuments == null || raceDocuments.Count == 0)
        {
            Log.Error("No race documents found");
            return null;
        }

        List<RaceDocument> queued = new List<RaceDocument>();
        foreach (RaceDocument raceDocument in raceDocuments)
        {
            if (raceDocument == null)
            {
                continue;
            }

            Log.Info($"{raceDocument.Name} - {raceDocument.Date} - {App.Timings.Document}");

            if (raceDocument.Date.CompareTo(App.Timings.Document) <= 0)
            {
                Log.Info("- Document was skipped because it was too old.");
                continue;
            }

            byte[] fileData = await raceDocument.Download(BaseUrl + raceDocument.DocumentPath);
            if (fileData?.Length == 0)
            {
                Log.Error("- Failed to download");
                continue;
            }

            Log.Info("- Race Added ");
            raceDocument.DocumentData = fileData;
            queued.Add(raceDocument);
        }

        Log.Info("Completed");
        return queued;
    }

    private RaceDocument? GetDocument(HtmlNode rootNode)
    {
        HtmlNode node = rootNode.SelectSingleNode(".//a");
        if (node is null)
        {
            return null;
        }

        string name = node.SelectSingleNode("div[@class='title']").InnerText?.Trim();
        string fileUrl = node.GetAttributeValue("href", "none");
        string dateString = node.SelectSingleNode(".//span").InnerText;

        if (string.IsNullOrEmpty(fileUrl) || !fileUrl.EndsWith(".pdf"))
        {
            Log.Error($"Invalid file for {fileUrl}");
            return null;
        }

        DateTime publishTimeUtc = DateTime.ParseExact(dateString, "dd.MM.yy HH:mm", CultureInfo.InvariantCulture, DateTimeStyles.AssumeLocal);
        publishTimeUtc = publishTimeUtc.AddHours(-1);

        return new RaceDocument
        {
            Name = name,
            DocumentPath = fileUrl,
            Date = publishTimeUtc,
            DateString = dateString
        };
    }

    private List<RaceDocument>? GetRaceDocuments()
    {
        string eventName = document?.DocumentNode?.SelectSingleNode("//div[@class='event-title active']").InnerText;
        if (string.IsNullOrEmpty(eventName))
        {
            return null;
        }

        List<HtmlNode> listNodes = document.DocumentNode.SelectNodes("//ul[@class='event-wrapper'][1]//li[@class='document-row']").ToList();
        if (listNodes.Count == 0)
        {
            return null;
        }

        List<RaceDocument> documents = new List<RaceDocument>();
        foreach (HtmlNode node in listNodes)
        {
            RaceDocument? document = GetDocument(node);
            if (document is not null)
            {
                document.RaceWeekName = eventName;
                documents.Add(document);
            }
        }

        documents.Reverse();
        return documents;
    }

    private async Task ProcessDocument(RaceDocument document)
    {
        List<MemoryStream>? imageStreams = LoadPDFImages(document);
        if (imageStreams == null || imageStreams.Count == 0)
        {
            return;
        }

        document.DocumentPageImages = new Dictionary<string, MemoryStream>(imageStreams.Count);

        foreach (MemoryStream stream in imageStreams)
        {
            document.DocumentPageImages.Add(document.Name + " Page-" + document.DocumentPageImages.Count + 1 + ".png", stream);
        }

        OnRaceDocumentFound?.Invoke(document);
    }

    private List<MemoryStream> LoadPDFImages(RaceDocument document)
    {
        try
        {
            GhostscriptVersionInfo lastInstalledVersion = GhostscriptVersionInfo.GetLastInstalledVersion(GhostscriptLicense.GPL | GhostscriptLicense.AFPL, GhostscriptLicense.GPL);
            List<MemoryStream> streams = new List<MemoryStream>();

            using (GhostscriptRasterizer rasterizer = new GhostscriptRasterizer())
            {
                rasterizer.CustomSwitches.Add("-dNEWPDF=false");
                rasterizer.Open(new MemoryStream(document.DocumentData), lastInstalledVersion, false);

                for (int i = 1; i <= rasterizer.PageCount; i++)
                {
                    MemoryStream stream = new MemoryStream();

                    Image img = rasterizer.GetPage(100, i);
                    img.Save(stream, System.Drawing.Imaging.ImageFormat.Png);

                    stream.Position = 0;
                    streams.Add(stream);
                }
            }

            return streams;
        }
        catch (Exception ex)
        {
            Log.Error(ex.ToString());
            return null;
        }
    }
}
