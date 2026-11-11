| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | All menu links work | Site open on home | 1. Click each menu item | Every page loads, menu item is active, no 404, no console errors | High | E2E |
| TC-UI-002 | Responsive layout | Responsive layout | Site open | 1. Resize browser to 375px, 768px, 1440px | No horizontal scroll, menu collapses below 992px, text readable | High | E2E |
| TC-UI-003 | Cart | Main form, valid data | Add item to cart | 1. Open cart, click Place Order | Record is saved, success toast appears, form resets | High | E2E |
| TC-UI-004 | Cart | Main form, empty required fields | Open cart page | 1. Click Place Order with empty fields | Submit blocked, required field errors shown | High | E2E |
| TC-UI-005 | Shop | Search and filter | Open shop page | 1. Type "Cards" in search, 2. Click category filter | Table updates to show matching items, no-result state shown | High | E2E |
| TC-UI-006 | Admin | Delete/Update with confirmation | Dashboard page | 1. Change status, 2. Submit | Updated status reflects in table | Medium | E2E |
| TC-A11Y-001 | A11Y | Keyboard navigation | Any page | 1. Tab through elements | Focus reachable, visible ring, modal traps focus | Medium | E2E |
| TC-A11Y-002 | A11Y | Images and icons | Any page | 1. Inspect elements | Every image has alt text; icons have aria-label | Medium | E2E |
| TC-SEC-001 | Security | Script injection | Any form | 1. Enter &lt;script&gt;alert(1)&lt;/script&gt; | Saved as text, no alert shown | High | E2E |
| TC-API-001 | API | List endpoint | - | GET /api/v1/orders | 200, JSON array, pagination fields | High | API |
| TC-API-002 | API | Create, valid | - | POST /api/v1/orders | 201, Location header, body matches | High | API |
| TC-API-003 | API | Create, invalid | - | POST with missing fields | 400 ProblemDetails | Medium | API |
| TC-API-004 | API | Get, not found | - | GET /orders/uuid | 404 ProblemDetails | Medium | API |
| TC-API-005 | API | No token | - | Request without token | 401 Unauthorized | High | API |
| TC-API-006 | API | Wrong role | - | Request with basic user | 403 Forbidden | Medium | API |
| TC-API-007 | API | Response time | - | Execute requests | Under 500ms on sample data | Medium | API |
