FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /frontend

# COPY *.sln .
COPY *.csproj ./
RUN dotnet restore frontend.csproj

# copy everything else and build app
COPY / .  ./
WORKDIR /frontend
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS runtime
WORKDIR /frontend
COPY --from=build /frontend ./
ENTRYPOINT ["dotnet", "frontend.dll"]
