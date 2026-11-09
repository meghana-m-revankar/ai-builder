# 12 Quality Gate

The pipeline runs `tools/check_project.py <project-folder>` after the agents finish. Any FAIL is sent back to the agent that owns the file, with the exact message. Check these yourself before answering so the first attempt passes.

## Static site (site/)
| Check | Rule |
|---|---|
| Size | `index.html` >= 15 KB, `css/style.css` >= 6 KB, `js/app.js` >= 4 KB, `js/data.js` >= 2 KB |
| Pages | >= 3 HTML pages; every page has `<title>`, `meta description`, one `<h1>` |
| Sections | `index.html` has >= 8 `<section>` (or header/footer + 8 sections) |
| Icons | >= 15 icon uses per page; exactly ONE icon pack loaded |
| Images | >= 3 `<img>` (or image URLs in data.js) on marketing pages |
| Forbidden | no `style="`, `onclick=`, `href="#"`, `lorem`, `Feature 1`, `#0D6EFD` |
| Links | every relative `href`/`src` points to a file that exists |
| Data | `data.js` defines every collection that `app.js` reads |

## .NET backend (src/)
| Check | Rule |
|---|---|
| Entry points | every `*.Api` and `*.Web` project has `Program.cs`, `appsettings.json`, `Properties/launchSettings.json` |
| Project files | every folder under `src/` and `tests/` that holds `.cs` or `.razor` files has a `.csproj`; the `.sln` lists every `.csproj` |
| Build | `dotnet build` exits 0 (warnings are errors: no `async` without `await`, no unused variables, no nullable warnings) |
| Run | `dotnet run --project src/<Prefix>.Api` starts and `GET /health/live` returns 200 |
| Database | the README "How to run" steps work exactly as written (see 05 Database → How the database is created) |

## Common reasons for FAIL (avoid them)
- Writing short versions of files to save space. Write fewer files completely instead, and list the rest in `summary`.
- Copying only part of 09 Site Template. Every renderer and every data collection is required.
- Writing controllers but no `Program.cs`.
- A README that describes steps that were never generated (e.g. EF migrations that do not exist).
