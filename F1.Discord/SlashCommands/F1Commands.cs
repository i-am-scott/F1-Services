using DSharpPlus.Commands;
using DSharpPlus.Commands.Processors.SlashCommands;
using DSharpPlus.Commands.Processors.SlashCommands.ArgumentModifiers;
using DSharpPlus.Commands.Trees;
using DSharpPlus.Entities;
using F1.Discord.Util;
using System.ComponentModel;

namespace F1.Discord.SlashCommands;

public class YearProvider : IChoiceProvider
{
	private static readonly IEnumerable<DiscordApplicationCommandOptionChoice> seasonYears =
	[
		new DiscordApplicationCommandOptionChoice("Y2025Y", "2025"),
	];

	ValueTask<IEnumerable<DiscordApplicationCommandOptionChoice>> IChoiceProvider.ProvideAsync(CommandParameter parameter)
	{
		return ValueTask.FromResult(seasonYears);
	}
}

[Command("f1"), Description("Formula 1 related commands")]
public static class F1Commands
{
	[Command("standings"), Description("Get current or past championship standings")]
	public static async Task Standings(SlashCommandContext ctx, [Description("The season year"), SlashChoiceProvider<YearProvider>] int year = 2025)
	{
		/*await ctx.DeferAsync();

        Tuple<string, string> option = new("year", year.ToString());
        StandingsResponse standingsResponse = await ErgastF1.F1Api.DeserializeEndpoint<StandingsResponse>(ErgastF1.F1Api.RequestType.CurrentStandings, option);

        if (standingsResponse == null || standingsResponse.total == 0)
        {
            await ctx.ErrorResponse("Unable to load standings. Try again later.");
            return;
        }
        else
        {
            DiscordEmbedBuilder embed = new DiscordEmbedBuilder()
                .WithTitle($":checkered_flag: Championship Standings for {year}");

            foreach (Standing standing in standingsResponse.GetStandings())
            {
                embed.AddField(Flags.Get(standing.Driver.nationality) + " " + standing.Driver.code, standing.points.ToString(), true);
            }

            await ctx.FollowUpEmbedAsync(embed);
        }*/
	}

	[Command("constructors"), Description("Get current or past constructor standings")]
	public static async Task ConstructorStandings(SlashCommandContext ctx, [Description("The season year"), SlashChoiceProvider<YearProvider>] long year = 2025)
	{
		/*await ctx.DeferAsync();

        Tuple<string, string> option = new("year", year.ToString());
        ConstructorResponse standingsResponse = await ErgastF1.F1Api.DeserializeEndpoint<ConstructorResponse>(ErgastF1.F1Api.RequestType.ConstructorStandings, option);

        if (standingsResponse == null || standingsResponse.total == 0)
        {
            await ctx.ErrorResponse("Unable to load standings. Try again later.");
        }
        else
        {
            DiscordEmbedBuilder embed = new DiscordEmbedBuilder()
                .WithTitle($":checkered_flag: Constructor Standings for {year}");

            foreach (ConstructorStanding standing in standingsResponse.GetStandings())
            {
                embed.AddField(standing.Constructor.name, standing.points.ToString(), true);
            }

            await ctx.FollowUpEmbedAsync(embed);
        }*/
	}

	[Command("schedule"), Description("Get the schedule for this year")]
	public static async Task Events(SlashCommandContext ctx)
	{
		/*await ctx.DeferAsync();

        EventsResponse eventResponse = await ErgastF1.F1Api.DeserializeEndpoint<EventsResponse>(ErgastF1.F1Api.RequestType.Events);

        if (eventResponse == null || eventResponse.total == 0)
        {
            await ctx.ErrorResponse("Unable to load events. Try again later.");
        }
        else
        {
            eventResponse.TryGetNextEvent(out Race nextRace);

            DiscordEmbedBuilder embed = new DiscordEmbedBuilder()
                .WithTitle($":race_car: All events this season!");

            foreach (Race race in eventResponse.GetEvents())
            {
                race.GetEmbedField(ref embed, nextRace.round == race.round);
            }

            await ctx.FollowUpEmbedAsync(embed);
        }*/
	}

