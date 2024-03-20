using DSharpPlus;
using DSharpPlus.Entities;
using DSharpPlus.SlashCommands;
using F1Discord.Util;

namespace F1Discord.SlashCommands;

[SlashCommandGroup("f1", "Formula 1 related commands")]
internal class F1Commands : ApplicationCommandModule
{
    [SlashCommand("standings", "Get current or past championship standings", true)]
    public async Task Standings(InteractionContext ctx, [Option("Year", "The season year"), Choice("2023", 2023), Choice("2022", 2022), Choice("2021", 2021)] long year = 2023)
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

    [SlashCommand("constructors", "Get current or past constructor standings", true)]
    public async Task ConstructorStandings(InteractionContext ctx, [Option("Year", "The season year"), Choice("2023", 2023), Choice("2022", 2022), Choice("2021", 2021)] long year = 2023)
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

    [SlashCommand("schedule", "Get the schedule for this year", true)]
    public async Task Events(InteractionContext ctx)
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

    [SlashCommand("next", "Get the next events schedule", true)]
    public async Task NextEvent(InteractionContext ctx)
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

    [SlashCommand("previous", "Get the next events schedule", true)]
    public async Task PreviousEvent(InteractionContext ctx)
    {
        //await ctx.DeferAsync();
        //await DisplayEvent(ctx, await ErgastF1.F1Api.GetPreviousRace());
    }


    [SlashCommand("role", "Gives you the F1 role", true)]
    public async Task F1GiveRole(InteractionContext ctx)
    {
        await ctx.DeferAsync();

        DiscordRole role = ctx.Guild.Roles.Where(r => r.Value.Name == "Formula 1").FirstOrDefault().Value;
        if (role != null)
        {
            await ctx.Member.GrantRoleAsync(role, "Formula 1 bot request");
            await ctx.FollowUpAsync(new DiscordFollowupMessageBuilder().WithContent("Role set!").AsEphemeral());
        }
        else
        {
            await ctx.ErrorResponse("No role was found. Create a role named ``Formula 1!``");
        }
    }

    #region Helpers
    private async Task<DiscordMessage?> DisplayEvent(InteractionContext ctx)
    {
        return null;

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