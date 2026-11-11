| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | All menu links work | Site open on home | 1. Click each menu item | Each section scrolls into view, menu active link updates, no 404 | High | E2E |
| TC-UI-002 | Responsive layout | Responsive layout | Site open | 1. Resize browser to 375px, 768px, 1440px | No horizontal scroll, menu collapses to burger on mobile, text readable | High | E2E |
| TC-UI-003 | Contact Form | Contact form, valid data | Contact section visible | 1. Fill all fields 2. Submit | "Thank you" message appears, form resets | High | E2E |
| TC-UI-004 | Contact Form | Contact form, empty required fields | Contact section visible | 1. Leave fields empty 2. Submit | Submit blocked, validation errors shown | High | E2E |
| TC-UI-005 | Theme | Theme toggle | Site open | 1. Click theme toggle | Site switches between light and dark mode, persists across refresh | Medium | E2E |
| TC-UI-006 | Navigation | Back-to-top | Site scrolled down | 1. Click back-to-top button | Page scrolls back to top | Low | E2E |
| TC-UI-007 | Accessibility | Keyboard navigation | Site open | 1. Tab through navigation and form | Focus visible on all interactive elements | Medium | A11Y |
| TC-SEC-001 | Security | Script injection | Contact form | 1. Submit `<script>alert(1)</script>` in fields | Text rendered as plain string, no alert triggered | High | SEC |
| TC-API-001 | Contact | Contact endpoint | N/A | POST to /api/contact | 200 OK or handled gracefully | Medium | API |
