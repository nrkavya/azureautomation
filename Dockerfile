# build server
FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine

WORKDIR /src

COPY frontend.csproj .
RUN dotnet restore

COPY . .
RUN dotnet restore
RUN dotnet build -c Release
RUN dotnet test
RUN dotnet publish -c Release /dist

# production server
FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine
WORKDIR /dist

ENV ASPNETCORE_ENVIRONMENT Production
ENV ASPNETCORE_URLS http://=:80
EXPOSE 80

COPY --from=build /dist .
CMD ["dotnet","frontend.dll"]


