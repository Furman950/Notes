FROM mcr.microsoft.com/dotnet/core/aspnet:3.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build
WORKDIR /src
COPY Notes Notes
WORKDIR "/src/Notes"
RUN dotnet build "Notes.csproj" -c Release -o /app/build -r linux-arm

FROM build AS publish
RUN dotnet publish "Notes.csproj" -c Release -o /app/publish -r linux-arm

FROM base AS final
ENV ASPNETCORE_URLS=http://+:5000
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Notes.dll"]