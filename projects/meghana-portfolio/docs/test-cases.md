| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | All menu links work | Site open on home | 1. Click each menu item | Smooth scroll to section, active class applied | High | E2E |
| TC-UI-002 | Responsive layout | Responsive layout | Site open | 1. Resize to 375px, 768px, 1440px | No horizontal scroll, hamburger menu at <992px | High | E2E |
| TC-UI-003 | Main form | Contact form, valid data | Contact section open | 1. Fill fields, click send | Toast message appears, form resets | High | E2E |
| TC-UI-004 | Main form | Contact form, empty fields | Contact section open | 1. Submit empty form | Validation errors shown | High | E2E |
| TC-UI-005 | Projects | Project visibility | Projects section | 1. View 3 project cards | 3 cards with content visible | Medium | E2E |
| TC-UI-006 | Dark mode | Dark mode toggle | Site open | 1. Click toggle button | Theme switches, persists or applies to current view | Medium | E2E |
| TC-UI-007 | Navigation | Back to top button | Scroll down | 1. Click back to top | Smooth scroll to header | Low | E2E |
| TC-A11Y-001 | Keyboard navigation | Keyboard navigation | Site open | 1. Tab through page | Focus rings visible on all interactive elements | High | A11y |
| TC-A11Y-002 | Images and icons | Alt text present | Site open | 1. Inspect hero/project images | All images have alt attributes | Medium | A11y |
| TC-SEC-001 | Script injection | Script injection in form | Contact form | 1. Input `<script>` tag | Input handled as plain text | High | Security |
| TC-API-001 | N/A | Mock API Check | N/A | N/A | N/A (Portfolio is static) | N/A | API |
