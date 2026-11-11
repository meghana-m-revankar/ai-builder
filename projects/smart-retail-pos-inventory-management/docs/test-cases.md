| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | All menu links work | Site open on home | 1. Click each menu item | Every page loads, active link marked, no 404, no console errors | High | E2E |
| TC-UI-002 | Responsive layout | Responsive layout | Site open | 1. Resize viewport to 375px, 768px, 1440px | No horizontal scroll, menu collapses below 992px, text readable | High | E2E |
| TC-UI-003 | Dashboard | Dashboard data display | Dashboard open | 1. Load dashboard | KPIs and inventory table show populated data | High | E2E |
| TC-UI-004 | Inventory | Inventory list rendering | Dashboard open | 1. Check inventory table | Table rows match inventory data | High | E2E |
| TC-A11Y-001 | Keyboard navigation | Keyboard navigation | Site open | 1. Use Tab to move through links/buttons | All interactable elements reachable; focus ring visible | High | E2E |
| TC-A11Y-002 | Images and icons | Images and icons | Site open | 1. Inspect elements | Every image has alt text; icon-only buttons have aria-label | Medium | E2E |
| TC-SEC-001 | Script injection | Script injection | Dashboard open | 1. Inject `<script>` into input | No script executes, shown as plain text | High | E2E |
