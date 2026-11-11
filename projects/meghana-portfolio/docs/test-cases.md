| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | All menu links work | Site open on home | 1. Click each menu item | Each section scrolls into view, no 404 | High | E2E |
| TC-UI-002 | Responsive layout | Responsive layout | Site open | 1. Resize browser to 375px, 768px, 1440px | No horizontal scroll, menu collapses, text readable | High | E2E |
| TC-UI-003 | Main form | Contact form, valid data | Site open on contact | 1. Enter name, email, msg. 2. Click send | Success message appears, form clears | High | E2E |
| TC-UI-004 | Main form | Contact form, empty fields | Site open on contact | 1. Submit empty form | Validation errors shown for required fields | High | E2E |
| TC-UI-005 | Theme | Light/Dark mode | Site open | 1. Click theme toggle | UI changes colors, preference saved | Medium | E2E |
| TC-UI-006 | About | Download resume | Site open on about | 1. Click download button | File download initiated | Medium | E2E |
| TC-UI-007 | Projects | Project visibility | Site open on projects | 1. Check project cards | 3 projects visible with images/text | High | E2E |
| TC-A11Y-001 | Keyboard | Keyboard navigation | Site open | 1. Tab through page | Focus visible on all interactive elements | High | E2E |
| TC-A11Y-002 | Images | Alt text | Site open | 1. Inspect images | All have alt tags | Medium | E2E |
| TC-SEC-001 | Security | Script injection | Site open on contact | 1. Input <script> in fields | Text displayed as string, no alert runs | High | E2E |
