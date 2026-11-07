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
