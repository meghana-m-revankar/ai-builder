| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | Menu links open the right pages | Site open | 1. Click each menu item | Each page loads, menu item is active, no 404 | High | E2E |
| TC-UI-002 | Responsive layout | Responsive layout | Site open | 1. View at 375px, 768px, 1440px | No horizontal scroll, menu collapses below 992px, text readable | High | E2E |
| TC-UI-003 | Contact Form | Main form, valid data | Contact page open | 1. Enter valid data, click Send | Success message or redirect, no backend errors | High | E2E |
| TC-UI-004 | Contact Form | Main form, empty required fields | Contact page open | 1. Click Send without filling | Errors shown | High | E2E |
| TC-UI-005 | Dashboard | Search and filter | Dashboard open | 1. Filter orders | Table updates | Medium | E2E |
| TC-UI-006 | Accessibility | Keyboard navigation | Site open | 1. Tab through elements | Focus visible | High | A11Y |
| TC-UI-007 | Accessibility | Images and icons | Site open | 1. Check all images | All have alt text | High | A11Y |
| TC-SEC-001 | Security | Script injection | Contact page open | 1. Input <script> in fields | Text displayed as-is, no execution | High | SEC |
