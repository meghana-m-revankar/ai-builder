| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | All menu links work | Site open on home | 1. Click Home, About, Projects, Skills, Contact | Smooth scroll to section, active link highlighted, no 404 | High | E2E |
| TC-UI-002 | Responsive layout | Responsive layout | Site open | 1. Resize to 375px, 768px, 1440px | No horizontal scroll, menu collapses to hamburger on mobile | High | E2E |
| TC-UI-003 | Contact Form | Main form, valid data | Site open at Contact | 1. Fill Name, Email, Msg 2. Click Submit | Success message appears, form resets | High | E2E |
| TC-UI-004 | Contact Form | Main form, empty fields | Site open at Contact | 1. Click Submit empty | Validation errors appear under fields | Medium | E2E |
| TC-UI-005 | Theme | Toggle dark/light mode | Site open | 1. Click toggle button | Theme switches, preference persists on reload | Medium | E2E |
| TC-UI-006 | Hero | CTA Buttons | Site open | 1. Click See My Work/Contact Me | Scrolls to correct section | High | E2E |
| TC-A11Y-001 | Accessibility | Keyboard navigation | Site open | 1. Use Tab key | All interactive elements reachable, visible focus | High | E2E |
| TC-A11Y-002 | Accessibility | Images and icons | Site open | 1. Inspect image/icons | Alt text present, aria-labels used | Medium | E2E |
| TC-SEC-001 | Security | Script injection | Site open at Contact | 1. Submit `<script>alert(1)</script>` | Treated as text, no alert triggered | High | E2E |
