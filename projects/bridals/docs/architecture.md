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
		{8F3A1C2B-2222-4A00-9000-000000000004}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{8F3A1C2B-2222-4A00-9000-000000000004}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{8F3A1C2B-2222-4A00-9000-000000000004}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{8F3A1C2B-2222-4A00-9000-000000000004}.Release|Any CPU.Build.0 = Release|Any CPU
	EndGlobalSection
	GlobalSection(NestedProjects) = preSolution
		{8F3A1C2B-2222-4A00-9000-000000000001} = {8F3A1C2B-1111-4A00-9000-000000000001}
		{8F3A1C2B-2222-4A00-9000-000000000004} = {8F3A1C2B-1111-4A00-9000-000000000001}
	EndGlobalSection
EndGlobal
```

## Program.cs template (Api)
```csharp
using Bridals.Infrastructure;
using Bridals.Infrastructure.Data;
using Serilog;

var builder = WebApplication.CreateBuilder(args);
builder.Host.UseSerilog((ctx, cfg) => cfg.ReadFrom.Configuration(ctx.Configuration).WriteTo.Console());

builder.Services.AddInfrastructure(builder.Configuration);
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

public partial class Program { }
```

# 05 Database

## PostgreSQL conventions
- Names in `snake_case`, tables plural (`appointments`), columns singular (`doctor_id`).
- Primary key `id uuid primary key default gen_random_uuid()`.
- Every table: `created_at timestamptz not null default now()`, `updated_at timestamptz not null default now()`, `created_by uuid`, `updated_by uuid`.
- Soft delete: `deleted_at timestamptz null` + partial indexes `where deleted_at is null`.
- Money: `numeric(18,2)` plus `currency char(3)`.

## How the database is created
```
createdb -U postgres bridals
psql -U postgres -d bridals -f db/schema.sql
psql -U postgres -d bridals -f db/procedures.sql
psql -U postgres -d bridals -f db/seed.sql
dotnet run --project src/Bridals.Api
```

# 06 Security (OWASP Top 10 baseline)
- Authentication via JWT / OpenID Connect.
- Authorisation via role-based access control and RLS at DB level.
- Input validation using FluentValidation.
- Secrets managed through environment variables.
- HTTPS enforced with secure headers.
