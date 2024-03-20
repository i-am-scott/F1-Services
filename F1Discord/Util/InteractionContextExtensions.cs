using DSharpPlus.Entities;
using DSharpPlus.SlashCommands;

namespace F1Discord.Util;

internal static class InteractionContextExtensions
{
    static DiscordFollowupMessageBuilder messageBuilder = new DiscordFollowupMessageBuilder
    {
        IsEphemeral = true
    };

    public static async Task<DiscordMessage> ErrorResponse(this InteractionContext ctx, string error)
    {
        messageBuilder.Content = error;
        return await ctx.FollowUpAsync(messageBuilder);
    }

    public static async Task<DiscordMessage> FollowUpEmbedAsync(this InteractionContext ctx, DiscordEmbed embed)
    {
        return await ctx.FollowUpAsync(new DiscordFollowupMessageBuilder().AddEmbed(embed));
    }
}