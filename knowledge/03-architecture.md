# 03 Architecture

## Style: Clean Architecture (onion)
Dependencies point inwards only. Inner layers never reference outer layers.

```
src/
  <Project>.Domain          entities, value objects, enums, domain events, domain exceptions. No framework references.
  <Project>.Application     use cases (commands/queries + handlers), DTOs, validators, interfaces (repositories, services), mapping.
  <Project>.Infrastructure  EF Core DbContext, repositories, migrations, external services, email, file storage, auth providers.
  <Project>.Api             controllers or minimal APIs, middleware, DI setup, OpenAPI, auth config.
  <Project>.Web             Blazor UI (pages, components, view models) - calls Application through the API or directly.
tests/
  <Project>.UnitTests       Domain + Application
  <Project>.IntegrationTests API + database (Testcontainers PostgreSQL)
```

## Solution and project files (MUST - the code must open and build in Visual Studio / `dotnet build`)
Every .NET project ships these files at the project root:
```
<Project>.sln                     solution referencing every project below
global.json                       { "sdk": { "version": "8.0.100", "rollForward": "latestFeature" } }
Directory.Build.props             shared: net8.0, Nullable enable, ImplicitUsings enable, TreatWarningsAsErrors true, LangVersion latest
.gitignore                        standard Visual Studio / .NET ignore (bin/, obj/, .vs/, *.user, appsettings.*.local.json, .env)
.editorconfig                     C# naming and formatting rules from 04 SOLID and Code Quality
README.md                         prerequisites, how to run (exact commands from 05 Database → How the database is created), test commands
src/<Project>.Domain/<Project>.Domain.csproj
src/<Project>.Application/<Project>.Application.csproj
src/<Project>.Infrastructure/<Project>.Infrastructure.csproj
src/<Project>.Api/<Project>.Api.csproj                (+ Program.cs, appsettings.json, appsettings.Development.json, Properties/launchSettings.json)
src/<Project>.Web/<Project>.Web.csproj                (+ Program.cs, App.razor, _Imports.razor, wwwroot/)
tests/<Project>.UnitTests/<Project>.UnitTests.csproj
tests/<Project>.IntegrationTests/<Project>.IntegrationTests.csproj
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
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "GoldenCrust.Domain", "src\GoldenCrust.Domain\GoldenCrust.Domain.csproj", "{8F3A1C2B-2222-4A00-9000-000000000001}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "GoldenCrust.Api", "src\GoldenCrust.Api\GoldenCrust.Api.csproj", "{8F3A1C2B-2222-4A00-9000-000000000004}"
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
- UI Design agent: the complete `src/<Project>.Web` project (below). It must not write backend projects.
- Test Engineer agent: the `tests/` projects. Full task list per agent: 10 Agent Tasks.
- Each file is written once. No duplicate pages (e.g. `Dashboard.razor` in two places).

**Blazor Web project (MUST be complete, not only pages)** - Blazor Web App, .NET 8, interactive server render mode, Tailwind via CDN in `App.razor`:
```
src/<Project>.Web/
  <Project>.Web.csproj            <Project Sdk="Microsoft.NET.Sdk.Web">, references Application
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
using <Prefix>.Infrastructure;
using <Prefix>.Infrastructure.Data;
using Serilog;

var builder = WebApplication.CreateBuilder(args);
builder.Host.UseSerilog((ctx, cfg) => cfg.ReadFrom.Configuration(ctx.Configuration).WriteTo.Console());

builder.Services.AddInfrastructure(builder.Configuration);   // DbContext, repositories (extension in Infrastructure/DependencyInjection.cs)
builder.Services.AddControllers();
builder.Services.AddProblemDetails();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddHealthChecks().AddDbContextCheck<<Prefix>DbContext>("db", tags: new[] { "ready" });
builder.Services.AddCors(o => o.AddDefaultPolicy(p => p.WithOrigins(builder.Configuration.GetSection("Cors:Origins").Get<string[]>() ?? Array.Empty<string>()).AllowAnyHeader().AllowAnyMethod()));

var app = builder.Build();
app.UseExceptionHandler();
app.UseSerilogRequestLogging();
if (app.Environment.IsDevelopment())
{
    app.UseSwagger(); app.UseSwaggerUI();
    using var scope = app.Services.CreateScope();
    await DbSeeder.SeedAsync(scope.ServiceProvider.GetRequiredService<<Prefix>DbContext>(), CancellationToken.None);
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
