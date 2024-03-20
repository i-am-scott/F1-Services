### Formula 1 Services

Contains different apps for collecting and using F1 data.
Scrapes the official F1 website for current season data.

#### F1APIGenerator
- Collects information from the F1 website.

#### F1Documents
- Downloads FIA Documents for race events.
- Checks for new news articles from Sky & BBC.

#### F1LiveTelemetry
- Connects to the F1 Livetimings websocket to get live information about racing events.

#### F1Manager
- Triggers actions based on race weekend ends and starting.
- Notifies Discord bot of event changes and will be used to tell F1APIGenerator to collect end of race stats.

#### F1Discord
- The discord bot. Mainly waits for RabbitMQ messages to display stuff to users of my Discord.

Heavily WIP and only does what I need. Feel free to take for whatever you want.
This requires RabbitMQ and MariaDB/MySQL.