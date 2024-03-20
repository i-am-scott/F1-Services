FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src

COPY F1Discord.csproj .
RUN dotnet restore "F1Discord.csproj"

COPY . .
RUN dotenet publich "F1Discord.csproj" -c Release -o /publish