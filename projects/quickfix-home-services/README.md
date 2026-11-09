# QuickFix Home Services

## Prerequisites
- .NET 8 SDK
- PostgreSQL

## How to run
1. createdb -U postgres quickfix
2. psql -U postgres -d quickfix -f db/schema.sql
3. psql -U postgres -d quickfix -f db/procedures.sql
4. psql -U postgres -d quickfix -f db/seed.sql
5. dotnet run --project src/QuickFix.Api
