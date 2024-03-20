using HtmlAgilityPack;

namespace F1.News;

public class SkyNewsItem
{
    public string Title { get; set; }

    public string Summary { get; set; }

    public string Image { get; set; }

    public string Url { get; set; }

    public string Date { get; set; }

    public DateTime DateTime => DateTime.Parse(Date);

    public SkyNewsItem(HtmlNode node)
    {
        HtmlNode anchorNode = node.SelectSingleNode("div/h4/a");

        Title = anchorNode.InnerText;
        Date = node.SelectSingleNode("div/div/span").InnerText;
        Summary = node.SelectSingleNode("div/p").InnerText;
        Image = node.SelectSingleNode("a/div/img").GetAttributeValue("data-src", "");
        Url = anchorNode.GetAttributeValue("href", "");
    }
}
