# 08 Seed Data

Every project ships with realistic dummy data in every layer so it can be opened, clicked through and tested immediately.

## Quality of the data
- Realistic for the business and location: real-looking names for the region (e.g. Dubai: Aisha Al Mansoori, Omar Haddad; Almaty: Aigerim Nurlanovna, Daniyar Seitkali), local phone formats (+971 50 123 4567, +7 701 234 5678), correct currency (AED, KZT, USD) and date formats.
- Varied: different statuses, prices, dates spread over the last 90 days and next 30 days, some edge cases (long names, zero stock, cancelled orders, expired licences).
- Consistent across layers: the same products, customers and IDs appear in `data.js`, `seed.sql`, the .NET seeder and the tests.
- Never real people's personal data, never real emails (use `@example.com`).

## Amounts
- At least 10-20 rows per main entity; 5+ rows per lookup table.
- Dashboards: enough data for KPIs and charts to look meaningful (e.g. 12 weeks of figures).

## Where seed data must exist
| Layer | File | Form |
|---|---|---|
| Static site | `site/js/data.js` | `const products = [...]`, `const testimonials = [...]`, `const orders = [...]` with ids, names, prices, `image` (a matching Image Library URL, else a picsum seed URL), `icon` (icon name from the chosen pack, e.g. Lucide `croissant`), status, dates |
| Database | `db/seed.sql` | `insert into ... values ...` for every table, respecting foreign keys and order of insertion; fixed UUIDs so tests can reference them |
| Backend | `src/<Project>.Infrastructure/Data/DbSeeder.cs` | `SeedAsync(DbContext, CancellationToken)` that inserts the same data when the database is empty; called at startup in Development only |
| Tests | `tests/fixtures/*.json` and Postman environment variables | Known IDs and records used by Playwright and Postman tests |

## Example (data.js)
```js
"use strict";
const products = [
  { id: "p-001", name: "Sourdough Country Loaf", category: "Bread", price: 28, currency: "AED", rating: 4.9, reviews: 214, badge: "Best seller", image: "https://picsum.photos/seed/golden-crust-sourdough/800/600", icon: "bi-basket" },
  { id: "p-002", name: "Pistachio Croissant", category: "Pastry", price: 22, currency: "AED", rating: 4.8, reviews: 187, badge: "New", image: "https://picsum.photos/seed/golden-crust-croissant/800/600", icon: "bi-star" }
];
const testimonials = [
  { name: "Aisha Al Mansoori", role: "Regular customer, Jumeirah", avatar: "https://i.pravatar.cc/80?u=aisha", rating: 5, text: "The sourdough is the best I have had outside Europe. Pre-ordering for Friday pickup is so easy." }
];
```

## Before you answer, check
- [ ] Seed data exists in every layer you generate
- [ ] IDs and names match across files
- [ ] Data is realistic for the business, city and currency
