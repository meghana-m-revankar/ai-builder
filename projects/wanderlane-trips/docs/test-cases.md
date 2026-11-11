| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | All menu links work | Site open on home | 1. Click Home, Packages, Contact | Each page loads, menu item active, no 404 | High | E2E |
| TC-UI-002 | Responsive layout | Responsive layout | Site open on home | 1. Resize window to 375px, 768px, 1440px | No horizontal scroll, menu collapses below 992px | High | E2E |
| TC-UI-003 | Enquiry Form | Main form, valid data | Contact page open | 1. Fill fields, 2. Submit | Success toast appears, form resets | High | E2E |
| TC-UI-004 | Enquiry Form | Main form, empty required fields | Contact page open | 1. Click submit | Submit blocked, error messages shown | High | E2E |
| TC-UI-005 | Packages | Search and filter | Packages page open | 1. Type in search, 2. Clear | Results update, clear restores list | Medium | E2E |
| TC-UI-006 | Admin/Management | Delete with confirmation | Dashboard open | 1. Click delete on booking, 2. Confirm | Booking removed, toast shown | Medium | E2E |
| TC-A11Y-001 | Accessibility | Keyboard navigation | Any page | 1. Tab through navigation and form | Focus ring visible, logical order | High | E2E |
| TC-A11Y-002 | Accessibility | Images and icons | Any page | 1. Inspect elements | Alt text on all images, aria-labels on icons | High | E2E |
| TC-SEC-001 | Security | Script injection | Contact page | 1. Enter <script> in fields | Text rendered literally, no execution | High | E2E |
| TC-API-001 | API | List endpoint | - | GET /api/v1/packages returns 200 | Returns JSON array | High | API |
| TC-API-002 | API | Create, valid | - | POST /api/v1/enquiries returns 201 | Resource created | High | API |
| TC-API-003 | API | Create, invalid | - | POST /api/v1/enquiries returns 400 | Validation error returned | High | API |
| TC-API-004 | API | Get, not found | - | GET /api/v1/packages/invalid-id | 404 Returned | Medium | API |
| TC-API-005 | API | No token | - | Request without auth | 401 Returned | High | API |
| TC-API-006 | API | Response time | - | Any endpoint call | < 500ms | Medium | API |
