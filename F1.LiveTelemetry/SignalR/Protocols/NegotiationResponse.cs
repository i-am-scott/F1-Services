namespace F1.LiveTelemetry.SignalR.Protocols
{
	internal class NegotiationResponse
	{
		public string Url { get; set; }
		public string ConnectionToken { get; set; }

		public string ConnectionId { get; set; }

		public float KeepAliveTimeout { get; set; }
		public float DisconnectTimeout { get; set; }

		public bool TryWebsockets { get; set; }

		public float ProtocolVersion { get; set; }

		public float LongPollDelay { get; set; }
	}
}