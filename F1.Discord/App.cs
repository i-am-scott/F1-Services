using DSharpPlus;
using DSharpPlus.Commands;
using DSharpPlus.Commands.Processors.SlashCommands;
using DSharpPlus.Commands.Processors.TextCommands;
using DSharpPlus.Entities;
using DSharpPlus.EventArgs;
using F1.Common;
using F1.Discord.F1LiveTelemetry;
using F1.Discord.Util;
using F1.Models;
using F1.Models.RabbitMQ;
using Microsoft.Extensions.Logging;
using System.Reflection;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Timers;

namespace F1.Discord;

public class App
{
	internal static Config Cfg;

	internal static DiscordClient Client;
	internal static DiscordWebhookClient clientWebhook = new DiscordWebhookClient();
	internal static ILogger Logger;

	internal static RabbitMQConnection rabbitMQConnection { get; set; }
	internal static JsonSerializerOptions jsonSerializerOptions = new JsonSerializerOptions
	{
		WriteIndented = true,
		ReferenceHandler = ReferenceHandler.Preserve
	};

	public static void CreateRabbitMQ()
	{
		rabbitMQConnection = new RabbitMQConnection(Cfg.RabbitMQConfig)
			.Subscribe("F1.Manager.GrandPrixResync", async (Event gp) =>
			{
				await onWeekendResync(gp);
			})
			.Subscribe("F1.Manager.EventScheduled", async (Event gp) =>
			{
				await onWeekendScheduled(gp);
			})
			.Subscribe("F1.Manager.GrandPrixEnd", async (Event gp) =>
			{
				await onWeekendEnd(gp);
			})
			.Subscribe("F1.Manager.EventStart", async (EventSchedule ev) =>
			{
				await onEventStart(ev);
			})
			.Subscribe("F1.Document", async (RaceDocumentMessage document) =>
			{
				await onF1DocumentReceived(document);
			})
			.Subscribe("F1.RaceControlMessages", async (RaceControlMessage document) =>
			{
				await onRaceControlMessage(document);
			});
	}

	public static async Task Main(string[] args)
	{
		Console.Title = "F1 Discord";

		Cfg = Config.Load();

		if (Cfg is null || string.IsNullOrEmpty(Cfg.DiscordConfig.Secret))
		{
			Console.WriteLine($"There is no configuration set up. Please check config.json!");
			await Task.Delay(2500);
			return;
		}

		CreateRabbitMQ();
		AppDomain.CurrentDomain.UnhandledException += CurrentDomain_UnhandledException;

#if DEBUG
        DiscordClientBuilder builder = DiscordClientBuilder.CreateDefault(Cfg.DiscordConfig.DevSecret ?? Cfg.DiscordConfig.Secret, DiscordIntents.All);
#else
		DiscordClientBuilder builder = DiscordClientBuilder.CreateDefault(Cfg.DiscordConfig.Secret, DiscordIntents.All);
#endif

		builder.UseCommands((IServiceProvider serviceProvider, CommandsExtension extension) =>
		{
			extension.AddCommands(Assembly.GetExecutingAssembly(), 292411419528265728);

			TextCommandProcessor textCommandProcessor = new TextCommandProcessor(new TextCommandConfiguration
			{
				IgnoreBots = true,
			});

			SlashCommandProcessor slashCommands = new SlashCommandProcessor(new SlashCommandConfiguration
			{
				UnconditionallyOverwriteCommands = true
			});

			extension.AddProcessor(slashCommands);
			extension.AddProcessor(textCommandProcessor);
		}, new CommandsConfiguration
		{
			RegisterDefaultCommandProcessors = true,
			DebugGuildId = 292411419528265728,
		});

		builder.ConfigureEventHandlers((EventHandlingBuilder eventBuilder) =>
		{
			eventBuilder.HandleGuildAvailable(Client_OnGuildAvailable);
		});

		DiscordClient bot = builder.Build();

		Client = bot;
		Logger = bot.Logger;

		await bot.ConnectAsync(new DiscordActivity("Ferrari main", DiscordActivityType.Streaming), DiscordUserStatus.Online);
		await clientWebhook.AddWebhookAsync(Cfg.DiscordConfig.Webhook);

		await Task.Delay(-1);
	}

