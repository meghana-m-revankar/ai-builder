# Pulse Fitness Studio API

## Prerequisites
- .NET 8 SDK
- PostgreSQL

## How to run
1. `dotnet restore`
2. `dotnet ef database update --project src/PulseFitness.Infrastructure --startup-project src/PulseFitness.Api`
3. `dotnet run --project src/PulseFitness.Api`
