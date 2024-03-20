using DSharpPlus;
using DSharpPlus.Entities;
using DSharpPlus.EventArgs;
using DSharpPlus.SlashCommands;
using F1;
using F1.Models;
using F1.Models.Redis;
using F1.Util;
using F1Discord.SlashCommands;
using F1Discord.Util;
using Microsoft.Extensions.Logging;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace F1Discord;

public class App
{
    internal static Config Cfg;

    internal static DiscordClient Client;
    internal static DiscordWebhookClient clientWebhook = new DiscordWebhookClient();
    internal static ILogger<BaseDiscordClient> Logger;

    internal static RabbitMQConnection rabbitMQConnection { get; set; }
    internal static JsonSerializerOptions jsonSerializerOptions = new JsonSerializerOptions
    {
        WriteIndented = true,
        ReferenceHandler = ReferenceHandler.Preserve
    };

    public static async Task Main(string[] args)
    {
        Console.Title = "F1 Discord";

        string configFile = args.FirstOrDefault() ?? "config.json";
        Cfg = Config.Load(configFile);

        if (Cfg is null || string.IsNullOrEmpty(Cfg.DiscordConfig.Secret))
        {
            Console.WriteLine($"There is no configuration set up. Please check {configFile}!");
            await Task.Delay(2500);
            return;
        }

        DiscordConfiguration discordConfig = new DiscordConfiguration()
        {
            TokenType = TokenType.Bot,
            Intents = DiscordIntents.Guilds | DiscordIntents.GuildMessages | DiscordIntents.GuildPresences | DiscordIntents.MessageContents | DiscordIntents.AllUnprivileged,
            MinimumLogLevel = LogLevel.Debug
        };

#if DEBUG
        discordConfig.Token = Cfg.DiscordConfig.DevSecret ?? Cfg.DiscordConfig.Secret;
#else
        discordConfig.Token = Cfg.DiscordConfig.Secret;
#endif

        DiscordClient bot = new DiscordClient(discordConfig);

        Client = bot;
        Client.GuildAvailable += OnGuildAvailable;
        Logger = bot.Logger;

        SlashCommandsExtension slash = Client.UseSlashCommands();
        slash.RegisterCommands<F1Commands>();

        rabbitMQConnection = new RabbitMQConnection(Cfg.RedisConfig)
            .Subscribe("F1.Manager.GrandPrixResync", async (GrandPrix gp) =>
            {
                await onWeekendResync(gp);
            })
            .Subscribe("F1.Manager.EventScheduled", async (GrandPrix gp) =>
            {
                await onWeekendScheduled(gp);
            })
            .Subscribe("F1.Manager.GrandPrixEnd", async (GrandPrix gp) =>
            {
                await onWeekendEnd(gp);
            })
            .Subscribe("F1.Manager.EventStart", async (GrandPrixSchedule ev) =>
            {
                await onEventStart(ev);
            })
            .Subscribe("F1.Document", async (RedisRaceDocumentMessage document) =>
            {
                await onF1DocumentReceived(document);
            });

        await bot.ConnectAsync();
        await clientWebhook.AddWebhookAsync(Cfg.DiscordConfig.Webhook);

        //await bot.DisconnectAsync();
        await Task.Delay(-1);
    }

    private static Task OnGuildAvailable(DiscordClient sender, GuildCreateEventArgs e)
    {
        Channels.RegisterGuild(e.Guild);
        Channels.TryGetChannel(e.Guild, out DiscordChannel _);

        return Task.CompletedTask;
    }

    private static async Task onF1DocumentReceived(RedisRaceDocumentMessage redisRaceDocumentMessage)
    {
        Dictionary<string, Stream> files = new Dictionary<string, Stream>();
        foreach (RedisRaceDocumentMessage.RaceDocumentPicture documentPictureInfo in redisRaceDocumentMessage.Attachments)
        {
            string fileName = documentPictureInfo.PageName;
            byte[] data = documentPictureInfo.AttachmentData.Split('-').Select(b => Convert.ToByte(b, 16)).ToArray();

            files.Add(fileName, new MemoryStream(data));
        }

        DiscordMessageBuilder builder = new DiscordMessageBuilder()
                .WithContent($"{redisRaceDocumentMessage.RaceWeekName} - {redisRaceDocumentMessage.Name}")
                .AddFiles(files);

        foreach (DiscordChannel discordChannel in Channels.GetChannels())
        {
            DiscordThreadChannel thread = await discordChannel.GetThread($"{redisRaceDocumentMessage.RaceWeekName} Documents");
            if (thread != null)
            {
                await thread.SendMessageAsync(builder);
            }
        }
    }

    private static void displayStats(DiscordEmbedBuilder embedBuilder, GrandPrix gp)
    {
        if (gp.GrandPrixStats == null || gp.GrandPrixStats.Count == 0)
        {
            return;
        }

        foreach (GrandPrixStat stat in gp.GrandPrixStats)
        {
            embedBuilder.AddField(stat.name, stat.value, true);
        }
    }

    private static async Task onWeekendResync(GrandPrix gp)
    {
        DateTime startTime = gp.GetFirstEventStartTime();
        string startTimeFormatLong = Formatter.Timestamp(startTime, TimestampFormat.LongDateTime);
        string startTimeFormatRelative = Formatter.Timestamp(startTime, TimestampFormat.RelativeTime);

        Console.WriteLine("Write WEEKEND RESYNC");

        await Channels.SetTitle($"{gp.name} {startTimeFormatRelative} ({startTimeFormatLong})");
    }

    private static async Task onWeekendScheduled(GrandPrix gp)
    {
        DateTime startTime = gp.GetFirstEventStartTime();
        string startTimeFormatLong = Formatter.Timestamp(startTime, TimestampFormat.LongDateTime);
        string startTimeFormatRelative = Formatter.Timestamp(startTime, TimestampFormat.RelativeTime);

        await Channels.SetTitle($"{gp.name} {startTimeFormatRelative} ({startTimeFormatLong})");

        string name = gp.name.Replace("FORMULA 1 ", "");
        DiscordEmbedBuilder embed = new DiscordEmbedBuilder()
            .WithAuthor(name, gp.f1url, gp.location_flag)
            .WithTitle($"The next Grand Prix is scheduled for {startTimeFormatLong}. See you {startTimeFormatRelative}!")
            .WithImageUrl(gp.circuit_url)
            .WithColor(DiscordColor.Green);

        displayStats(embed, gp);
        await Channels.WriteEmbed(embed, "<@&1015996154921631754>");
    }

    private static async Task onEventStart(GrandPrixSchedule ev)
    {
        string name = ev.grandprix.name.Replace("FORMULA 1 ", "");
        string eventName = ev.typestring;

        Console.WriteLine(ev.grandprix.circuit_url);

        DiscordEmbedBuilder embed = new DiscordEmbedBuilder()
            .WithAuthor(name, ev.grandprix.f1url, ev.grandprix.location_flag)
            .WithTitle($"{eventName} started!")
            .WithColor(DiscordColor.Red);

        await Channels.WriteEmbed(embed, "<@&1015996154921631754>");
    }

    private static async Task onWeekendEnd(GrandPrix gp)
    {
        Console.WriteLine("OnWeekendEnd");
    }
}