	private static Task Client_OnGuildAvailable(DiscordClient sender, GuildAvailableEventArgs e)
	{
		Channels.RegisterGuild(e.Guild);
		Channels.TryGetChannel(e.Guild, out DiscordChannel _);

		return Task.CompletedTask;
	}

	private static void CurrentDomain_UnhandledException(object sender, UnhandledExceptionEventArgs e)
	{
		Log.Error($"Unhandled exception: {e}");
	}

	private static async Task onRaceControlMessage(RaceControlMessage raceControlMessage)
	{
		if (raceControlMessage.Message.Contains("DELETED"))
		{
			return;
		}

		var timer = new System.Timers.Timer(45_000);
		timer.Elapsed += async (object source, ElapsedEventArgs e) =>
		{
			if (!string.IsNullOrEmpty(raceControlMessage.Message))
			{
				foreach (DiscordChannel discordChannel in Channels.GetChannels())
				{
					await discordChannel?.SendMessageAsync($":loudspeaker: {raceControlMessage.Message}");
				}
			}
		};

		timer.AutoReset = false;
		timer.Enabled = true;
	}

	private static async Task onF1DocumentReceived(RaceDocumentMessage raceDocumentMessage)
	{
		Dictionary<string, Stream> files = new Dictionary<string, Stream>();
		foreach (RaceDocumentMessage.RaceDocumentPicture documentPictureInfo in raceDocumentMessage.Attachments)
		{
			string fileName = documentPictureInfo.PageName;
			byte[] data = documentPictureInfo.AttachmentData.Split('-').Select(b => Convert.ToByte(b, 16)).ToArray();

			files.Add(fileName, new MemoryStream(data));
		}

		DiscordMessageBuilder builder = new DiscordMessageBuilder()
				.WithContent($"{raceDocumentMessage.RaceWeekName} - {raceDocumentMessage.Name}")
				.AddFiles(files);

		foreach (DiscordChannel discordChannel in Channels.GetChannels())
		{
			DiscordThreadChannel thread = await discordChannel.GetThread($"{raceDocumentMessage.RaceWeekName} Documents");
			if (thread is not null)
			{
				await thread.SendMessageAsync(builder);
			}
		}
	}

	private static async Task onWeekendResync(Event gp)
	{
		DateTime startTime = gp.GetFirstEventStartTime();
		string startTimeFormatLong = Formatter.Timestamp(startTime, TimestampFormat.LongDateTime);
		string startTimeFormatRelative = Formatter.Timestamp(startTime, TimestampFormat.RelativeTime);

		Console.WriteLine("Write WEEKEND RESYNC");

		await Channels.SetTitle($"{gp.Name} {startTimeFormatRelative} ({startTimeFormatLong})");
	}

	private static async Task onWeekendScheduled(Event gp)
	{
		DateTime startTime = gp.GetFirstEventStartTime();
		string startTimeFormatLong = Formatter.Timestamp(startTime, TimestampFormat.LongDateTime);
		string startTimeFormatRelative = Formatter.Timestamp(startTime, TimestampFormat.RelativeTime);

		await Channels.SetTitle($"{gp.Name} {startTimeFormatRelative} ({startTimeFormatLong})");

		string name = gp.Name.Replace("FORMULA 1 ", "");
		DiscordEmbedBuilder embed = new DiscordEmbedBuilder()
			//.WithAuthor(name, gp.Profile, gp.Location)
			.WithTitle($"The next Grand Prix is scheduled for {startTimeFormatLong}. See you {startTimeFormatRelative}!")
			.WithImageUrl(gp.Circuit)
			.WithColor(DiscordColor.Green);

		await Channels.WriteEmbed(embed, "<@&1015996154921631754>");
	}

	private static async Task onEventStart(EventSchedule ev)
	{
		if (ev is null)
		{
			return;
		}

		string name = ev.Event?.Name;
		string eventName = ev.SessionTypeString;

		Console.WriteLine(ev.Event.Circuit);

		DiscordEmbedBuilder embed = new DiscordEmbedBuilder()
			//.WithAuthor(name, ev.grandprix.Profile, ev.grandprix.location_flag)
			.WithTitle($"{eventName} started!")
			.WithColor(DiscordColor.Red);

		await Channels.WriteEmbed(embed, "<@&1015996154921631754>");
	}

	private static async Task onWeekendEnd(Event gp)
	{
		Console.WriteLine("OnWeekendEnd");
	}
}