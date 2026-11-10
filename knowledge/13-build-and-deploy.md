# 13 Build, Deploy, Images and Layout Rules

Every project is built with `dotnet publish` inside Docker and must start on the first try. A project that does not compile is a failed project, however good it looks. These rules win over any other file when they conflict.

## A. C# must compile (no exceptions)
1. **Every file starts with its `using` lines.** Never rely on a using from another file. Typical ones:
   - EF Core methods (`AnyAsync`, `ToListAsync`, `FirstOrDefaultAsync`, `Include`, `AsNoTracking`, `ExecuteSqlRawAsync`, `FromSqlRaw`) → `using Microsoft.EntityFrameworkCore;`
   - `IConfiguration` → `using Microsoft.Extensions.Configuration;`; `IServiceCollection` → `using Microsoft.Extensions.DependencyInjection;`; `ILogger<T>` → `using Microsoft.Extensions.Logging;`
   - Npgsql → `using Npgsql;`; Dapper → `using Dapper;`; `[ApiController]` → `using Microsoft.AspNetCore.Mvc;`; `[Authorize]` → `using Microsoft.AspNetCore.Authorization;`
2. **Every type you use must exist.** If you reference a class, interface, DTO, enum or method, you must write it in this run or it must be in the Architect's file list. No `// TODO: implement` methods that other code calls; write a simple working body instead.
3. **Every NuGet package you use must be in that project's `.csproj`**, with a fixed version for .NET 8 (e.g. `Microsoft.EntityFrameworkCore` 8.0.10, `Npgsql.EntityFrameworkCore.PostgreSQL` 8.0.10, `Npgsql` 8.0.5, `Dapper` 2.1.35, `Swashbuckle.AspNetCore` 6.5.0, `FluentValidation` 11.9.0, `Microsoft.AspNetCore.Authentication.JwtBearer` 8.0.10, `BCrypt.Net-Next` 4.0.3). Never use a package version above 8.x for Microsoft packages.
4. **Project references follow the layers**: Domain → nothing; Application → Domain; Infrastructure → Application + Domain; Api → Application + Infrastructure; Web → Application (+ Domain). Never Domain → Infrastructure.
5. Namespaces match folders: `<Prefix>.<Layer>.<Folder>`. One public type per file, file name = type name.
6. `async` methods return `Task`/`Task<T>` and take a `CancellationToken ct = default` as the last parameter. Never `async void`.
7. Nullable is on: initialise strings (`= string.Empty;`), mark optional values `?`, use `required` for mandatory DTO properties.
8. Use only .NET 8 APIs. No preview features. No `Program.Main` plus top-level statements in the same project.
9. Never write the same type twice (e.g. `ProductDto` in Application **and** Api).

## B. Configuration that works in Docker
1. Connection string name is **`ConnectionStrings:Default`**, read with `builder.Configuration.GetConnectionString("Default")`. Never hard-code `localhost`.
2. The API listens on whatever `ASPNETCORE_URLS` says (the Docker image sets `http://+:8080`). Do not call `UseUrls` and leave out `app.UseHttpsRedirection()` (Docker serves plain HTTP behind the router).
3. Swagger must be enabled in **all** environments (`app.UseSwagger(); app.UseSwaggerUI();`), not only Development.
4. The Web app calls the API through `builder.Configuration["ApiBaseUrl"]` with a named/typed `HttpClient`. Never hard-code the API address.
5. Add a health endpoint: `app.MapGet("/health", () => Results.Ok("ok"));` in the API.
6. CORS: allow any origin in the API for the demo (`AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod()`).
7. If the database is not reachable at start, the app must still start (log the error; do not crash in `Program.cs`). Retry DB calls in the seeder up to 5 times with a 3-second wait.

