FROM microsoft/aspnetcore:latest

WORKDIR /frontend

COPY /frontend /frontend
RUN dotnet publish -c Release -o out
ENTRYPOINT ["dotnet", "frontend.dll"]

