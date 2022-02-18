 # syntax=docker/dockerfile:1
  FROM mcr.microsoft.com/dotnet/aspnet:5.0
  COPY bin/Release/netcoreapp3.1/publish/ App/
  WORKDIR /frontend
  ENTRYPOINT ["dotnet", "frontend.dll"]
