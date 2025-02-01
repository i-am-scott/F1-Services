using F1.Util;
using F1Documents;
using HtmlAgilityPack;
using System.ServiceModel.Syndication;

namespace F1.News;

public class NewsProcessor
{
    protected readonly static string SkyNewsUrl = "https://www.skysports.com/f1/news";
    protected bool IsChecking = false;

    protected Action<List<SkyNewsItem>> OnSkyNewsItemsCreated;
    protected Action<List<SyndicationItem>> OnBbcNewsItemsCreated;

    public NewsProcessor()
    {
        //DateTime publishTimeUtc = DateTime.ParseExact(dateString + " +2", "dd.MM.yy HH:mm z", CultureInfo.InvariantCulture, DateTimeStyles.AdjustToUniversal);
    }

    public async Task Poll()
    {
        if (IsChecking)
        {
            return;
        }

        IsChecking = true;

        DateTime lastDocumentTime = App.Timings.News;

        try
        {
            List<SkyNewsItem> skyNews = await GetLatestSkyNews();
            if (skyNews?.Count > 0)
            {
                SkyNewsItem item = skyNews.MaxBy(i => i.DateTime);
                if (item.DateTime > lastDocumentTime)
                {
                    lastDocumentTime = item.DateTime;
                }

                OnSkyNewsItemsCreated?.Invoke(skyNews);
            }

            List<SyndicationItem> news = GetLatestBBCNews();
            if (news?.Count > 0)
            {
                SyndicationItem item = news.MaxBy(i => i.PublishDate.UtcDateTime);
                
                if (item.PublishDate.UtcDateTime > lastDocumentTime)
                {
                    lastDocumentTime = item.PublishDate.UtcDateTime;
                }

                OnBbcNewsItemsCreated?.Invoke(news);
            }
        }
        catch (Exception ex)
        {
            Log.Error(ex.InnerException.Message);
        }

        IsChecking = false;

        App.Timings.News = lastDocumentTime + TimeSpan.FromSeconds(1);

        Log.Info($"Last News Time - {App.Timings.News}");
        Log.Info($"Current Time - {DateTime.Now}");
    }

    protected async Task<List<SkyNewsItem>?> GetLatestSkyNews()
    {
        HtmlDocument document = await SkyNewsUrl.DownloadHTML();

        List<HtmlNode>? listNodes = document.DocumentNode.SelectNodes("/html/body/div[4]/div/div[1]/div[3]/div[1]/div[2]/div/div/div")?.ToList();
        if (listNodes == null || listNodes.Count == 0)
        {
            return null;
        }

        List<SkyNewsItem> news = new List<SkyNewsItem>();
        foreach (HtmlNode node in listNodes)
        {
            news.Add(new SkyNewsItem(node));
        }

        return news.Where(item => item.DateTime.CompareTo(App.Timings.News) > 0).ToList();
    }

    protected List<SyndicationItem> GetLatestBBCNews()
    {
        BBCRssFeed feed = new BBCRssFeed();
        List<SyndicationItem> latestNews = feed.GetItems().Where(item => item.PublishDate.UtcDateTime.CompareTo(App.Timings.News) > 0).ToList();

        return latestNews;
    }

    /*protected async Task Doc_PostSkyNews(List<SkyNewsItem> news)
    {
        foreach (var channel in Channels.GetChannels())
        {
            DiscordChannel thread = await channel.GetThread("Formula 1 News");

            foreach (SkyNewsItem item in news)
            {
                App.Logger.LogWarning($"{item.Title} - {item.DateTime}");
                await thread.SendMessageAsync(item.Url);
            }
        }
    }

    private async Task Doc_PostBBCNews(List<SyndicationItem> news)
    {
        foreach (var channel in Channels.GetChannels())
        {
            DiscordChannel thread = await channel.GetThread("Formula 1 News");

            foreach (SyndicationItem item in news)
            {
                App.Logger.LogWarning($"{item.Title} - {item.PublishDate.DateTime}");
                await thread.SendMessageAsync(item.Id);
            }
        }
    }*/
}
