# 05 Database

## PostgreSQL conventions
- Names in `snake_case`, tables plural (`appointments`), columns singular (`doctor_id`).
- Primary key `id uuid primary key default gen_random_uuid()`.
- Every table: `created_at timestamptz not null default now()`, `updated_at timestamptz not null default now()`, `created_by uuid`, `updated_by uuid`.
- Soft delete where business data must be kept: `deleted_at timestamptz null` + partial indexes `where deleted_at is null`.
- Money: `numeric(18,2)` plus `currency char(3)`. Never float.
- Status fields: `text` with a `check` constraint, or a lookup table. Document every allowed value.
- Store all times in UTC (`timestamptz`).

## Integrity
- Foreign keys on every relation with an explicit `on delete` rule (`restrict` by default).
- `not null` unless there is a real reason. `unique` constraints for natural keys (email, code).
- `check` constraints for business rules (e.g. `end_time > start_time`, `amount >= 0`).
- Index every foreign key and every column used in `where`, `order by` or joins. Composite indexes in query order.
- Normalise to 3NF; denormalise only for proven read performance and document why.
- History/approval/audit tables are insert-only (revoke update/delete for the app role).

## Functions and procedures
- PL/pgSQL functions named `fn_<entity>_<action>` (`fn_appointment_create`), procedures `sp_<entity>_<action>`.
- Validate parameters at the top; raise meaningful errors: `raise exception 'APPOINTMENT_OVERLAP' using errcode = 'P0001'`.
- Run multi-step changes in one transaction.
- Use parameters only; dynamic SQL only with `format()` and `%I`/`%L` quoting.
- Return the created/updated row (`returns setof appointments` or a typed record).
- Comment every function: purpose, parameters, errors.
- CRUD for every table: create, get by id, list (with paging, filter, sort), update, soft delete.

## Security
- Separate roles: `app_owner` (migrations), `app_user` (runtime, least privilege), `app_readonly` (reporting).
- Row-level security for multi-tenant data (`tenant_id` / `client_id` column + RLS policy).
- Never store plain passwords; personal data minimised and documented.

## Delivery
- `db/schema.sql` (tables, constraints, indexes, comments), `db/procedures.sql`, `db/seed.sql` (realistic sample data, at least 10 rows per main table).
- Migrations are forward-only and repeatable in CI.
- Include an ER diagram as a Mermaid `erDiagram` block in docs.
