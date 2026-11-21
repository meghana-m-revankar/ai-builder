# 03 Architecture

## Style: Clean Architecture (onion)
Dependencies point inwards only. Inner layers never reference outer layers.

```
src/
  JioLife.Domain          entities, value objects, enums, domain events, domain exceptions. No framework references.
  JioLife.Application     use cases (commands/queries + handlers), DTOs, validators, interfaces (repositories, services), mapping.
  JioLife.Infrastructure  EF Core DbContext, repositories, migrations, external services, email, file storage, auth providers.
  JioLife.Api             controllers or minimal APIs, middleware, DI setup, OpenAPI, auth config.
  JioLife.Web             Blazor UI (pages, components, view models) - calls Application through the API or directly.
tests/
  JioLife.UnitTests       Domain + Application
  JioLife.IntegrationTests API + database (Testcontainers MySQL)
```

## Solution and project files (MUST - the code must open and build in Visual Studio / `dotnet build`)
Every .NET project ships these files at the project root:
```
JioLife.sln                     solution referencing every project below
global.json                       { "sdk": { "version": "8.0.100", "rollForward": "latestFeature" } }
Directory.Build.props             shared: net8.0, Nullable enable, ImplicitUsings enable, TreatWarningsAsErrors true, LangVersion latest
.gitignore                        standard Visual Studio / .NET ignore (bin/, obj/, .vs/, *.user, appsettings.*.local.json, .env)
.editorconfig                     C# naming and formatting rules from 04 SOLID and Code Quality
README.md                         prerequisites, how to run (exact commands from 05 Database → How the database is created), test commands
src/JioLife.Domain/JioLife.Domain.csproj
src/JioLife.Application/JioLife.Application.csproj
src/JioLife.Infrastructure/JioLife.Infrastructure.csproj
src/JioLife.Api/JioLife.Api.csproj                (+ Program.cs, appsettings.json, appsettings.Development.json, Properties/launchSettings.json)
src/JioLife.Web/JioLife.Web.csproj                (+ Program.cs, App.razor, _Imports.razor, wwwroot/)
tests/JioLife.UnitTests/JioLife.UnitTests.csproj
tests/JioLife.IntegrationTests/JioLife.IntegrationTests.csproj
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
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "JioLife.Domain", "src\JioLife.Domain\JioLife.Domain.csproj", "{8F3A1C2B-2222-4A00-9000-000000000001}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "JioLife.Application", "src\JioLife.Application\JioLife.Application.csproj", "{8F3A1C2B-2222-4A00-9000-000000000002}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "JioLife.Infrastructure", "src\JioLife.Infrastructure\JioLife.Infrastructure.csproj", "{8F3A1C2B-2222-4A00-9000-000000000003}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "JioLife.Api", "src\JioLife.Api\JioLife.Api.csproj", "{8F3A1C2B-2222-4A00-9000-000000000004}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "JioLife.Web", "src\JioLife.Web\JioLife.Web.csproj", "{8F3A1C2B-2222-4A00-9000-000000000005}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "JioLife.UnitTests", "tests\JioLife.UnitTests\JioLife.UnitTests.csproj", "{8F3A1C2B-3333-4A00-9000-000000000001}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "JioLife.IntegrationTests", "tests\JioLife.IntegrationTests\JioLife.IntegrationTests.csproj", "{8F3A1C2B-3333-4A00-9000-000000000002}"
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
		{8F3A1C2B-2222-4A00-9000-000000000002}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{8F3A1C2B-2222-4A00-9000-000000000002}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{8F3A1C2B-2222-4A00-9000-000000000002}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{8F3A1C2B-2222-4A00-9000-000000000002}.Release|Any CPU.Build.0 = Release|Any CPU
		{8F3A1C2B-2222-4A00-9000-000000000003}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{8F3A1C2B-2222-4A00-9000-000000000003}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{8F3A1C2B-2222-4A00-9000-000000000003}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{8F3A1C2B-2222-4A00-9000-000000000003}.Release|Any CPU.Build.0 = Release|Any CPU
		{8F3A1C2B-2222-4A00-9000-000000000004}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{8F3A1C2B-2222-4A00-9000-000000000004}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{8F3A1C2B-2222-4A00-9000-000000000004}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{8F3A1C2B-2222-4A00-9000-000000000004}.Release|Any CPU.Build.0 = Release|Any CPU
		{8F3A1C2B-2222-4A00-9000-000000000005}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{8F3A1C2B-2222-4A00-9000-000000000005}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{8F3A1C2B-2222-4A00-9000-000000000005}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{8F3A1C2B-2222-4A00-9000-000000000005}.Release|Any CPU.Build.0 = Release|Any CPU
		{8F3A1C2B-3333-4A00-9000-000000000001}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{8F3A1C2B-3333-4A00-9000-000000000001}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{8F3A1C2B-3333-4A00-9000-000000000001}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{8F3A1C2B-3333-4A00-9000-000000000001}.Release|Any CPU.Build.0 = Release|Any CPU
		{8F3A1C2B-3333-4A00-9000-000000000002}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{8F3A1C2B-3333-4A00-9000-000000000002}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{8F3A1C2B-3333-4A00-9000-000000000002}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{8F3A1C2B-3333-4A00-9000-000000000002}.Release|Any CPU.Build.0 = Release|Any CPU
	EndGlobalSection
	GlobalSection(NestedProjects) = preSolution
		{8F3A1C2B-2222-4A00-9000-000000000001} = {8F3A1C2B-1111-4A00-9000-000000000001}
		{8F3A1C2B-2222-4A00-9000-000000000002} = {8F3A1C2B-1111-4A00-9000-000000000001}
		{8F3A1C2B-2222-4A00-9000-000000000003} = {8F3A1C2B-1111-4A00-9000-000000000001}
		{8F3A1C2B-2222-4A00-9000-000000000004} = {8F3A1C2B-1111-4A00-9000-000000000001}
		{8F3A1C2B-2222-4A00-9000-000000000005} = {8F3A1C2B-1111-4A00-9000-000000000001}
		{8F3A1C2B-3333-4A00-9000-000000000001} = {8F3A1C2B-1111-4A00-9000-000000000002}
		{8F3A1C2B-3333-4A00-9000-000000000002} = {8F3A1C2B-1111-4A00-9000-000000000002}
	EndGlobalSection
EndGlobal
```

