using F1.Contexts;
using F1.Models;
using RestSharp;

namespace F1.LiveTelemetry.LiveTimingApi;

// https://livetiming.formula1.com/static/2024/Index.json

internal class LiveTimingSession
{

}

internal class LiveTiming
{
	private F1Db f1Db;

	private static RestClient client => new RestClient(new RestClientOptions("https://livetiming.formula1.com/")
	{
		ThrowOnAnyError = true,
		Timeout = TimeSpan.FromSeconds(3)
	});

	Dictionary<string, string> endpoints = new Dictionary<string, string>
	{
		{"session_data", "SessionData.json"},
		{ "session_info", "SessionInfo.jsonStream"},
		{ "archive_status", "ArchiveStatus.json"},
		{ "heartbeat", "Heartbeat.jsonStream"},
		{ "audio_streams", "AudioStreams.jsonStream"},
		{ "driver_list", "DriverList.jsonStream"},
		{ "extrapolated_clock", "ExtrapolatedClock.jsonStream"},
		{ "race_control_messages", "RaceControlMessages.jsonStream"},
		{ "session_status", "SessionStatus.jsonStream"},
		{ "team_radio", "TeamRadio.jsonStream"},
		{ "timing_app_data", "TimingAppData.jsonStream"},
		{ "timing_stats", "TimingStats.jsonStream"},
		{ "track_status", "TrackStatus.jsonStream"},
		{ "weather_data", "WeatherData.jsonStream"},
		{ "position", "Position.z.jsonStream"},
		{ "car_data", "CarData.z.jsonStream"},
		{ "content_streams", "ContentStreams.jsonStream"},
		{ "timing_data", "TimingData.jsonStream"},
		{ "lap_count", "LapCount.jsonStream"},
		{ "championship_prediction", "ChampionshipPrediction.jsonStream"},
		{ "index", "Index.json"}
	};

	public LiveTiming(F1Db db)
	{
		f1Db = db;
	}

	private void decodeStream(string stream)
	{
		string[] fields = stream.Split("\n\r");
		Console.WriteLine(stream);
	}

	internal async Task<LiveTimingSession?> GetGrandPrix(int year, string gp)
	{
		List<Event>? grandsPrix = await f1Db.GetSchedule();
		if (grandsPrix == null)
		{
			return default;
		}

		LiveTimingSession liveTiming = new LiveTimingSession();

		return liveTiming;
	}
}
