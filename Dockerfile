FROM microsoft/aspnetcore-build:1.1 AS builder
WORKDIR /source
COPY . .
RUN dotnet restore
RUN dotnet publish --output /output --configuration Release
RUN dotnet --version

FROM microsoft/aspnetcore:1.1
COPY --from=builder /output /app
WORKDIR /app
ENTRYPOINT ["dotnet", "souq-corewebapp.dll"]