	[Command("next"), Description("Get the next events schedule")]
	public static async Task NextEvent(SlashCommandContext ctx)
	{
		/*await ctx.DeferAsync();

        Race nextRace = await ErgastF1.F1Api.GetNextRace();
        await DisplayEvent(ctx, nextRace);

        string relativeTime = Formatter.Timestamp(nextRace.DateTime, TimestampFormat.RelativeTime);
        string longTime = Formatter.Timestamp(nextRace.DateTime, TimestampFormat.LongDateTime);

        DiscordThreadChannel thread = await ctx.Channel.GetThread($"{nextRace.raceName} {nextRace.DateTime.Year}");
        string topicTitle = $"{thread.Mention} {relativeTime} - {longTime}";

        if (ctx.Channel.Topic != topicTitle)
        {
            await ctx.Channel.ModifyAsync(x =>
            {
                x.Topic = topicTitle;
            });
        }*/
	}

	[Command("previous"), Description("Get the next events schedule")]
	public static async Task PreviousEvent(SlashCommandContext ctx)
	{
		//await ctx.DeferAsync();
		//await DisplayEvent(ctx, await ErgastF1.F1Api.GetPreviousRace());
	}

	private static DiscordFollowupMessageBuilder Message = new DiscordFollowupMessageBuilder
	{
		IsEphemeral = true,
	};

	[Command("role"), Description("Gives you the F1 role")]
	public static async Task F1GiveRole(SlashCommandContext ctx)
	{
        if (ctx.Guild is null || ctx.Member is null)
        {
            return;
        }

        await ctx.DeferResponseAsync();

		DiscordRole? role = ctx.Guild.Roles.Where(r => r.Value.Name == "Formula 1").FirstOrDefault().Value;
		if (role is not null)
		{
			Message.Content = "Role set!";

			await ctx.Member.GrantRoleAsync(role, "Formula 1 bot request");
			await ctx.FollowupAsync(Message);
		}
		else
		{
			await ctx.ErrorResponse("No role was found. Create a role named ``Formula 1!``");
		}
	}

	#region Helpers
	private static async Task<DiscordMessage> DisplayEvent(SlashCommandContext ctx)
	{
		throw new NotImplementedException();

        /*
        if (race.Empty)
        {
            return await ctx.ErrorResponse("Unable to load events. Try again later.");
        }
        else
        {
            DiscordEmbedBuilder embed = new DiscordEmbedBuilder()
                .WithTitle($":checkered_flag: {race.Circuit.circuitName}")
                .WithUrl(race.Circuit.url)
                .WithAuthor(race.raceName, url: race.url);

            if (!race.FirstPractice.Empty)
            {
                embed.AddField("FP1", Formatter.Timestamp(race.FirstPractice.DateTime, TimestampFormat.LongDateTime));
            }

            if (!race.SecondPractice.Empty)
            {
                embed.AddField("FP2", Formatter.Timestamp(race.SecondPractice.DateTime, TimestampFormat.LongDateTime));
            }

            if (!race.ThirdFirstPractice.Empty)
            {
                embed.AddField("FP3", Formatter.Timestamp(race.ThirdFirstPractice.DateTime, TimestampFormat.LongDateTime));
            }

            if (!race.Qualifying.Empty)
            {
                embed.AddField("Quali", Formatter.Timestamp(race.Qualifying.DateTime, TimestampFormat.LongDateTime));
            }

            if (!race.Sprint.Empty)
            {
                embed.AddField(":racing_car: Sprint", Formatter.Timestamp(race.Sprint.DateTime, TimestampFormat.LongDateTime));
            }

            embed.ImageUrl = App.Config.Formula1.CircuitImages.Replace("{id}", race.Circuit.circuitId);
            embed.AddField(":checkered_flag: Race Day", Formatter.Timestamp(race.DateTime, TimestampFormat.LongDateTime));
            return await ctx.FollowUpEmbedAsync(embed);
        }
        */
    }
	#endregion
}