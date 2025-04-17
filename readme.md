### Formula 1 Services
#### Heavily WIP for-fun project.

### Requirements
- MySQL/MariaDB
- RedditMQ
- .NET 9.0
- Ghostscript.NET for PDF to PNG conversion.

Contains different apps for collecting and using F1 data.
Uses the F1 API and f1timings live data.

#### F1APIGenerator
- Collects information from the F1 APIs and stores them in MySQL.

#### F1Documents
- Downloads and stores FIA Documents for race events and broadcasts over RabbitMQ.
- Checks for new news articles from Sky & BBC and broadcasts meta info over RabbitMQ.

#### F1LiveTelemetry
- Connects to the F1 Livetimings websocket to get live information about racing events.
- Re-formats and broadcasts over RabbitMQ for other services to consume.

#### F1Manager
- Triggers actions based on race weekend ends and starting.
- Notifies Discord bot of event changes and will be used to tell F1APIGenerator to collect end of race stats.

#### F1Discord
- The discord bot. Mainly waits for RabbitMQ messages to display stuff to users of my Discord.
