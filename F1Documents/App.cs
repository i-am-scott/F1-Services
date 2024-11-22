using F1;
using F1.Models.RabitMessage;
using F1.Util;
using F1Documents.Documents;

namespace F1Documents;

/* 
    https://learn.microsoft.com/en-us/dotnet/api/system.timezoneinfo.findsystemtimezonebyid?view=net-8.0&redirectedfrom=MSDN#System_TimeZoneInfo_FindSystemTimeZoneById_System_String_
    https://stackoverflow.com/questions/7374731/net-save-datetime-and-completely-ignore-timezone
    Unix to UtcNow -> DateTime timestamp = DateTime.UnixEpoch.AddSeconds(seconds);
    UtcNow to Unix -> long seconds = (long) DateTime.UtcNow.Subtract(DateTime.UnixEpoch).TotalSeconds;
*/

internal class App
{
    private static Config Cfg { get; set; }
    private readonly static FIADocumentProcessor documentProcessor = new FIADocumentProcessor();

    internal readonly static Timings Timings = new Timings();
    internal readonly static Queue<RaceDocument> documentQueue = new Queue<RaceDocument>();

    internal static RabbitMQConnection rabbitMQConnection { get; set; }

    public static async Task Main(string[] args)
    {
        Cfg = Config.Load("config.json");
        
        rabbitMQConnection = new RabbitMQConnection(Cfg.RabbitMQConfig);
        documentProcessor.OnRaceDocumentFound += DocumentProcessor_OnRaceDocumentFound;

        Task.WaitAll(Poll(), documentStreaming());
    }

    private static void DocumentProcessor_OnRaceDocumentFound(RaceDocument obj)
    {
        Log.Info(obj.Name + " document ready for upload.");
        documentQueue.Enqueue(obj);
    }

    public static async Task Poll()
    {
        await Task.Run(async () =>
        {
            while (true)
            {

                await documentProcessor.Poll();
                await Task.Delay(Random.Shared.Next(3000, 6000));
            }
        });
    }

    public static async Task documentStreaming()
    {
        await Task.Run(async () =>
        {
            while (true)
            {
                if (!documentQueue.TryDequeue(out RaceDocument? document))
                {
                    await Task.Delay(500);
                    continue;
                }

                IEnumerable<RaceDocumentMessage.RaceDocumentPicture> attachments = document.DocumentPageImages.Select(kvp => new RaceDocumentMessage.RaceDocumentPicture
                {
                    PageName = kvp.Key,
                    AttachmentData = BitConverter.ToString(kvp.Value.ToArray())
                });

                RaceDocumentMessage messageDocument = new RaceDocumentMessage
                {
                    Name = document.Name,
                    RaceWeekName = document.RaceWeekName,
                    Attachments = attachments.ToList()
                };

                rabbitMQConnection.Publish("F1.Document", messageDocument);
                Console.WriteLine($" [x] Sent {messageDocument.Name}");

                await Task.Delay(10000);
            }
        });
    }
}