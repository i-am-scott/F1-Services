### Formula 1 Services

Heavily WIP for-fun project.
Contains different apps for collecting and using F1 data.
Uses the F1 API and f1timings live data.

### Requirements
- MySQL/MariaDB
- RedditMQ
- .NET 9.0
- Ghostscript.NET for PDF to PNG conversion.

#### F1.Models & F1.Common
Shared projets with data models and common utilities.

#### F1.APIGenerator
- Collects information from the F1 APIs and stores them in MySQL.

#### F1.Documents
- Downloads and stores FIA Documents for race events and broadcasts over RabbitMQ.
- Checks for new news articles from Sky & BBC and broadcasts meta info over RabbitMQ.

#### F1.LiveTelemetry
- Connects to the F1 Livetimings websocket to get live information about racing events.
- Re-formats and broadcasts over RabbitMQ for other services to consume.

#### F1.Manager
- Triggers actions based on race weekend ends and starting.
- Notifies Discord bot of event changes.
- Will eventually notify F1.APIGenerator to collect end of race data hours after race end.
- Will eventually notify F1.LiveTelemetry to start listening for live events.

#### F1.Discord
- The discord bot. Mainly waits for RabbitMQ messages to display stuff to users of my Discord.
