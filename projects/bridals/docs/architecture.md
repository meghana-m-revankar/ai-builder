# 03 Architecture

## Style: Clean Architecture (onion)
Dependencies point inwards only. Inner layers never reference outer layers.

```
src/
  Bridals.Domain          entities, value objects, enums, domain events, domain exceptions. No framework references.
  Bridals.Application     use cases (commands/queries + handlers), DTOs, validators, interfaces (repositories, services), mapping.
  Bridals.Infrastructure  EF Core DbContext, repositories, migrations, external services, email, file storage, auth providers.
  Bridals.Api             controllers or minimal APIs, middleware, DI setup, OpenAPI, auth config.
  Bridals.Web             Blazor UI (pages, components, view models) - calls Application through the API or directly.
tests/
  Bridals.UnitTests       Domain + Application
  Bridals.IntegrationTests API + database (Testcontainers PostgreSQL)
```

## Solution and project files (MUST - the code must open and build in Visual Studio / `dotnet build`)
Every .NET project ships these files at the project root:
```
Bridals.sln                     solution referencing every project below
global.json                       { "sdk": { "version": "8.0.100", "rollForward": "latestFeature" } }
Directory.Build.props             shared: net8.0, Nullable enable, ImplicitUsings enable, TreatWarningsAsErrors true, LangVersion latest
.gitignore                        standard Visual Studio / .NET ignore (bin/, obj/, .vs/, *.user, appsettings.*.local.json, .env)
.editorconfig                     C# naming and formatting rules from 04 SOLID and Code Quality
README.md                         prerequisites, how to run (exact commands from 05 Database → How the database is created), test commands
src/Bridals.Domain/Bridals.Domain.csproj
src/Bridals.Application/Bridals.Application.csproj
src/Bridals.Infrastructure/Bridals.Infrastructure.csproj
src/Bridals.Api/Bridals.Api.csproj                (+ Program.cs, appsettings.json, appsettings.Development.json, Properties/launchSettings.json)
src/Bridals.Web/Bridals.Web.csproj                (+ Program.cs, App.razor, _Imports.razor, wwwroot/)
tests/Bridals.UnitTests/Bridals.UnitTests.csproj
tests/Bridals.IntegrationTests/Bridals.IntegrationTests.csproj
```

**.sln format** (classic, works with .NET 8 and every Visual Studio version). One `Project(...)` block per .csproj with a unique, fixed GUID; solution folders `src` and `tests`; `NestedProjects` puts each project in its folder:
```
Microsoft Visual Studio Solution File, Format Version 12.00
# Visual Studio Version 17
VisualStudioVersion = 17.0.31903.59
MinimumVisualStudioVersion = 10.0.40219.1
Project("{2150E333-8FDC-42A3-9474-1A3956D46DE8}") = "src", "src", "{8F3A1C2B-1111-4A00-9000-000000000001}"
EndProject
Project("{2150E333-8FDC-42A3-9474-1A3956D46DE8}") = "tests", "tests", "{8F3A1C2B-1111-4A00-9000-000000000002}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Bridals.Domain", "src\Bridals.Domain\Bridals.Domain.csproj", "{8F3A1C2B-2222-4A00-9000-000000000001}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Bridals.Api", "src\Bridals.Api\Bridals.Api.csproj", "{8F3A1C2B-2222-4A00-9000-000000000004}"
EndProject
Global
	GlobalSection(SolutionConfigurationPlatforms) = preSolution
		Debug|Any CPU = Debug|Any CPU
		Release|Any CPU = Release|Any CPU
	EndGlobalSection
	GlobalSection(ProjectConfigurationPlatforms) = postSolution
		{8F3A1C2B-2222-4A00-9000-000000000001}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{8F3A1C2B-2222-4A00-9000-000000000001}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{8F3A1C2B-2222-4A00-9000-000000000001}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{8F3A1C2B-2222-4A00-9000-000000000001}.Release|Any CPU.Build.0 = Release|Any CPU
	EndGlobalSection
	GlobalSection(NestedProjects) = preSolution
		{8F3A1C2B-2222-4A00-9000-000000000001} = {8F3A1C2B-1111-4A00-9000-000000000001}
		{8F3A1C2B-2222-4A00-9000-000000000004} = {8F3A1C2B-1111-4A00-9000-000000000001}
	EndGlobalSection
EndGlobal
```
- Repeat the four `ProjectConfigurationPlatforms` lines for every project. Every GUID unique and in upper case. Paths use backslashes.

