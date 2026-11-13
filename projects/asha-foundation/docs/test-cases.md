| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | All menu links work | Site open on home | 1. Click each menu item | Every page loads, active link marked, no 404 | High | E2E |
| TC-UI-002 | Responsive layout | Responsive layout | Site open on home | 1. Resize to 375, 768, 1440px | No horizontal scroll, menu collapses below 992px | High | E2E |
| TC-UI-003 | Main form | Main form, valid data | Volunteer/Contact page open | 1. Fill valid data, 2. Submit | Success toast appears, form resets | High | E2E |
| TC-UI-004 | Main form | Main form, invalid | Volunteer/Contact page open | 1. Submit empty form | Submit blocked, error messages shown | High | E2E |
| TC-UI-005 | Search and filter | N/A | N/A | N/A | N/A | Low | N/A |
| TC-UI-006 | Delete with confirmation | N/A | N/A | N/A | N/A | Low | N/A |
| TC-UI-007 | Language switch | N/A | N/A | N/A | N/A | Low | N/A |
| TC-A11Y-001 | Keyboard navigation | Keyboard navigation | Site open | 1. Use Tab key | Focus visible on all elements | High | E2E |
| TC-A11Y-002 | Images and icons | Images and icons | Site open | 1. Inspect images | Every image has alt text | High | E2E |
| TC-SEC-001 | Script injection | Script injection | Contact/Volunteer form | 1. Input `<script>` | Displayed as plain text, not executed | High | E2E |
| TC-API-001 | List endpoint | N/A | N/A | N/A | N/A | Low | N/A |
| TC-API-002 | Create, valid | N/A | N/A | N/A | N/A | Low | N/A |
| TC-API-003 | Create, invalid | N/A | N/A | N/A | N/A | Low | N/A |
| TC-API-004 | Get, not found | N/A | N/A | N/A | N/A | Low | N/A |
| TC-API-005 | No token | N/A | N/A | N/A | N/A | Low | N/A |
| TC-API-006 | Wrong role | N/A | N/A | N/A | N/A | Low | N/A |
| TC-API-007 | Response time | N/A | N/A | N/A | N/A | Low | N/A |
