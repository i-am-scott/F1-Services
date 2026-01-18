using Docnet.Core;
using Docnet.Core.Models;
using F1.Common;
using F1.Common.AppBus;
using F1.Models.RabbitMQ;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.PixelFormats;

namespace F1.Documents;

internal sealed class DocumentConsumer : BackgroundService
{
    private readonly RabbitMQConnectionService rabbitMQConnectionService;

    private readonly IAppBus<RaceDocument> bus;
    private readonly ILogger<DocumentConsumer> logger;

    public DocumentConsumer(RabbitMQConnectionService _rabbitMQConnectionService, IAppBus<RaceDocument> _bus, ILogger<DocumentConsumer> _logger)
    {
        rabbitMQConnectionService = _rabbitMQConnectionService;
        bus = _bus;
        logger = _logger;
    }

    protected override async Task ExecuteAsync(CancellationToken ct)
    {
        await foreach (RaceDocument raceDocument in bus.SubscribeAsync(ct))
        {
            logger.LogInformation("Received document {DocumentName} for processing.", raceDocument.Name);

            try
            {
                List<MemoryStream>? imageStreams = LoadPDFImages(raceDocument);

                if (imageStreams is not null && imageStreams.Count > 0)
                {
                    await ProcessDocument(raceDocument, imageStreams);
                }
            }
            catch (OperationCanceledException) when (ct.IsCancellationRequested)
            {
                break;
            }
            catch (Exception ex)
            {
                logger.LogError(ex, "Error processing document {DocumentName}.", raceDocument.Name);
            }
        }
    }

    private List<MemoryStream> LoadPDFImages(RaceDocument document)
    {
        List<MemoryStream> streams = new List<MemoryStream>();

        using (var documentReader = DocLib.Instance.GetDocReader(document.DocumentData, new PageDimensions(150, 150)))
        {
            for (int i = 0; i < documentReader.GetPageCount(); i++)
            {
                using (var page = documentReader.GetPageReader(i))
                {
                    using (var image = Image.LoadPixelData<Rgba32>(
                        page.GetImage(),
                        page.GetPageWidth(),
                        page.GetPageHeight()))
                    {
                        MemoryStream stream = new MemoryStream();

                        image.SaveAsPng(stream);

                        stream.Position = 0;
                        streams.Add(stream);
                    }
                }
            }

            return streams;
        }
    }

    private async Task ProcessDocument(RaceDocument document, List<MemoryStream> imageStreams)
    {
        document.DocumentPageImages = new Dictionary<string, MemoryStream>(imageStreams.Count);

        foreach (MemoryStream stream in imageStreams)
        {
            string fileName = document.Name + " Page-" + (document.DocumentPageImages.Count + 1) + ".png";
            document.DocumentPageImages.Add(fileName, stream);

#if DEBUG
            File.WriteAllBytes(Path.Combine(AppContext.BaseDirectory, fileName), stream.ToArray());
#endif
        }

        logger.LogInformation("Processed document {DocumentName} into {PageCount} images.", document.Name, document.DocumentPageImages.Count);

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

        rabbitMQConnectionService.Publish("F1.Document", messageDocument);
    }
}
