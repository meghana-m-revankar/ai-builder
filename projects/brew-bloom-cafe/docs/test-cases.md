| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | All menu links work | Site open on home | 1. Click each menu item | Every page loads, active link marked, no 404, no console errors | High | E2E |
| TC-UI-002 | Responsive layout | Responsive layout | Site open | 1. Check at 375px, 768px, 1440px | No horizontal scroll, menu collapses below 992px, text readable | Medium | E2E |
| TC-UI-003 | Contact | Main form, valid data | Contact page open | 1. Enter valid data, click submit | Record is saved, success message shown | High | E2E |
| TC-UI-004 | Contact | Main form, empty required fields | Contact page open | 1. Submit empty form | Submit blocked, error messages show | High | E2E |
| TC-UI-005 | Search/Filter | Search and filter | Flowers page open | 1. Apply filters, 2. Clear filters | Filters update content, clearing restores all, no-result state exists | Medium | E2E |
| TC-UI-006 | Actions | Delete with confirmation | Dashboard open | 1. Attempt delete | Modal asks confirm, confirm removes, toast shown | Medium | E2E |
| TC-A11Y-001 | A11Y | Keyboard navigation | Site open | 1. Tab through all elements | Focus visible, all interactive elements reachable | High | E2E |
| TC-A11Y-002 | A11Y | Images and icons | Site open | 1. Inspect all images | Every image has alt, icon buttons have aria-label | High | E2E |
| TC-SEC-001 | Security | Script injection | Contact page | 1. Inject <script> in input | Text displayed as escaped string, no script executes | High | E2E |
| TC-API-001 | Data | Data consistency | Dashboard open | 1. Verify table data | Data matches site/js/data.js exactly | Medium | E2E |
