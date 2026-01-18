using System.Threading.Channels;

namespace F1.Common.AppBus;

public sealed class AppBus<T> : IAppBus<T> where T : class
{
    private readonly Channel<T> channel;

    public AppBus(int capacity = 20, BoundedChannelFullMode fullMode = BoundedChannelFullMode.Wait)
    {
        BoundedChannelOptions options = new BoundedChannelOptions(capacity)
        {
            FullMode = fullMode,
            SingleReader = false,
            SingleWriter = false
        };

        channel = Channel.CreateBounded<T>(options);
    }

    public ValueTask PublishAsync(T msg, CancellationToken ct = default)
        => channel.Writer.WriteAsync(msg, ct);

    public IAsyncEnumerable<T> SubscribeAsync(CancellationToken ct)
        => channel.Reader.ReadAllAsync(ct);
}

public sealed record AppMessage(string Type, string? Payload = null);