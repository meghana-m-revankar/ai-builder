| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | All menu links work | Site open on home | 1. Click each menu item | Every page loads, active link marked, no 404, no console errors | High | E2E |
| TC-UI-002 | Responsive layout | Responsive layout | Site open | 1. Resize window to 375px, 768px, 1440px | No horizontal scroll, menu collapses below 992px, text readable | High | E2E |
| TC-UI-003 | Main form | Main form, valid data | Contact page open | 1. Fill name and message; 2. Submit | Record saved (Netlify handles), success message or redirect, form resets | High | E2E |
| TC-UI-004 | Main form | Main form, empty required fields | Contact page open | 1. Click submit without data | Submit blocked, browser validation shows error | High | E2E |
| TC-UI-005 | Search and filter | Search and filter | Shop page open | 1. Filter by category | Table/List updates live; clearing restores rows | Medium | E2E |
| TC-UI-006 | Delete with confirmation | N/A (Read only site) | N/A | N/A | N/A | Low | E2E |
| TC-UI-007 | Language switch | N/A | N/A | N/A | N/A | Low | E2E |
| TC-A11Y-001 | Keyboard navigation | Keyboard navigation | Site open | 1. Tab through menu/links | Every link/button reachable, focus visible | High | E2E |
| TC-A11Y-002 | Images and icons | Images and icons | Site open | 1. Check all img tags | Every image has alt text; icons have labels | High | E2E |
| TC-SEC-001 | Script injection | Script injection | Contact page open | 1. Input `<script>alert(1)</script>` | Stored as text, nothing executes | High | E2E |
