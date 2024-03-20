using DSharpPlus.Entities;

namespace F1Discord;

public static class Channels
{
    private readonly static HashSet<DiscordGuild> Guilds = new HashSet<DiscordGuild>();
    private readonly static Dictionary<DiscordGuild, DiscordChannel> MappedChannels = new Dictionary<DiscordGuild, DiscordChannel>();

    public static List<DiscordChannel> GetChannels()
    {
        List<DiscordChannel> channels = new List<DiscordChannel>();

        foreach (var guild in Guilds)
        {
            if (TryGetChannel(guild, out var channel))
            {
                channels.Add(channel);
            }
        }

        return channels;
    }

    public static void RegisterGuild(DiscordGuild guild)
    {
        Guilds.Add(guild);
    }

    public static async Task SetTitle(string title)
    {
        foreach (DiscordChannel channel in GetChannels())
        {
            await channel.ModifyAsync(e => e.Topic = title);
        }
    }

    public static async Task WriteEmbed(DiscordEmbed embed, string content = null)
    {
        foreach (DiscordChannel channel in GetChannels())
        {
            await channel.SendMessageAsync(content: content, embed: embed);
        }
    }

    public static async Task WriteEmbed(DiscordEmbedBuilder embedBuilder)
    {
        await WriteEmbed(embedBuilder.Build());
    }

    public static bool TryGetChannel(DiscordGuild guild, out DiscordChannel channel)
    {
        if (MappedChannels.TryGetValue(guild, out channel))
        {
            return true;
        }
        else
        {
#if DEBUG
            DiscordChannel targetChannel = guild.Channels.Where(chan => chan.Value.Name == "bot-testing").FirstOrDefault().Value;
#else
            DiscordChannel targetChannel = guild.Channels.Where(chan => chan.Value.Name == "formula-1").FirstOrDefault().Value;
#endif

            channel = targetChannel;

            if (targetChannel != null)
            {
                MappedChannels.Add(guild, targetChannel);
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}