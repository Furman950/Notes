FROM mcr.microsoft.com/dotnet/core/aspnet:3.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build
WORKDIR /src
COPY Notes Notes
WORKDIR "/src/Notes"
RUN dotnet build "Notes.csproj" -c Release -o /app/build -r linux-arm

FROM build AS publish
RUN dotnet publish "Notes.csproj" -c Release -o /app/publish -r linux-arm

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
COPY --from=build /src/Notes/Pages .
ENTRYPOINT ["dotnet", "Notes.dll"]