**Who writes what** (avoids missing or duplicated files):
- Services & API agent: the `.sln`, root files, Domain, Application, Infrastructure and Api projects.
- UI Design agent: the complete `src/Bridals.Web` project (below). It must not write backend projects.
- Test Engineer agent: the `tests/` projects. Full task list per agent: 10 Agent Tasks.
- Each file is written once. No duplicate pages (e.g. `Dashboard.razor` in two places).

**Blazor Web project (MUST be complete, not only pages)** - Blazor Web App, .NET 8, interactive server render mode, Tailwind via CDN in `App.razor`:
```
src/Bridals.Web/
  Bridals.Web.csproj            <Project Sdk="Microsoft.NET.Sdk.Web">, references Application
  Program.cs                      AddRazorComponents().AddInteractiveServerComponents(), HttpClient for the Api, MapRazorComponents<App>().AddInteractiveServerRenderMode()
  appsettings.json                { "ApiBaseUrl": "https://localhost:7001" }
  Properties/launchSettings.json
  Components/App.razor            <html>, <head> with Google Fonts, Tailwind CDN + tailwind.config.js, app.css, <HeadOutlet />; <body> with <Routes /> and blazor.web.js
  Components/Routes.razor         <Router AppAssembly="typeof(Program).Assembly"> with MainLayout and a NotFound page
  Components/_Imports.razor       @using lines for the project namespaces, Microsoft.AspNetCore.Components.Web, static RenderMode
  Components/Layout/MainLayout.razor   sidebar or top nav + @Body, same design system as the static site
  Components/Layout/NavMenu.razor      NavLink items with icons, active state
  Components/Pages/<Page>.razor   one file per page, @page "/route", @rendermode InteractiveServer where interactive
  Components/Shared/*.razor       reusable components (KpiCard, StatusBadge, DataTable, ConfirmDialog, Toast)
  Services/<Entity>ApiClient.cs   typed HttpClient per resource, async, CancellationToken
  wwwroot/css/app.css             tokens + shared component classes (plain CSS, as in 09 Site Template)
  wwwroot/js/tailwind.config.js   same config as the static site
  wwwroot/favicon.svg
```
- Pages get data through the ApiClient services, never directly from the DbContext.
- Seed/demo data comes from the Api (DbSeeder), so pages show real rows on first run.

**.csproj rules** (SDK-style, minimal; shared settings come from Directory.Build.props):
- Domain: `<Project Sdk="Microsoft.NET.Sdk">`, no package or project references.
- Application: references Domain; packages FluentValidation, MediatR (or own handler interfaces).
- Infrastructure: references Application; packages Npgsql.EntityFrameworkCore.PostgreSQL 8.0.10, EFCore.NamingConventions 8.0.3 (no migrations, see 05 Database).
- Api: `<Project Sdk="Microsoft.NET.Sdk.Web">`, references Application and Infrastructure; packages Swashbuckle.AspNetCore, Serilog.AspNetCore.
- Web: `<Project Sdk="Microsoft.NET.Sdk.Web">`, references Application (or calls the Api over HTTP).
- Tests: `<IsPackable>false</IsPackable>`, packages Microsoft.NET.Test.Sdk, xunit, xunit.runner.visualstudio, FluentAssertions, NSubstitute; IntegrationTests also Microsoft.AspNetCore.Mvc.Testing and Testcontainers.PostgreSql.
- Pin package versions (e.g. `Version="8.0.10"`), never `*`.
- Every `.cs` file's namespace matches its project and folder; `Program.cs` registers all services, DbContext, the DbSeeder (Development), Swagger, health checks and the exception middleware.

