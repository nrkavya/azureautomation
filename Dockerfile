FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
<<<<<<< HEAD
WORKDIR /frontend

# COPY *.sln .
COPY *.csproj ./
RUN dotnet restore frontend.csproj
=======
>>>>>>> 770b46b598df095d6ba77e3e77a90b58d564279b

WORKDIR /frontend

COPY /frontend /frontend
RUN dotnet publish -c Release -o out
ENTRYPOINT ["dotnet", "frontend.dll"]

<<<<<<< HEAD
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS runtime
WORKDIR /frontend
COPY --from=build /frontend ./
ENTRYPOINT ["dotnet", "frontend.dll"]
=======
>>>>>>> 770b46b598df095d6ba77e3e77a90b58d564279b
