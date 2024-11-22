namespace F1.Util;

internal class DbConfig
{
    public string Host { set; get; }
    public string Password { set; get; }
    public string Username { set; get; }
    public string Database { set; get; }

    public int Port { get; set; } = 3306;
    public bool Debug { get; set; } = false;
}