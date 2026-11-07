# Golden Crust Bakery
## Prerequisites
- .NET 8 SDK
- PostgreSQL

## Run
dotnet restore
dotnet ef database update --project src/GoldenCrust.Infrastructure
dotnet run --project src/GoldenCrust.Api
