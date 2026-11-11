# PrintCraft

A custom printing store based in Bangalore.

## Prerequisites
- .NET 8 SDK
- PostgreSQL
- Node.js (for optional JS tooling)

## How to run
1. `createdb -U postgres printcraft`
2. `psql -U postgres -d printcraft -f db/schema.sql`
3. `psql -U postgres -d printcraft -f db/procedures.sql`
4. `psql -U postgres -d printcraft -f db/seed.sql`
5. `dotnet run --project src/PrintCraft.Api`
