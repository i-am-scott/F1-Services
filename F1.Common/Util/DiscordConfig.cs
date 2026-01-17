namespace F1.Common;

public class DiscordConfig
{
    public string Secret { get; set; } = null!;
    public string DevSecret { get; set; } = null!;
    public Uri Webhook { get; set; } = null!;
}