# Restriviz POS

Small cafe POS for Bengaluru.

## Prerequisites
- .NET 8.0 SDK
- PostgreSQL 16+

## How to run
1. `createdb -U postgres restriviz`
2. `psql -U postgres -d restriviz -f db/schema.sql`
3. `psql -U postgres -d restriviz -f db/procedures.sql`
4. `psql -U postgres -d restriviz -f db/seed.sql`
5. `dotnet run --project src/Restriviz.Api`
