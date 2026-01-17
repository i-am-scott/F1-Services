using System.Diagnostics;

namespace F1.Common;

internal static class Log
{
    public static void Info(string tag, string message)
    {
        StackTrace stackTrace = new StackTrace(1, true);
        string name = stackTrace.ToString().Split("\n").First().Replace(" in ", "\n      in ").Trim();

        Console.WriteLine($"dbug: {tag}\n      {message}\n      {name}\n");
    }

    public static void Error(string tag, string message)
    {

        StackTrace stackTrace = new StackTrace(1, true);
        string name = stackTrace.ToString().Split("\n").First().Replace(" in ", "\n      in ").Trim();

        ConsoleColor defaultColor = Console.BackgroundColor;

        Console.BackgroundColor = ConsoleColor.DarkRed;
        Console.ForegroundColor = ConsoleColor.Black;

        Console.Write("fail");

        Console.BackgroundColor = defaultColor;
        Console.ForegroundColor = ConsoleColor.White;
        Console.WriteLine($": {tag}\n      {message}\n      {name}\n");
    }

    public static void Info(string message)
    {
        Info("MISCELLANEOUS", message);
    }

    public static void Error(string message)
    {
        Error("ERROR", message);
    }
}
