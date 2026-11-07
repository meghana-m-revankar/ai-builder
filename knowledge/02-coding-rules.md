# Coding rules (sample - edit to your own standards)

## General
- Folder structure: src/<Project>.Domain, src/<Project>.Application, src/<Project>.Infrastructure, src/<Project>.Web.
- One class per file. File name = class name.
- Mark unfinished logic with // TODO and a short reason.

## .NET
- .NET 8, nullable enabled, async all the way (methods end with Async).
- Interfaces start with I. DTOs end with Dto. Services end with Service.
- No business logic in controllers; controllers call services.

## Database
- PostgreSQL. Table and column names in snake_case. Every table has id (uuid), created_at, updated_at.
- Foreign keys and indexes on every *_id column.
- Approval / history tables are insert-only.

## Security
- Never hard-code passwords, keys or connection strings. Read them from configuration.
- Validate all input. Use parameterised queries only.
