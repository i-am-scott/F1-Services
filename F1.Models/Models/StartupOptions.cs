using CommandLine;

namespace F1.Models;

public class Options
{
    [Option('c', "config", Required = false, HelpText = "Json Configuration. config.json by default.")]
    public string? Config { get; set; }

    public static Options? Instance { get; private set; }

    public static void Startup(string[] args)
    {
        Parser.Default.ParseArguments<Options>(args)
            .WithParsed(options =>
            {
                Instance = options;

                if (!string.IsNullOrEmpty(options.Config))
                {
                    Console.WriteLine($"Configuration path set to: {options.Config}");
                }
            });
    }
}