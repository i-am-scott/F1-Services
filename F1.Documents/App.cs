using F1.Common;
using F1.Common.AppBus;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace F1.Documents;

/* 
    https://learn.microsoft.com/en-us/dotnet/api/system.timezoneinfo.findsystemtimezonebyid?view=net-8.0&redirectedfrom=MSDN#System_TimeZoneInfo_FindSystemTimeZoneById_System_String_
    https://stackoverflow.com/questions/7374731/net-save-datetime-and-completely-ignore-timezone
    Unix to UtcNow -> DateTime timestamp = DateTime.UnixEpoch.AddSeconds(seconds);
    UtcNow to Unix -> long seconds = (long) DateTime.UtcNow.Subtract(DateTime.UnixEpoch).TotalSeconds;
*/

internal class App
{
    internal readonly static Timings Timings = new Timings();

    static async Task Main(string[] args)
    {
        HostApplicationBuilder builder = Host.CreateApplicationBuilder(args);
        builder.Configuration
            .SetBasePath(AppContext.BaseDirectory)
            .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
            .AddJsonFile($"appsettings.{builder.Environment.EnvironmentName}.json", optional: true, reloadOnChange: true)
            .AddEnvironmentVariables()
            .AddCommandLine(args);

        builder.Logging.ClearProviders();
        builder.Logging.AddConsole();

        builder.Services.Configure<RabbitMQConfig>(builder.Configuration.GetSection("RabbitMQ"));

        builder.Services.AddHttpClient();

        builder.Services.AddSingleton<RabbitMQConnectionService>();
        builder.Services.AddHostedService<RabbitMQConnectionService>();

        builder.Services.AddSingleton<IAppBus<RaceDocument>, AppBus<RaceDocument>>();

        builder.Services.AddHostedService<DocumentConsumer>();
        builder.Services.AddHostedService<DocumentPoller>();
        
        using IHost host = builder.Build();

        await host.RunAsync();
    }
}