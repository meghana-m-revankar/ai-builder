# 10 Agent Tasks

Each agent reads its own section below and follows it exactly, together with the other rule files. When this file and a prompt disagree, this file wins.

## All agents
- Read 00 Start Here first. Never ask the user for technical details; use its defaults and list assumptions in plain language.
- Before writing code, write a 5-10 line plan in `summary` (pages/sections or projects/files, in order). Then write the files in that order.
- Copy from the templates (09 Site Template, 03 Architecture → Program.cs template) rather than writing from memory. A template part you skip is a missing feature.
- Finish with 12 Quality Gate for your files.
- Output only the files listed for your role. Never write files that belong to another agent.
- Write each file once, with its full path and complete content. No duplicates, no placeholders like "..." or "rest of code here".
- Return valid JSON: `{"summary": "...", "files": [{"path": "...", "content": "..."}]}`. Escape quotes and newlines correctly.
- If you run short of space, finish the files you started and list what is missing in `summary`. Never stop in the middle of a file.

## Architect
- Writes: `docs/architecture.md` (and optionally `docs/security.md`).
- Follows 03 Architecture → "Documentation the Architect must produce" and 06 Security (STRIDE list, permissions matrix).
- Uses the project's real name for the .NET namespace prefix (e.g. "Golden Crust Bakery" → `GoldenCrust`) and states it at the top, so every other agent uses the same prefix.

## DB Designer
- Writes: `db/schema.sql`, `db/seed.sql`. Schema file first.
- Follows 05 Database and 08 Seed Data (at least 10 realistic rows per main table, fixed UUIDs).

## Stored Procs
- Writes: `db/procedures.sql` only.
- CRUD for every table plus the business procedures from the architecture, per 05 Database.

## Services & API
- Writes the backend solution, at most 25 files, each code file under 120 lines:
  - root: `<Prefix>.sln`, `global.json`, `Directory.Build.props`, `.gitignore`, `.editorconfig`, `README.md`
  - `src/<Prefix>.Domain`, `src/<Prefix>.Application`, `src/<Prefix>.Infrastructure` (with `Data/DbSeeder.cs`), `src/<Prefix>.Api` (with `Program.cs`, `appsettings.json`, `Properties/launchSettings.json`)
  - one `.csproj` per project, as in 03 Architecture → Solution and project files
- Write in this order, so the solution always builds even if you run short: `.sln` + root files → all `.csproj` → `Program.cs` + `appsettings*.json` + `launchSettings.json` → DbContext + DbSeeder → feature 1 end to end → feature 2 → feature 3.
- `Program.cs` is copied from 03 Architecture → Program.cs template and adapted. No `async` method without `await` (warnings are errors).
- Covers the 3 most important features end to end (entity → DTO → handler/service → repository → controller). For the rest, create the interfaces and `// TODO`.
- Exactly one DbContext, named `<Prefix>DbContext`, in `src/<Prefix>.Infrastructure/Data/`.
- Does NOT write `src/<Prefix>.Web` (the UI Design agent does) and does NOT write tests (the Test Engineer does).

## UI Design
- Writes: `docs/ui-design.md` and the COMPLETE Blazor Web project `src/<Prefix>.Web` as in 03 Architecture → Blazor Web project: `.csproj`, `Program.cs`, `appsettings.json`, `Properties/launchSettings.json`, `Components/App.razor`, `Components/Routes.razor`, `_Imports.razor`, `Components/Layout/MainLayout.razor`, `Components/Layout/NavMenu.razor`, `Components/Pages/*.razor` (one per screen), `Components/Shared/*.razor`, `Services/*ApiClient.cs`, `wwwroot/css/app.css`, `wwwroot/js/tailwind.config.js`.
- Uses Tailwind and the chosen icon pack (default Lucide) with the 01 Design System tokens, so the Blazor app looks like the static site.
- One file per page; no duplicate pages in different folders.

## Static Site
- Writes everything inside `site/` only, as in 02 Static Site.
- UI framework: the brief's "UI Framework", default **Tailwind**. Icon pack: the brief's "Icon Pack", default **Lucide**.
- Plans each page with 11 Section Recipes (list the recipe numbers per page in `summary`), then builds them from 09 Site Template.
- Write order: `css/style.css` → `js/tailwind.config.js` → `js/data.js` → `js/app.js` → `index.html` → other pages. If space runs out, ship fewer pages completely rather than all pages thin.
- Starts from 09 Site Template and adapts it fully to the project. Thinks as a senior designer and a senior developer at the same time.
- Writes every file completely, including `site/js/tailwind.config.js` and `site/js/data.js` with seed data per 08 Seed Data.
- Meets every "Minimum content" and "Before you answer, check" item in 02 Static Site.

## Test Engineer
- Writes: `docs/test-cases.md`, `tests/e2e/playwright.config.ts`, `tests/e2e/*.spec.ts`, `tests/api/*.postman_collection.json`, `tests/api/dev.postman_environment.json`, and the .NET test projects `tests/<Prefix>.UnitTests` and `tests/<Prefix>.IntegrationTests` (each with its `.csproj`).
- Follows 07 Testing.
