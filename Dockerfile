FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build

WORKDIR /frontend

COPY /frontend /frontend
RUN dotnet publish -c Release -o out
ENTRYPOINT ["dotnet", "frontend.dll"]

