| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | All menu links work | Site open on home | 1. Click each menu item | Every page loads, active link marked, no 404, no console errors | High | E2E |
| TC-UI-002 | Responsive layout | Responsive layout | Site open | 1. Set width to 375px, 768px, 1440px | No horizontal scroll, menu collapses below 992px, text readable | High | E2E |
| TC-UI-003 | Contact Form | Main form, valid data | Contact page | 1. Fill all fields 2. Click submit | Toast message appears, form resets | High | E2E |
| TC-UI-004 | Contact Form | Main form, empty fields | Contact page | 1. Leave fields empty 2. Click submit | Browser validation blocks submission | High | E2E |
| TC-UI-005 | Menu | Menu tabs | Menu page | 1. Click tabs | Content updates, active state reflects | Medium | E2E |
| TC-A11Y-001 | A11Y | Keyboard navigation | Any page | 1. Tab through page | Every element reachable, focus ring visible | High | E2E |
| TC-A11Y-002 | A11Y | Images and icons | Any page | 1. Check source code | Every img has alt, buttons have aria-label | High | E2E |
| TC-SEC-001 | Security | Script injection | Contact form | 1. Enter <script> in field | Treated as text, no alert triggered | High | E2E |
