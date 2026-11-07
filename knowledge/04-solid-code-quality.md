# 04 SOLID and Code Quality

## SOLID (apply in every class)
- **S - Single Responsibility**: a class has one reason to change. `AppointmentService` books appointments; it does not send emails (that is `INotificationService`) or format PDFs.
- **O - Open/Closed**: extend behaviour by adding classes, not editing existing ones. Use strategies/handlers (e.g. `IPricingRule` implementations) instead of growing `switch` statements.
- **L - Liskov Substitution**: subclasses and implementations must honour the interface contract. No implementation throws `NotImplementedException` for a method the interface promises.
- **I - Interface Segregation**: small, focused interfaces (`IAppointmentReader`, `IAppointmentWriter`) instead of one huge `IRepository` with 30 methods.
- **D - Dependency Inversion**: depend on abstractions. Constructors receive interfaces; Application defines the interfaces, Infrastructure implements them.

## Also
- **DRY**: no copy-pasted logic; extract shared code. **KISS**: the simplest design that works. **YAGNI**: no speculative features.
- Composition over inheritance. Inheritance max 2 levels.
- Guard clauses at the top of methods; return early instead of deep nesting.
- Methods under ~30 lines, classes under ~300 lines, max 4 parameters (otherwise a parameter object).
- No magic numbers or strings: constants or enums.
- Use a `Result<T>` (success/failure with error) for expected business failures; exceptions only for unexpected errors.

## C# / .NET conventions
- .NET 8, C# 12, `<Nullable>enable</Nullable>`, `<TreatWarningsAsErrors>true</TreatWarningsAsErrors>`.
- Naming: PascalCase types/methods/properties, camelCase locals/parameters, `_camelCase` private fields, `I` prefix for interfaces, `Async` suffix for async methods.
- Suffixes: `Dto`, `Command`, `Query`, `Handler`, `Validator`, `Service`, `Repository`, `Options`.
- `async`/`await` all the way, pass `CancellationToken` through every async method. Never `.Result` or `.Wait()`.
- `record` for DTOs and value objects; `sealed` classes by default.
- One public type per file; file name = type name; namespace = folder path.
- XML doc comments on public interfaces and API endpoints.
- Unfinished work: `// TODO(<reason>)`.

## Testing
- Unit tests for every handler and domain rule (xUnit + FluentAssertions + NSubstitute).
- Test names: `Method_State_ExpectedResult`.
- Arrange / Act / Assert, one behaviour per test.
- Integration tests for each API endpoint (happy path + validation error + not found + unauthorised).
- Target: 80% coverage on Domain and Application.

## Front-end code (Blazor / JS)
- Components small and reusable; pages compose components.
- No business logic in components; call services.
- State in one place per page; no duplicated state.
