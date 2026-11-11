| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | Menu links open the right pages | Site open on home | 1. Click each menu item | Each page loads, menu item is active, no 404 | High | E2E |
| TC-UI-002 | Responsive layout | Responsive layout | Site open on home | 1. Resize window to 375px, 768px, 1440px | No horizontal scroll, menu collapses below 992px, text readable | High | E2E |
| TC-UI-005 | Menu Items | Verify menu items | Menu page open | 1. Inspect menu items | All items (Chai, Snacks) visible | High | E2E |
| TC-UI-008 | Content | Contact page details | Contact page open | 1. Check address and timing | Address and timings are visible | High | E2E |
| TC-A11Y-002 | Images and icons | Images and icons | Any page | 1. Check img tags | Every image has alt text | Medium | E2E |
| TC-SEC-001 | Script injection | Script injection check | Any page with input | 1. Attempt `<script>` | Nothing executes | High | E2E |