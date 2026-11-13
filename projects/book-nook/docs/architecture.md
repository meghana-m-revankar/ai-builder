# 03 Architecture

## Style: Clean Architecture (onion)
Dependencies point inwards only. Inner layers never reference outer layers.

```
src/
  BookNook.Domain          entities, value objects, enums, domain events, domain exceptions. No framework references.
  BookNook.Application     use cases (commands/queries + handlers), DTOs, validators, interfaces (repositories, services), mapping.
  BookNook.Infrastructure  EF Core DbContext, repositories, migrations, external services, email, file storage, auth providers.
  BookNook.Api             controllers or minimal APIs, middleware, DI setup, OpenAPI, auth config.
  BookNook.Web             Blazor UI (pages, components, view models) - calls Application through the API or directly.
tests/
  BookNook.UnitTests       Domain + Application
  BookNook.IntegrationTests API + database (Testcontainers PostgreSQL)
```

## Solution and project files
```
BookNook.sln                     solution referencing every project below
global.json                       { "sdk": { "version": "8.0.100", "rollForward": "latestFeature" } }
Directory.Build.props             shared: net8.0, Nullable enable, ImplicitUsings enable, TreatWarningsAsErrors true, LangVersion latest
.gitignore                        standard Visual Studio / .NET ignore (bin/, obj/, .vs/, *.user, appsettings.*.local.json, .env)
.editorconfig                     C# naming and formatting rules from 04 SOLID and Code Quality
README.md                         prerequisites, how to run, test commands
src/BookNook.Domain/BookNook.Domain.csproj
src/BookNook.Application/BookNook.Application.csproj
src/BookNook.Infrastructure/BookNook.Infrastructure.csproj
src/BookNook.Api/BookNook.Api.csproj
src/BookNook.Web/BookNook.Web.csproj
tests/BookNook.UnitTests/BookNook.UnitTests.csproj
tests/BookNook.IntegrationTests/BookNook.IntegrationTests.csproj
```

## Program.cs template (Api)
```csharp
using BookNook.Infrastructure;
using BookNook.Infrastructure.Data;
using Serilog;

var builder = WebApplication.CreateBuilder(args);
builder.Host.UseSerilog((ctx, cfg) => cfg.ReadFrom.Configuration(ctx.Configuration).WriteTo.Console());

builder.Services.AddInfrastructure(builder.Configuration);
builder.Services.AddControllers();
builder.Services.AddProblemDetails();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddHealthChecks().AddDbContextCheck<BookNookDbContext>("db", tags: new[] { "ready" });
builder.Services.AddCors(o => o.AddDefaultPolicy(p => p.WithOrigins(builder.Configuration.GetSection("Cors:Origins").Get<string[]>() ?? Array.Empty<string>()).AllowAnyHeader().AllowAnyMethod()));

var app = builder.Build();
app.UseExceptionHandler();
app.UseSerilogRequestLogging();
if (app.Environment.IsDevelopment())
{
    app.UseSwagger(); app.UseSwaggerUI();
    using var scope = app.Services.CreateScope();
    await DbSeeder.SeedAsync(scope.ServiceProvider.GetRequiredService<BookNookDbContext>(), CancellationToken.None);
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
- Names in `snake_case`, tables plural (`books`, `members`, `loans`), columns singular (`book_id`, `member_id`).
- Primary key `id uuid primary key default gen_random_uuid()`.
- Every table: `created_at timestamptz not null default now()`, `updated_at timestamptz not null default now()`.

## How the database is created
```
createdb -U postgres book_nook
psql -U postgres -d book_nook -f db/schema.sql
psql -U postgres -d book_nook -f db/procedures.sql
psql -U postgres -d book_nook -f db/seed.sql
dotnet run --project src/BookNook.Api
```

# 06 Security (OWASP Top 10 baseline)
- As specified by project requirements, login and auth are omitted for this small school library application.
- Input validation via FluentValidation on all commands.
- Parameterized queries via EF Core.

---

# Architecture Document: Book Nook

## Overview
Book Nook is a library management application built for Sunrise School in Pune. It assists librarian Meena Joshi in tracking books, members, book issues, returns, fines, and overdue lists.

## Container Diagram
```flowchart LR
    Browser[Blazor Web UI] -->|HTTP / JSON| Api[.NET 8 API]
    Api -->|EF Core / Npgsql| DB[(PostgreSQL)]
```

## Module List & Responsibilities
- **Domain**: Core entities (`Book`, `Member`, `Loan`), value objects, business invariants (e.g. max 3 active loans, available copy checks).
- **Application**: Use cases (CQRS handlers), DTOs, FluentValidation rules.
- **Infrastructure**: EF Core `BookNookDbContext`, repository implementations, database seeding.
- **Api**: REST endpoints (`/api/v1/books`, `/api/v1/members`, `/api/v1/loans`, `/api/v1/dashboard`).
- **Web**: Interactive Blazor Server UI with Tailwind CSS.

## Entity List
- **Books**: `id`, `title`, `author`, `category`, `isbn`, `total_copies`, `available_copies`, `created_at`, `updated_at`.
- **Members**: `id`, `name`, `class`, `phone`, `email`, `joined_date`, `created_at`, `updated_at`.
- **Loans**: `id`, `book_id`, `member_id`, `issue_date`, `due_date`, `return_date`, `fine`, `created_at`, `updated_at`.

## Use-Case List
- `GetDashboardSummaryQuery`: computes total books, books issued today, overdue loans, and total fines collected.
- `GetBooksQuery`, `CreateBookCommand`, `UpdateBookCommand`, `DeleteBookCommand`.
- `GetMembersQuery`, `CreateMemberCommand`, `UpdateMemberCommand`.
- `IssueBookCommand`: validates book availability and member active loan count (< 3), decrements available copies, creates loan.
- `ReturnBookCommand`: marks loan as returned, increments available copies, calculates fine (₹5 per late day).
- `GetOverdueLoansQuery`: lists loans past due date along with member contact details.

## API Endpoint Table
| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/v1/dashboard` | Dashboard summary metrics |
| GET | `/api/v1/books` | List books (search by title/author) |
| POST | `/api/v1/books` | Add new book |
| PUT | `/api/v1/books/{id}` | Edit book |
| DELETE| `/api/v1/books/{id}` | Delete book |
| GET | `/api/v1/members` | List members |
| POST | `/api/v1/members` | Add member |
| PUT | `/api/v1/members/{id}` | Edit member |
| GET | `/api/v1/loans` | List active/all loans |
| POST | `/api/v1/loans/issue` | Issue book to member |
| POST | `/api/v1/loans/{id}/return` | Return book and calculate fine |
| GET | `/api/v1/loans/overdue` | List overdue loans |

## Key Design Decisions
1. **Clean Architecture**: Strictly isolates domain logic from UI and data access infrastructure.
2. **PostgreSQL with Snake_case**: Standard relational naming conventions backed by EF Core Naming Conventions.
3. **Blazor Server Interactive UI**: Rich interactive components styled with Tailwind CSS via CDN.