## Program.cs template (Api, copy and adapt; MUST exist)
```csharp
using Bridals.Infrastructure;
using Bridals.Infrastructure.Data;
using Serilog;

var builder = WebApplication.CreateBuilder(args);
builder.Host.UseSerilog((ctx, cfg) => cfg.ReadFrom.Configuration(ctx.Configuration).WriteTo.Console());

builder.Services.AddInfrastructure(builder.Configuration);   // DbContext, repositories (extension in Infrastructure/DependencyInjection.cs)
builder.Services.AddControllers();
builder.Services.AddProblemDetails();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddHealthChecks().AddDbContextCheck<BridalsDbContext>("db", tags: new[] { "ready" });
builder.Services.AddCors(o => o.AddDefaultPolicy(p => p.WithOrigins(builder.Configuration.GetSection("Cors:Origins").Get<string[]>() ?? Array.Empty<string>()).AllowAnyHeader().AllowAnyMethod()));

var app = builder.Build();
app.UseExceptionHandler();
app.UseSerilogRequestLogging();
if (app.Environment.IsDevelopment())
{
    app.UseSwagger(); app.UseSwaggerUI();
    using var scope = app.Services.CreateScope();
    await DbSeeder.SeedAsync(scope.ServiceProvider.GetRequiredService<BridalsDbContext>(), CancellationToken.None);
}
app.UseCors();
app.MapControllers();
app.MapHealthChecks("/health/live", new() { Predicate = _ => false });
app.MapHealthChecks("/health/ready", new() { Predicate = c => c.Tags.Contains("ready") });
app.Run();

public partial class Program { }   // for WebApplicationFactory in integration tests
```
Matching packages: Api adds `Microsoft.Extensions.Diagnostics.HealthChecks.EntityFrameworkCore 8.0.10`. `appsettings.Development.json` holds `ConnectionStrings:Default` and `Cors:Origins` (`["http://localhost:5500"]`).

## Rules
- **Domain** holds business rules. Entities protect their invariants (private setters, factory methods, guard clauses).
- **Application** orchestrates: one handler per use case (CQRS-lite: `CreateAppointmentCommand`, `GetAppointmentsQuery`). Handlers are thin and testable.
- **Infrastructure** implements interfaces defined in Application. Swap-able without touching business code.
- **Api** contains no business logic. Controllers: validate → send command/query → map result to HTTP.
- Dependency injection everywhere; no `new` for services. Register by interface.
- Configuration through `IOptions<T>`; secrets from environment variables or a vault, never `appsettings.json`.

## API design
- REST, resource nouns, plural: `GET /api/v1/appointments`, `POST /api/v1/appointments`, `GET /api/v1/appointments/{id}`.
- Versioned under `/api/v1`.
- Status codes: 200 OK, 201 Created (with Location), 204 No Content, 400 validation, 401, 403, 404, 409 conflict, 422 business rule, 500.
- Errors as RFC 7807 ProblemDetails `{ type, title, status, detail, errors }`.
- Lists: cursor or page pagination (`?page=1&pageSize=20`, max 100), filtering and sorting parameters, total count in response.
- DTOs for input and output; never expose entities.
- OpenAPI/Swagger with summaries and examples.

## Cross-cutting
- Validation: FluentValidation in Application, run in a pipeline behaviour.
- Errors: global exception middleware → ProblemDetails. No try/catch that swallows errors.
- Logging: structured (Serilog), correlation id per request, no secrets or personal data in logs.
- Health checks: `/health/live`, `/health/ready`.
- Time: store UTC; convert at the edge. Use `TimeProvider` for testability.
- Idempotency key header for create/payment endpoints.

## Documentation the Architect must produce
- Context: users, external systems.
- Container diagram as a Mermaid block (`flowchart LR`).
- Module list with responsibilities.
- Entity list with fields, types, relations.
- Use-case list (command/query per feature).
- API endpoint table.
- Non-functional requirements: security, performance targets, scalability, backups, logging.
- Decisions log (ADR style: decision, reason, alternatives).


## 05-database.md
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

