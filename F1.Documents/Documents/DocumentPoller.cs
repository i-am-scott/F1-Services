using F1.Common.AppBus;
using HtmlAgilityPack;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System.Globalization;

namespace F1.Documents;

internal sealed class DocumentPoller : BackgroundService
{
    private HttpClient http;
    private IAppBus<RaceDocument> bus;
    private ILogger<DocumentPoller> logger;

    private readonly string BaseUrl = "https://www.fia.com";
    private readonly string DocumentPage = "/documents/";

    public DocumentPoller(IHttpClientFactory httpClientFactory, IAppBus<RaceDocument> _bus, ILogger<DocumentPoller> _logger)
    {
        http = httpClientFactory.CreateClient();
        bus = _bus;
        logger = _logger;
    }

    protected override async Task ExecuteAsync(CancellationToken ct)
    {
        while (!ct.IsCancellationRequested)
        {
            List<RaceDocument>? documents = await GetLatestRaceDocuments(ct);
            DateTime lastDocumentTime = App.Timings.Document;

            if (documents?.Count > 0)
            {
                foreach (RaceDocument document in documents)
                {
                    if (document.Date > lastDocumentTime)
                    {
                        lastDocumentTime = document.Date;
                    }

                    await bus.PublishAsync(document, ct);
                }
            }

            App.Timings.Document = lastDocumentTime + TimeSpan.FromSeconds(1);
            await Task.Delay(TimeSpan.FromSeconds(5), ct);
        }
    }

    private async Task<List<RaceDocument>?> GetLatestRaceDocuments(CancellationToken ct)
    {
        HtmlDocument htmlDocument = await http.GetStringAsync(BaseUrl + DocumentPage, ct)
            .ContinueWith(task =>
            {
                HtmlDocument doc = new HtmlDocument();
                doc.LoadHtml(task.Result);

                return doc;
            });

        if (htmlDocument is null)
        {
            logger.LogWarning("Failed to load document page");
            return null;
        }

        List<RaceDocument>? raceDocuments = GetRaceDocuments(htmlDocument);

        if (raceDocuments is null || raceDocuments.Count == 0)
        {
            logger.LogInformation("No race documents found");
            return null;
        }

        return raceDocuments;
    }

    private List<RaceDocument>? GetRaceDocuments(HtmlDocument htmlDocument)
    {
        string? eventName = htmlDocument.DocumentNode?.SelectSingleNode("//div[@class='event-title active']").InnerText;
        if (eventName is null)
        {
            logger.LogWarning("Could not find eventName from document!");
            return null;
        }

        List<HtmlNode>? listNodes = htmlDocument?.DocumentNode?.SelectNodes("//ul[@class='document-type-wrapper'][1]//li/ul/li")?.ToList();
        if (listNodes is null || listNodes.Count == 0)
        {
            logger.LogWarning("Could not find document list nodes!");
            return null;
        }

        List<RaceDocument> documents = new List<RaceDocument>();

        foreach (HtmlNode node in listNodes)
        {
            RaceDocument? document = GetRaceDocument(eventName, node);
            if (document is not null)
            {
                documents.Add(document);
            }
        }

        documents.Reverse();
        return documents;
    }

    private RaceDocument? GetRaceDocument(string eventName, HtmlNode rootNode)
    {
        HtmlNode node = rootNode.SelectSingleNode(".//a");
        if (node is null)
        {
            return null;
        }

        string? name = node.SelectSingleNode("div[@class='title']")?.InnerText?.Trim();
        if (string.IsNullOrEmpty(name))
        {
            logger.LogWarning("Could not find document name!");
            return null;
        }

        string fileUrl = node.GetAttributeValue("href", "none");
        string dateString = node.SelectSingleNode(".//span")?.InnerText!;

        if (string.IsNullOrEmpty(fileUrl) || !fileUrl.EndsWith(".pdf"))
        {
            logger.LogCritical("Invalid file for {0}", fileUrl);
            return null;
        }

        DateTime publishTimeUtc = DateTime.ParseExact(dateString, "dd.MM.yy HH:mm", CultureInfo.InvariantCulture, DateTimeStyles.AssumeUniversal);
        // publishTimeUtc = publishTimeUtc.AddHours(-1);

        return new RaceDocument
        {
            Name = name,
            RaceWeekName = eventName,
            DocumentPath = fileUrl,
            Date = publishTimeUtc,
            DateString = dateString
        };
    }
}