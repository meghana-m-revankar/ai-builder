| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | All menu links work | Site open on home | 1. Click each menu item | Every page loads, active link marked, no 404 | High | E2E |
| TC-UI-002 | Responsive layout | Responsive layout | Site open | 1. Resize to 375px, 768px, 1440px | No horizontal scroll, menu collapses <992px | High | E2E |
| TC-UI-003 | Menu Management | Add/Edit/Delete products | Menu page open | 1. Add valid product, Edit product, Delete | Record saved/updated/removed, toast shown | High | E2E |
| TC-UI-004 | Menu Management | Invalid product data | Menu page open | 1. Try add with empty fields | Submit blocked, error message shown | High | E2E |
| TC-UI-005 | POS Checkout | Cart workflow | POS page open | 1. Select table, add items, click finalize | Subtotal, tax, total calculated correctly | High | E2E |
| TC-UI-006 | Payments | Mark as paid | Payments page open | 1. Select order, select payment method | Receipt generated, toast shown | High | E2E |
| TC-UI-007 | Security | Script injection | Any form open | 1. Submit `<script>` in inputs | Shown as text, not executed | High | E2E |
| TC-A11Y-001 | Accessibility | Keyboard navigation | Any page open | 1. Navigate via Tab | Focus ring visible, all interactive reachable | High | E2E |
| TC-A11Y-002 | Accessibility | Images and icons | Any page open | 1. Check DOM | All images have alt tags | High | E2E |
| TC-API-001 | API | List endpoint | - | GET /api/v1/menu | Returns 200, array | High | API |
| TC-API-002 | API | Create, valid | - | POST /api/v1/menu | Returns 201 | High | API |
| TC-API-003 | API | Create, invalid | - | POST /api/v1/menu | Returns 400 | High | API |
| TC-API-004 | API | Get, not found | - | GET /api/v1/menu/uuid | Returns 404 | High | API |
| TC-API-005 | API | No token | - | Request any protected | Returns 401 | High | API |
| TC-API-006 | API | Wrong role | - | Request admin with cashier token | Returns 403 | High | API |
| TC-API-007 | API | Response time | - | Measure response time | < 500ms | Medium | API |
