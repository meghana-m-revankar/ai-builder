| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | All menu links work | Site open on home | 1. Click each menu item | Every page loads, active link marked, no 404, no console errors | High | E2E |
| TC-UI-002 | Responsive layout | Responsive layout | Site open | 1. Resize viewport to 375px, 768px, 1440px | No horizontal scroll, menu collapses below 992px, text readable | High | E2E |
| TC-UI-008 | Dashboard | Order list displays correctly | Site open on dashboard | 1. View recent orders table | Table displays rows from data.js, status badges are colored | Medium | E2E |
| TC-A11Y-001 | Keyboard navigation | Keyboard navigation | Site open | 1. Tab through navigation and form | Focus ring visible, all interactive elements reachable | High | E2E |
| TC-A11Y-002 | Images and icons | Images and icons | Site open | 1. Inspect all images | Every image has alt text, icon buttons have aria labels | Medium | E2E |
| TC-SEC-001 | Script injection | Script injection | Contact page open | 1. Enter &lt;script&gt;alert(1)&lt;/script&gt; in form | Shown as text, no execution | High | E2E |
