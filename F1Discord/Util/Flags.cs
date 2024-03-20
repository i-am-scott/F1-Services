namespace F1Discord.Util;

public static class Flags
{
    private static Dictionary<string, string> flags = new()
    {
        {"default", "white"},
        {"Dutch", "nl"},
        {"Monegasque", "mc"},
        {"Mexican", "mx" },
        {"British", "gb"},
        {"Spanish", "es"},
        {"French", "fr"},
        {"Finnish", "fi"},
        {"Australian", "au"},
        {"German", "de"},
        {"Danish", "dk"},
        {"Japanese", "jp"},
        {"Chinese", "cn"},
        {"Canadian", "ca"},
        {"Thai", "th"},
        {"Russian", "ru"},
        {"Polish", "pl"},
        {"Italian", "it"},
        {"American", "us"}
    };

    public static string Get(string id)
    {
        if (flags.TryGetValue(id, out string flag))
        {
            return ":flag_" + flag + ":";
        }
        else
        {
            return ":flag_" + flags["default"] + ":";
        }
    }
}