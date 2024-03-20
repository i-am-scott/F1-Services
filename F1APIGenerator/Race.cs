using F1.Models;
using HtmlAgilityPack;

namespace F1APIGenerator;

internal class Race
{
    private HtmlDocument raceDocument;
    private HtmlDocument circuitDocument;

    public uint Id { get; set; }
    public int Season { get; set; }
    public string Name { get; set; }

    public string CircuitName { get; set; }
    public string CircuitLocation { get; set; }

    public List<GrandPrixStat> Stats { get; set; } = new List<GrandPrixStat>();
    public List<GrandPrixSchedule> Schedules { get; set; } = new List<GrandPrixSchedule>();

    public Race(HtmlDocument _raceDocument, HtmlDocument _circuitDocument)
    {
        raceDocument = _raceDocument;
        circuitDocument = _circuitDocument;
    }

    public void Load()
    {
        GetBaseContent();
        GetSchedule();
    }

    public void GetBaseContent()
    {
        HtmlNode? mapSection = circuitDocument.DocumentNode.SelectSingleNode("//div[@class='f1-race-hub--map']");
        HtmlNode? circuitNodeName = mapSection.SelectSingleNode(".//fieldset/legend/span[2]");

        HtmlNodeCollection stats = mapSection.SelectNodes(".//div[@class='f1-stat']");

        foreach (HtmlNode node in stats)
        {
            string statName = node.SelectSingleNode(".//p[1]").InnerText;
            string statValue = node.SelectSingleNode(".//p[2]").InnerText;

            Stats.Add(new GrandPrixStat
            {
                name = statName,
                value = statValue
            });
        }

        CircuitName = circuitNodeName.InnerText;
    }

    public void GetSchedule()
    {
        List<HtmlNode?>? dates = raceDocument.DocumentNode.SelectNodes("//div[@class='f1-race-hub--timetable-listings'][1]/div")?.ToList();
        if (dates == null || dates.Count == 0)
        {
            return;
        }

        dates.Reverse();

        DateTime lastStartTime = DateTime.UtcNow;
        DateTime lastEndTime = DateTime.UtcNow + TimeSpan.FromHours(4);

        foreach (var raceDate in dates)
        {
            if (raceDate is null)
            {
                continue;
            }

            string? name = raceDate.SelectSingleNode(".//p[@class='f1-timetable--title']")?.InnerText;
            string timezone = raceDate.GetAttributeValue("data-gmt-offset", "+00:00");

            DateTime startDate;
            DateTime endDate;
            ScheduleStatus status;

            string startTime = raceDate.GetAttributeValue("data-start-time", "0000-00-00T00:00:00");
            string endTime = raceDate.GetAttributeValue("data-end-time", "0000-00-00T00:00:00");

            if (startTime.Contains("TBC") || endTime.Contains("TBC") || timezone.Contains("TBC"))
            {
                startDate = lastStartTime;
                endDate = lastEndTime;

                status = ScheduleStatus.TBC;
            }
            else
            {
                startDate = DateTime.Parse(startTime + timezone);
                endDate = DateTime.Parse(endTime + timezone);

                lastStartTime = startDate;
                lastEndTime = endDate;

                status = ScheduleStatus.CONFIRMED;
            }

            GrandPrixSchedule schedule = new GrandPrixSchedule
            {
                start = startDate,
                end = endDate,
                status = status,
                type = name switch
                {
                    "Race" => RaceType.Race,
                    "Practice 1" => RaceType.FP1,
                    "Practice 2" => RaceType.FP2,
                    "Practice 3" => RaceType.FP3,
                    "Qualifying" => RaceType.Qualifying,
                    "Sprint Shootout" => RaceType.SprintShootout,
                    "Sprint Qualifying" => RaceType.SprintQualifying,
                    "Sprint" => RaceType.Sprint,
                    _ => RaceType.Race,
                }
            };

            Schedules.Add(schedule);
        }
    }
}
