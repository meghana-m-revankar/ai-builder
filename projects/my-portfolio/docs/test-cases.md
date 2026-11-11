| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | All menu links work | Site open | Click Home, About, Projects, Skills, Contact | Smooth scrolls to correct section | High | E2E |
| TC-UI-002 | Responsive | Responsive layout | Site open | Resize window to 375, 768, 1440px | No horizontal scroll, menu collapses to hamburger on mobile | High | E2E |
| TC-UI-003 | Contact Form | Form submission with valid data | Site open | Fill name, email, message, click Submit | Success toast/message shows, form clears | High | E2E |
| TC-UI-004 | Contact Form | Form validation | Site open | Leave required fields empty, click Submit | Browser validation errors appear | High | E2E |
| TC-UI-005 | Projects | Project visibility | Site open | Scroll to Projects | 3 project cards are visible | Medium | E2E |
| TC-UI-006 | Theme | Theme switch | Site open | Click theme toggle button | UI updates to dark/light mode | Medium | E2E |
| TC-UI-007 | Skills | Skills visibility | Site open | Scroll to Skills | List of skills is rendered | Medium | E2E |
| TC-A11Y-001 | Accessibility | Keyboard navigation | Site open | Use Tab key to navigate | Focus ring visible on all interactive elements | High | A11Y |
| TC-A11Y-002 | Accessibility | Images and icons | Site open | Inspect DOM | All images have alt text | High | A11Y |
| TC-SEC-001 | Security | Script injection | Site open | Enter `<script>alert(1)</script>` in form | Text is treated as plain text, no execution | High | SEC |
| TC-API-001 | API | N/A | N/A | N/A | Project is static; no API endpoints defined. | Low | API |
