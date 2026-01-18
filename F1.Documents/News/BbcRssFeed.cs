using System.ServiceModel.Syndication;
using System.Xml;

namespace F1.News;

public sealed class BBCRssFeed
{
    private string BBCNewsUrl = "https://feeds.bbci.co.uk/sport/formula1/rss.xml";

    public List<SyndicationItem> GetItems()
    {
        SyndicationFeed feed = null;

        try
        {
            using (XmlReader reader = XmlReader.Create(BBCNewsUrl))
            {
                feed = SyndicationFeed.Load(reader);
            }
        }
        catch { }

        return feed.Items.ToList();
    }
}
