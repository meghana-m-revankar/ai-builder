| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | All menu links work | Site open | Click Home, About, Projects, Skills, Contact | Smooth scroll to section, active link marked | High | E2E |
| TC-UI-002 | Layout | Responsive design | Browser at 375px, 768px, 1440px | View site | No horizontal scroll, menu toggles at < 992px | High | E2E |
| TC-UI-003 | Contact Form | Form submit - Valid | Contact section | Fill valid name, email, message; Click Submit | Shows success message, form resets | High | E2E |
| TC-UI-004 | Contact Form | Form submit - Invalid | Contact section | Submit empty fields | Validation error messages appear | High | E2E |
| TC-UI-005 | Projects | Project visibility | Projects section | Scroll to cards | 3 projects visible, hover effects work | Medium | E2E |
| TC-UI-006 | Interactions | Theme Switcher | Site open | Toggle theme button | Colors update to light/dark | Medium | E2E |
| TC-UI-007 | Footer | Back to Top | Page scrolled down | Click back-to-top | Smooth scroll to top | Low | E2E |
| TC-A11Y-001 | Keyboard | Navigation access | Site open | Use Tab key | All links/buttons reachable, focus visible | High | E2E |
| TC-A11Y-002 | Accessibility | Media alt text | Site open | Inspect images | Profile/Projects have descriptive alt text | High | E2E |
| TC-SEC-001 | Security | Script injection | Contact form | Input `<script>alert(1)</script>` | Text treated as input, not executed | High | E2E |
| TC-API-001 | N/A | Mock endpoint check | N/A | Check requirements | Site is static, no API endpoints present | N/A | API |
