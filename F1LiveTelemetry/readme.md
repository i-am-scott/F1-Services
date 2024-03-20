### F1LiveTelemetry

Connects to Forumal 1's Live Telemetry server.
Send race messages over redis for the Discord bot to handle as it needs.

Note: This does not use a SignalR package but my own rudimentary SignalR connector as a learning experience. It handles basic negotation and invocation. It does not currently support hub requests (its hardcoded to the "Streaming" hub that F1 need.)