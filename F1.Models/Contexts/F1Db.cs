using F1.Common;
using F1.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;

namespace F1.Contexts;

internal class F1Db : DbContext
{
    private ILogger<F1Db> logger;

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

    public F1Db(DbContextOptions<F1Db> options, IOptions<DbConfig> config, ILogger<F1Db> _logger)
    {
        logger = _logger;
        debugStatements = config.Value.Debug;

        connectionString = connectionString
            .Replace("{Host}", config.Value.Host)
            .Replace("{Port}", config.Value.Port.ToString())
            .Replace("{Database}", config.Value.Database)
            .Replace("{Username}", config.Value.Username)
            .Replace("{Password}", config.Value.Password);
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