# Architecture Overview (JioLife)

JioLife is a lifestyle and wellness platform providing personalized recommendations, activity tracking, health analytics, and membership services. The platform is designed using Clean Architecture principles on .NET 8, backed by MySQL 8.

## Container Diagram

```mermaid
flowchart LR
    Client[Browser / Blazor Web App] -->|HTTPS / REST| API[JioLife.Api (.NET 8)]
    API -->|EF Core / Pomelo| DB[(MySQL 8 Database)]
    API --> Auth[OpenID Connect Auth Provider]
```

## Modules & Responsibilities
- **Domain**: Core entities (`UserProfile`, `ActivityLog`, `WellnessPlan`, `MetricRecord`), domain validation, invariants.
- **Application**: CQRS Handlers, FluentValidation rules, DTOs, interfaces.
- **Infrastructure**: Entity Framework Core DbContext, MySQL configurations, repositories, caching.
- **Api**: REST controllers, global exception middleware, health checks, Swagger documentation.
- **Web**: Blazor Interactive Server UI with Tailwind CSS (purple and white palette).

## Data Entities
- **UserProfile**: `id`, `email`, `first_name`, `last_name`, `created_at`, `updated_at`, `deleted_at`.
- **ActivityLog**: `id`, `user_id`, `activity_type`, `duration_minutes`, `calories_burned`, `logged_at`.
- **WellnessPlan**: `id`, `title`, `description`, `category`, `price`, `created_at`.
- **MetricRecord**: `id`, `user_id`, `metric_name`, `metric_value`, `recorded_at`.

## API Endpoints
- `GET /api/v1/profiles/{id}`
- `POST /api/v1/activities`
- `GET /api/v1/activities?userId={id}`
- `GET /api/v1/plans`
- `POST /api/v1/metrics`

## Key Design Decisions
1. **Clean Architecture Isolation**: Strict dependency rule ensuring domain logic remains framework-agnostic.
2. **Database Schema Source of Truth**: SQL scripts under `db/` define schema and procedures; EF Core maps directly without code-first migrations.
3. **Brand Aesthetic Revision**: Applied a sophisticated purple and white color scheme to align with modern lifestyle standards while preserving core layout structure.
