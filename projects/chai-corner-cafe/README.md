# Chai Corner Café API

## Prerequisites
- .NET 8 SDK
- PostgreSQL

## How to run
1. createdb -U postgres chaicorner
2. psql -U postgres -d chaicorner -f db/schema.sql
3. psql -U postgres -d chaicorner -f db/procedures.sql
4. psql -U postgres -d chaicorner -f db/seed.sql
5. dotnet run --project src/ChaiCorner.Api