## How the database is created (one way only, MUST)
The SQL files in `db/` are the source of truth. EF Core maps the existing tables and does NOT use migrations.
- DbContext: `ToTable("snake_case_name")` and `UseSnakeCaseNamingConvention()` (package `EFCore.NamingConventions`) so entities match `schema.sql`.
- No `Migrations/` folder, no `dotnet ef` commands anywhere (README included).
- Connection string in `appsettings.Development.json` under `ConnectionStrings:Default`, value `Host=localhost;Port=5432;Database=bridals;Username=postgres;Password=postgres`; overridable with env var `ConnectionStrings__Default`.
- README "How to run" uses exactly:
  ```
  createdb -U postgres bridals
  psql -U postgres -d bridals -f db/schema.sql
  psql -U postgres -d bridals -f db/procedures.sql
  psql -U postgres -d bridals -f db/seed.sql
  dotnet run --project src/Bridals.Api
  ```
- `DbSeeder` (08 Seed Data) only inserts when tables are empty, so it is safe after `seed.sql`.

## Delivery
- `db/schema.sql` (tables, constraints, indexes, comments), `db/procedures.sql`, `db/seed.sql` (realistic sample data, at least 10 rows per main table).
- Migrations are forward-only and repeatable in CI.
- Include an ER diagram as a Mermaid `erDiagram` block in docs.


## 06-security.md
# 06 Security (OWASP Top 10 baseline)

Security is a requirement, not an extra. Every feature must state who can do it.

## Authentication
- OpenID Connect / OAuth 2.0 (e.g. Supabase Auth, Entra ID, Keycloak). JWT access tokens (15 min) + refresh tokens (rotating).
- Passwords (if stored locally): ASP.NET Identity with PBKDF2 or Argon2id, min 12 characters, breached-password check, lockout after 5 failed attempts.
- MFA available for admin and owner roles.

## Authorisation
- Role-based plus policy-based (`[Authorize(Policy = "CanApproveBudget")]`). Deny by default.
- Check ownership on every record access (user can only read their own / their tenant's data) - prevents IDOR.
- Enforce in the API and the database (RLS), never only in the UI.

## Input and output
- Validate every input on the server (type, length, range, format) with FluentValidation.
- Parameterised queries / EF Core only. No string-concatenated SQL.
- Encode output; Blazor encodes by default - never use `MarkupString` with user input.
- File uploads: allow-list extensions and MIME types, max size, rename files, store outside web root, virus scan hook.

## Secrets and configuration
- No secrets in code, git or front-end JavaScript. Use environment variables or a secret vault.
- `.env` and `appsettings.*.local.json` in `.gitignore`. Provide `.env.example` with placeholder values.
- Rotate keys; separate keys per environment.

## Transport and headers
- HTTPS only, HSTS (`max-age=31536000; includeSubDomains`).
- Headers: `Content-Security-Policy`, `X-Content-Type-Options: nosniff`, `Referrer-Policy: strict-origin-when-cross-origin`, `X-Frame-Options: DENY`, `Permissions-Policy`.
- CORS: explicit allowed origins only, never `*` with credentials.
- Cookies: `Secure`, `HttpOnly`, `SameSite=Lax` (or `Strict`); antiforgery tokens for cookie-based forms.

## Abuse protection
- Rate limiting on login, signup, password reset and public APIs (ASP.NET Core RateLimiter).
- Generic error messages to clients ("Invalid email or password"); details only in server logs.
- Idempotency for payments and approvals.

## Data protection
- Encrypt sensitive columns (AES-GCM) and backups. TLS to the database.
- Minimise personal data; define retention; support export and deletion requests.
- Audit log (insert-only) for logins, permission changes, approvals and data exports.

## Logging and monitoring
- Structured logs with correlation id; never log passwords, tokens, card numbers or full personal data.
- Alert on repeated auth failures and 5xx spikes.

## Dependencies and pipeline
- Pin package versions; run `dotnet list package --vulnerable` and Dependabot.
- CI runs build, tests, SAST (CodeQL) and secret scanning before deploy.

## Each architecture document must include
- A threat list (STRIDE) for the main flows with the mitigation for each.
- A permissions matrix: role × action.
