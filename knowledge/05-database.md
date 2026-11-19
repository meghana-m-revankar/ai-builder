# 05 Database

The database is always **MySQL 8** (InnoDB, `utf8mb4`). Never write PostgreSQL or SQL Server syntax.

## MySQL conventions
- Names in `snake_case`, tables plural (`appointments`), columns singular (`doctor_id`).
- Every table: `ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci`.
- Primary key `id CHAR(36) NOT NULL PRIMARY KEY DEFAULT (UUID())`.
- Every table: `created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)`, `updated_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3)`, `created_by CHAR(36) NULL`, `updated_by CHAR(36) NULL`.
- Soft delete where business data must be kept: `deleted_at DATETIME(3) NULL` + an index on `deleted_at`; queries filter `WHERE deleted_at IS NULL`.
- Money: `DECIMAL(18,2)` plus `currency CHAR(3)`. Never `FLOAT` or `DOUBLE`.
- Status fields: `VARCHAR(30)` with a `CHECK` constraint, or a lookup table. Document every allowed value.
- Booleans: `TINYINT(1) NOT NULL DEFAULT 0`. Long text: `TEXT`. JSON data: `JSON`.
- Store all times in UTC (the app converts for display).

## Integrity
- Foreign keys on every relation with an explicit `ON DELETE` rule (`RESTRICT` by default).
- `NOT NULL` unless there is a real reason. `UNIQUE` constraints for natural keys (email, code).
- `CHECK` constraints for business rules (e.g. `end_time > start_time`, `amount >= 0`).
- Index every foreign key and every column used in `WHERE`, `ORDER BY` or joins. Composite indexes in query order.
- Normalise to 3NF; denormalise only for proven read performance and document why.
- History/approval/audit tables are insert-only (grant only `SELECT, INSERT` to the app user).

## Stored procedures
- Procedures named `sp_<entity>_<action>` (`sp_appointment_create`); functions `fn_<entity>_<action>`.
- Write them inside `DELIMITER $$ ... $$` and end the file with `DELIMITER ;`. Start each with `DROP PROCEDURE IF EXISTS sp_name;`.
- Validate parameters at the top; raise meaningful errors: `SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'APPOINTMENT_OVERLAP';`.
- Run multi-step changes in one transaction (`START TRANSACTION; ... COMMIT;` with an `EXIT HANDLER FOR SQLEXCEPTION` that does `ROLLBACK; RESIGNAL;`).
- Use parameters only; dynamic SQL only with `PREPARE ... EXECUTE ... USING`.
- Return the created/updated row with a final `SELECT`.
- Comment every procedure: purpose, parameters, errors.
- CRUD for every table: create, get by id, list (with paging `LIMIT ? OFFSET ?`, filter, sort), update, soft delete.

## Security
- Separate users: `app_owner` (schema changes), `app_user` (runtime, least privilege: `SELECT, INSERT, UPDATE, EXECUTE`), `app_readonly` (reporting).
- Multi-tenant data: a `tenant_id` / `client_id` column on every tenant table, always filtered in procedures.
- Never store plain passwords; personal data minimised and documented.

## How the database is created (one way only, MUST)
The SQL files in `db/` are the source of truth. EF Core maps the existing tables and does NOT use migrations.
- DbContext: `UseMySql(connectionString, ServerVersion.AutoDetect(connectionString))` (package `Pomelo.EntityFrameworkCore.MySql` 8.0.2), `ToTable("snake_case_name")` and `UseSnakeCaseNamingConvention()` (package `EFCore.NamingConventions` 8.0.3) so entities match `schema.sql`. Map `Guid` keys to `CHAR(36)`.
- No `Migrations/` folder, no `dotnet ef` commands anywhere (README included).
- Connection string in `appsettings.Development.json` under `ConnectionStrings:Default`, value `Server=localhost;Port=3306;Database=<project_slug>;User=root;Password=root;`; overridable with env var `ConnectionStrings__Default`.
- README "How to run" uses exactly:
  ```
  mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS <project_slug> CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;"
  mysql -u root -p <project_slug> < db/schema.sql
  mysql -u root -p <project_slug> < db/procedures.sql
  mysql -u root -p <project_slug> < db/seed.sql
  dotnet run --project src/<Prefix>.Api
  ```
- `DbSeeder` (08 Seed Data) only inserts when tables are empty, so it is safe after `seed.sql`.

## Delivery
- `db/schema.sql` (tables, constraints, indexes, comments), `db/procedures.sql`, `db/seed.sql` (realistic sample data, at least 10 rows per main table).
- Include an ER diagram as a Mermaid `erDiagram` block in docs.