## C. SQL that runs on PostgreSQL 16
1. Files: `db/schema.sql` → `db/procedures.sql` → `db/seed.sql`, run in that order. Each must run on an empty database without errors.
2. `CREATE TABLE IF NOT EXISTS`, `CREATE OR REPLACE FUNCTION/PROCEDURE`, `snake_case` names, every column used in procedures and seed must exist in schema with the **same name**.
3. Create tables in dependency order (parents before children). Insert seed data in the same order.
4. Quote nothing that does not need quoting; never use reserved words (`user`, `order`, `group`) as table names: use `users`, `orders`, `user_groups`.
5. Seed with explicit columns: `INSERT INTO products (id, name_en, ...) VALUES (...)`. Text with apostrophes doubles them (`'Chef''s choice'`).

## D. Images: name them so the right photo is found
After generation, every `https://picsum.photos/seed/<seed>/<w>/<h>` URL is **replaced with a real photo found by the words in the seed**. So the seed is a search query:
- Format: `<project-slug>-<2 to 4 words that describe the photo>`, words in English, separated by `-`.
- Good: `souq-bazaar-velvet-sofa-living-room`, `souq-bazaar-brass-table-lamp`, `golden-crust-sourdough-bread-loaf`, `pulse-fitness-woman-lifting-dumbbells`.
- Bad (gets a random photo): `prod-1-1`, `cat-gifts`, `light`, `hero-main`, `img3`, `about-souq`.
- Every product image seed describes **that** product; category seeds describe the category (`souq-bazaar-modern-kitchen-interior`); hero seeds describe the scene (`souq-bazaar-luxury-living-room-interior`).
- Different products get different seeds. Gallery image 2-4 of a product add a word: `...-velvet-sofa-detail`, `...-velvet-sofa-side-view`.
- Use the same seed rules in `db/seed.sql`, `site/js/data.js` and Razor pages.
- Avatars: `https://i.pravatar.cc/150?img=<1-70>`.

## E. Clean, responsive layout (check before you finish)
1. **Mobile first.** Write the phone layout first, then `sm:` `md:` `lg:` `xl:`. Test mentally at 360px, 768px, 1280px.
2. One container everywhere: `mx-auto max-w-7xl px-4 sm:px-6 lg:px-8`. Never full-width text.
3. Section rhythm: `py-16 md:py-24`, heading block `max-w-2xl` with eyebrow + title + one-line intro, then content with `mt-10 md:mt-12`.
4. Grids collapse: `grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4` for products; `gap-6`. No fixed pixel widths on cards; never `w-[...px]` on layout elements.
5. Navbar: logo left, links centre/right on `lg:`; on mobile a hamburger opens a full-width panel. Sticky, white/blur background, `h-16`.
6. Images always in an `aspect-[4/3]` (products), `aspect-[16/9]` (banners) or `aspect-square` box with `object-cover`, so cards line up.
7. Text: max 2 font families, body `text-base leading-7 text-slate-600`, headings `font-semibold tracking-tight text-slate-900`; line length ≤ 70 characters (`max-w-prose`).
8. White space beats decoration: at most one gradient and one accent colour per section; no more than 3 shadow levels; consistent radius (`rounded-2xl` cards, `rounded-full` buttons).
9. Tables on mobile scroll inside `overflow-x-auto`; forms are one column on mobile, two on `md:`.
10. No horizontal scroll at any width: no element wider than the viewport, `overflow-x-hidden` on `body` only as a last resort.
11. RTL (Arabic): use logical classes (`ms-`, `me-`, `ps-`, `pe-`, `start-`, `end-`, `text-start`) instead of `ml-`, `mr-`, `left-`, `right-`, `text-left`; set `dir="rtl"` on `<html>` when the language is Arabic and mirror directional icons (`rtl:rotate-180`).

## F. Final self-check (do it before returning files)
- [ ] Every `.cs` file has the usings for every type/method it uses.
- [ ] Every referenced type/method exists in the file list.
- [ ] Every package used is in the right `.csproj` with an 8.x-compatible version.
- [ ] Every SQL column used in procedures/seed exists in `schema.sql`.
- [ ] Every picsum seed is descriptive (rule D).
- [ ] Layout passes rule E at 360px and 1280px.
