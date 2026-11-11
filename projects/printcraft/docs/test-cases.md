| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | All menu links work | Site open on home | 1. Click each menu item | Every page loads, active link marked, no 404 | High | E2E |
| TC-UI-002 | Responsive layout | Responsive layout | Site open | 1. Resize to 375px, 768px, 1440px | No horizontal scroll, menu collapses below 992px | High | E2E |
| TC-UI-003 | Cart | Main form, valid data | Add item to cart | 1. Enter details, checkout | Success toast, form reset, cart cleared | High | E2E |
| TC-UI-004 | Cart | Main form, empty fields | Open cart | 1. Leave fields empty, submit | Submit blocked, error messages show | High | E2E |
| TC-UI-005 | Shop | Search and filter | Open shop | 1. Search/Filter products | Table updates, clearing restores state | High | E2E |
| TC-UI-006 | Order | Delete/Cancel order | Track order | 1. Cancel order | Confirmation shown, status updates | Medium | E2E |
| TC-UI-007 | Lang | Language switch | N/A | N/A | N/A | Low | E2E |
| TC-A11Y-001 | A11Y | Keyboard navigation | Site open | 1. Use Tab to navigate | All items reachable, focus visible | High | E2E |
| TC-A11Y-002 | A11Y | Images and icons | Site open | 1. Check DOM | All images have alt, icons have aria-labels | High | E2E |
| TC-SEC-001 | Security | Script injection | Open any form | 1. Input `<script>alert(1)</script>` | Renders as text, no alert | High | E2E |
| TC-API-001 | API | List endpoint | GET /api | Returns 200, JSON, pagination | High | API |
| TC-API-002 | API | Create valid | POST /api | 201 Created | High | API |
| TC-API-003 | API | Create invalid | POST /api | 400 Bad Request | High | API |
| TC-API-004 | API | Get not found | GET /uuid | 404 Not Found | High | API |
| TC-API-005 | API | No token | GET /protected | 401 Unauthorized | High | API |
| TC-API-006 | API | Wrong role | GET /admin | 403 Forbidden | High | API |
| TC-API-007 | API | Response time | GET /api | < 500ms | Medium | API |
