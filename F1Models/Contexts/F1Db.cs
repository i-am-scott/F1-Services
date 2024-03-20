using F1.Models;
using F1.Util;
using Microsoft.EntityFrameworkCore;

namespace F1.Contexts;

internal class F1Db : DbContext
{
    private string connectionString = "Server={Host}; Port={Port}; Uid={Username}; Pwd={Password}; Database={Database}";
    private bool debugStatements = false;

    public DbSet<Driver> Drivers { get; set; }

    public DbSet<GrandPrix> GrandsPrix { get; set; }
    public DbSet<GrandPrixSchedule> GrandPrixSchedules { get; set; }

    public F1Db(DbConfig config)
    {
#if !DEBUG
        debugStatements = config.Debug;
#endif

        connectionString = connectionString
            .Replace("{Host}", config.Host)
            .Replace("{Port}", config.Port.ToString())
            .Replace("{Database}", config.Database)
            .Replace("{Username}", config.Username)
            .Replace("{Password}", config.Password);
    }

    public async Task<bool> ConnectAsync()
    {
        try
        {
            await Database.OpenConnectionAsync();
            return true;
        }
        catch (Exception ex)
        {
            Log.Error(ex.Message);
            return false;
        }
    }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        if (debugStatements)
        {
            optionsBuilder.EnableSensitiveDataLogging()
                .EnableDetailedErrors()
                .LogTo(Console.WriteLine);
        }
        optionsBuilder.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString));
    }

    internal async Task<GrandPrix?> GetLastGrandPrixAsync()
    {
        DateTime dateNow = DateTime.UtcNow.Date;
        List<GrandPrix> grandsPrix = await GrandsPrix.Where(g => g.weekend < dateNow && g.weekend.AddDays(3) < dateNow)
            .Include(g => g.GrandPrixSchedules)
            .Include(g => g.GrandPrixStats)
            .OrderBy(g => g.weekend)
            .OrderByDescending(g => g.weekend)
            .Take(1)
            .ToListAsync();

        return grandsPrix.LastOrDefault();
    }

    internal async Task<GrandPrix?> GetCurrentGrandPrixAsync()
    {
        DateTime dateNow = DateTime.UtcNow.Date;
        List<GrandPrix> grandsPrix = await GrandsPrix.Where(g => (dateNow >= g.weekend) && (dateNow < g.weekend.AddDays(3)))
            .Include(g => g.GrandPrixSchedules)
            .Include(g => g.GrandPrixStats)
            .OrderBy(g => g.weekend)
            .Take(1)
            .ToListAsync();

        return grandsPrix.LastOrDefault();
    }

    internal async Task<GrandPrix?> GetNextGrandPrix(GrandPrix? current = null)
    {
        current ??= await GetCurrentGrandPrixAsync() ?? await GetLastGrandPrixAsync();
        if (current == null)
        {
            return default;
        }

        return await GrandsPrix.Where(g => g.id > current.id)
            .Include(g => g.GrandPrixSchedules)
            .Include(g => g.GrandPrixStats)
            .Take(1)
            .FirstOrDefaultAsync();
    }

    internal async Task<List<GrandPrix>?> GetSchedule(int year = 2024)
    {
        return await GrandsPrix.Where(g => g.season == year).Include(g => g.GrandPrixSchedules).ToListAsync();
    }
}