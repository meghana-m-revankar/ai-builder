| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | All menu links work | Site open on home | 1. Click each menu item | Every page loads, active link marked, no 404, no console errors | High | E2E |
| TC-UI-002 | Responsive layout | Responsive layout | Site open on home | 1. Resize to 375px, 768px, 1440px | No horizontal scroll, menu collapses below 992px, text readable | Medium | E2E |
| TC-UI-003 | Order Form | Main form, valid data | Site open on order page | 1. Fill all fields, submit | Record saved, success toast appears, form resets | High | E2E |
| TC-UI-004 | Order Form | Main form, empty required fields | Site open on order page | 1. Click submit without data | Submit blocked, each required field shows error message | High | E2E |
| TC-UI-005 | Catalog | Search and filter | Site open on catalog | 1. Use filter/search | Typing filters the list live; clearing restores; no-result state shown | Medium | E2E |
| TC-UI-006 | Admin | Delete with confirmation | Admin panel open | 1. Click delete on bouquet | Modal asks to confirm; cancel keeps row; confirm removes it, shows toast | Medium | E2E |
| TC-UI-007 | Admin | Mark order delivered | Admin panel open | 1. Click "Mark as Delivered" | Status updates in UI, success message shown | High | E2E |
| TC-A11Y-001 | Accessibility | Keyboard navigation | Site open | 1. Navigate via Tab | Every link, button reachable; focus ring visible; modal traps focus | Medium | A11Y |
| TC-A11Y-002 | Accessibility | Images and icons | Site open | 1. Inspect elements | Every image has alt text; icon-only buttons have aria-label | Medium | A11Y |
| TC-SEC-001 | Security | Script injection | Any form | 1. Enter `<script>alert(1)</script>` | Shows as text, nothing runs | High | SEC |
| TC-API-001 | API | List endpoint | - | GET /api/v1/bouquets | Returns 200, JSON array | High | API |
| TC-API-002 | API | Create, valid | Auth as admin | POST /api/v1/bouquets | Returns 201, matches input | High | API |
| TC-API-003 | API | Create, invalid | Auth as admin | POST /api/v1/bouquets | Returns 400 with field errors | High | API |
| TC-API-004 | API | Get, not found | - | GET /api/v1/orders/invalid-uuid | Returns 404 | Medium | API |
| TC-API-005 | API | No token | - | POST /api/v1/bouquets | Returns 401 | High | SEC |
| TC-API-006 | API | Wrong role | Auth as customer | POST /api/v1/bouquets | Returns 403 | High | SEC |
| TC-API-007 | API | Response time | - | Any endpoint | Answers in under 500ms | Medium | API |
