# 07 Testing

Every generated project ships with test cases. Tests are written from the user's point of view first, then automated.

## Deliverables
| File | Content | Tool |
|---|---|---|
| `docs/test-cases.md` | Manual test cases table (format below) for every page and API endpoint | People / QA |
| `tests/e2e/*.spec.ts` | Browser tests for the static site and web UI | Playwright |
| `tests/e2e/playwright.config.ts` | Config: baseURL from `BASE_URL` env, Chromium + mobile (iPhone 13), screenshots on failure | Playwright |
| `tests/api/<project>.postman_collection.json` | API tests, Postman Collection v2.1 | Postman / Newman |
| `tests/api/<env>.postman_environment.json` | `baseUrl`, `token` variables (no real secrets) | Postman |
| `tests/<Project>.UnitTests`, `tests/<Project>.IntegrationTests` | .NET tests (see 04 SOLID and Code Quality) | xUnit |

## Test case format (docs/test-cases.md)
| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | Menu links open the right pages | Site open on home | 1. Click each menu item | Each page loads, menu item is active, no 404 | High | E2E |

- IDs: `TC-UI-###` (screens), `TC-API-###` (endpoints), `TC-SEC-###` (security), `TC-A11Y-###` (accessibility).
- Priority: High (blocks release), Medium, Low.
- Every requirement in the brief has at least one test case. Every API endpoint has at least: success, validation error, not found, unauthorised.

## Starter cases every project must include
| ID | Title | Expected result |
|---|---|---|
| TC-UI-001 | All menu links work | Every page loads, active link marked, no 404, no console errors |
| TC-UI-002 | Responsive layout | At 375px, 768px and 1440px: no horizontal scroll, menu collapses below 992px, text readable |
| TC-UI-003 | Main form, valid data | Record is saved and shown in the list, success toast appears, form resets |
| TC-UI-004 | Main form, empty required fields | Submit blocked, each required field shows an error message |
| TC-UI-005 | Search and filter | Typing filters the table live; clearing restores all rows; no-result state shown |
| TC-UI-006 | Delete with confirmation | Modal asks to confirm; cancel keeps the row; confirm removes it and shows a toast |
| TC-UI-007 | Language switch (if more than one language) | All visible text changes language; choice is remembered after reload |
| TC-A11Y-001 | Keyboard navigation | Every link, button and field reachable with Tab, focus ring visible, modal traps focus |
| TC-A11Y-002 | Images and icons | Every image has alt text; icon-only buttons have aria-label |
| TC-SEC-001 | Script injection | Entering `<script>alert(1)</script>` in a form shows it as text, nothing runs |
| TC-API-001 | List endpoint | `GET /api/v1/<resource>` returns 200, JSON array, pagination fields |
| TC-API-002 | Create, valid | `POST` returns 201, `Location` header, body matches input |
| TC-API-003 | Create, invalid | `POST` with missing fields returns 400 ProblemDetails with field errors |
| TC-API-004 | Get, not found | `GET /{random-uuid}` returns 404 ProblemDetails |
| TC-API-005 | No token | Any protected endpoint without token returns 401 |
| TC-API-006 | Wrong role | User without permission returns 403 |
| TC-API-007 | Response time | Each endpoint answers in under 500 ms on sample data |

## Playwright rules
- TypeScript, `@playwright/test`. One spec file per page or feature (`booking.spec.ts`).
- Select elements by role and label: `page.getByRole('button', { name: 'Book visit' })`, `page.getByLabel('Email')`. Never by CSS class or XPath.
- Each test independent: fresh page, own data, no order dependency.
- Use `expect(...).toBeVisible()`, `toHaveURL()`, `toHaveText()`; no fixed `waitForTimeout`.
- Test names match the test case: `test('TC-UI-003 main form saves a valid booking', ...)`.
- Include a mobile project (`devices['iPhone 13']`) and check the menu opens from the hamburger.
- Check no console errors: collect `page.on('console')` errors and assert the list is empty.
- Run: `npx playwright test`; report: `npx playwright show-report`.

## Postman rules
- Collection v2.1 JSON, one folder per resource, requests named `TC-API-002 Create appointment`.
- Use variables only: `{{baseUrl}}`, `{{token}}`, `{{createdId}}`. No hard-coded hosts or secrets.
- Every request has tests in the "Tests" script, e.g.:
  ```js
  pm.test("status is 201", () => pm.response.to.have.status(201));
  pm.test("has id", () => pm.expect(pm.response.json().id).to.be.a("string"));
  pm.collectionVariables.set("createdId", pm.response.json().id);
  pm.test("fast enough", () => pm.expect(pm.response.responseTime).to.be.below(500));
  ```
- Order inside a folder: create → get → list → update → delete → get (expect 404).
- Run in CI with Newman: `newman run tests/api/<project>.postman_collection.json -e tests/api/dev.postman_environment.json`.

## Before you answer, check
- [ ] Every requirement and every endpoint has at least one test case
- [ ] All starter cases above are included and adapted to the project
- [ ] Test case IDs are the same in the table, the Playwright test names and the Postman request names
- [ ] No real passwords, tokens or URLs in test files
