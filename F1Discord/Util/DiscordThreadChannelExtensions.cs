using DSharpPlus.Entities;

namespace F1Discord.Util;

internal static class DiscordThreadChannelExtensions
{
    public static async Task<DiscordThreadChannel> GetThread(this DiscordChannel channel, string name)
    {
        DiscordThreadChannel thread = channel.Threads.Where(t => t.Name == name).FirstOrDefault();
        if (thread != null)
        {
            return thread;
        }
        else
        {
            DiscordMessage gpThread = await channel.SendMessageAsync(name);
            return await channel.CreateThreadAsync(gpThread, name, DiscordAutoArchiveDuration.Week);
        }
    }
}