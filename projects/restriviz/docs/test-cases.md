| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | All menu links work | Site open on home | 1. Click each menu item | Each page loads, menu item is active, no 404 | High | E2E |
| TC-UI-002 | Responsive layout | Responsive layout | Site open | 1. Resize to 375px, 768px, 1440px | No horizontal scroll, menu collapses below 992px | High | E2E |
| TC-UI-003 | POS | Main form, valid data | POS page open | 1. Add item to cart, click Process Payment | Record saved, success toast appears, form resets | High | E2E |
| TC-UI-004 | POS | Main form, empty required fields | POS page open | 1. Click Process Payment with empty cart | Submit blocked, error message shown | High | E2E |
| TC-UI-005 | Menu | Search and filter | POS page open | 1. Type in search, select category | Items filter live, clearing works | High | E2E |
| TC-UI-006 | Menu | Delete with confirmation | Menu tab open | 1. Click delete, cancel modal | Modal asks to confirm, cancel keeps row | Medium | E2E |
| TC-UI-007 | Theme | Theme switch | Dashboard open | 1. Click Toggle Theme | Background and text update; persists on reload | Medium | E2E |
| TC-A11Y-001 | Accessibility | Keyboard navigation | Site open | 1. Tab through all elements | Focus ring visible, all interactive items reachable | High | E2E |
| TC-A11Y-002 | Accessibility | Images and icons | Site open | 1. Check all images for alt, buttons for aria-label | All assets have accessible descriptions | High | E2E |
| TC-SEC-001 | Security | Script injection | Any form | 1. Input &lt;script&gt;alert(1)&lt;/script&gt; | Saved as text, no alert executed | High | E2E |
| TC-API-001 | API | List endpoint | - | GET /api/v1/menu | Returns 200, JSON array, pagination | High | API |
| TC-API-002 | API | Create, valid | - | POST /api/v1/menu | 201 Created, location header, body matches | High | API |
| TC-API-003 | API | Create, invalid | - | POST /api/v1/menu | 400 ProblemDetails, field errors | High | API |
| TC-API-004 | API | Get, not found | - | GET /api/v1/menu/{id} | 404 ProblemDetails | High | API |
| TC-API-005 | API | No token | - | GET /api/v1/menu | 401 Unauthorized | High | API |
| TC-API-006 | API | Wrong role | - | POST /api/v1/menu | 403 Forbidden | High | API |
| TC-API-007 | API | Response time | - | Any endpoint | Response < 500ms | High | API |
