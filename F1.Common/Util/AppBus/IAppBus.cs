namespace F1.Common.AppBus;

public interface IAppBus<T> where T : class
{
    ValueTask PublishAsync(T msg, CancellationToken ct = default);
    IAsyncEnumerable<T> SubscribeAsync(CancellationToken ct);
}