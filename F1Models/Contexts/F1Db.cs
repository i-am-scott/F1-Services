using F1.Models;
using F1.Util;
using Microsoft.EntityFrameworkCore;

namespace F1.Contexts;

internal class F1Db : DbContext
{
    private string connectionString = "Server={Host}; Port={Port}; Uid={Username}; Pwd={Password}; Database={Database}";
    private bool debugStatements = false;

    public DbSet<Driver> Drivers { get; set; }

    public DbSet<Team> Teams { get; set; }
    public DbSet<Constructor> Constructors { get; set; }

    public DbSet<Championship> Championships { get; set; }

    public DbSet<Event> Events { get; set; }
    public DbSet<EventSchedule> EventSchedules { get; set; }

    public DbSet<EventAward> EventAwards { get; set; }
    public DbSet<EventResult> EventResults { get; set; }

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

    internal async Task<Event?> GetLastGrandPrixAsync()
    {
        DateTime dateNow = DateTime.UtcNow.Date;
        List<Event> grandsPrix = await Events.Where(g => g.Start < dateNow && g.End < dateNow)
            .Include(g => g.EventSchedules)
            .OrderByDescending(g => g.Start)
            .Take(1)
            .ToListAsync();

        return grandsPrix.LastOrDefault();
    }

    internal async Task<Event?> GetCurrentGrandPrixAsync()
    {
        DateTime dateNow = DateTime.UtcNow.Date;
        List<Event> grandsPrix = await Events.Where(g => (dateNow >= g.Start) && (dateNow < g.End))
            .Include(g => g.EventSchedules)
            .OrderBy(g => g.Start)
            .Take(1)
            .ToListAsync();

        return grandsPrix.LastOrDefault();
    }

    internal async Task<Event?> GetNextGrandPrix(Event? current = null)
    {
        current ??= await GetCurrentGrandPrixAsync() ?? await GetLastGrandPrixAsync();
        if (current == null)
        {
            return default;
        }

        return await Events.Where(g => g.Key > current.Key)
            .Include(g => g.EventSchedules)
            .Take(1)
            .FirstOrDefaultAsync();
    }

    internal async Task<List<Event>> GetSchedule(int year = 2025)
    {
        return await Events.Where(g => g.Season == year).Include(g => g.EventSchedules).ToListAsync();
    }
}