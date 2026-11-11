| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | All menu links work | Site open on home | 1. Click each menu item | Every page loads, active link marked, no 404, no console errors | High | E2E |
| TC-UI-002 | Responsive layout | Responsive layout | Site open | 1. Resize to 375px, 768px, 1440px | No horizontal scroll, menu collapses < 992px, text readable | Medium | E2E |
| TC-UI-003 | POS | Main form, valid data | POS page open | 1. Add items to cart; 2. Click Charge | Record saved in LocalStorage, success modal, cart resets | High | E2E |
| TC-UI-004 | POS | Main form, empty required fields | POS page open | 1. Attempt checkout with empty cart | Submit blocked, error message shown | Medium | E2E |
| TC-UI-005 | Analytics | Search and filter | Dashboard open | 1. Interaction with dashboard data | Dashboard KPI cards update, table rows exist | Medium | E2E |
| TC-UI-006 | Inventory | Delete with confirmation | Inventory page open | 1. Delete product | Modal confirms, row removed from UI | High | E2E |
| TC-UI-007 | Inventory | CRUD functionality | Inventory page open | 1. Create/Edit product | Product saves, reflects in table | High | E2E |
| TC-A11Y-001 | Accessibility | Keyboard navigation | Any page open | 1. Tab through elements | Focus ring visible, elements reachable | Medium | E2E |
| TC-A11Y-002 | Accessibility | Images and icons | Any page open | 1. Inspect image tags | All images have alt attributes | Medium | E2E |
| TC-SEC-001 | Security | Script injection | Any form field | 1. Enter <script>alert(1)</script> | Text rendered, no script execution | High | E2E |
| TC-API-001 | LocalStorage | Persistence check | POS/Inventory open | 1. Modify data; 2. Reload | Changes persist across refresh | High | E2E |
