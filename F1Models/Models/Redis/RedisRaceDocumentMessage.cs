namespace F1.Models.Redis;

public struct RedisRaceDocumentMessage
{
    public struct RaceDocumentPicture
    {
        public string PageName { get; set; }
        public string AttachmentData { get; set; }
    }

    public string Name { set; get; }
    public string RaceWeekName { set; get; }

    public List<RaceDocumentPicture> Attachments { set; get; }
}