using DSharpPlus.Commands.Processors.SlashCommands;
using DSharpPlus.Entities;

namespace F1.Discord.Util;

internal static class InteractionContextExtensions
{
	static DiscordFollowupMessageBuilder messageBuilder = new DiscordFollowupMessageBuilder
	{
		IsEphemeral = true
	};

	public static async Task<DiscordMessage> ErrorResponse(this SlashCommandContext ctx, string error)
	{
		messageBuilder.Content = error;
		return await ctx.FollowupAsync(messageBuilder);
	}

	public static async Task<DiscordMessage> FollowUpEmbedAsync(this SlashCommandContext ctx, DiscordEmbed embed)
	{
		return await ctx.FollowupAsync(new DiscordFollowupMessageBuilder().AddEmbed(embed));
	}
}