| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | All menu links work | Site open | 1. Click each nav item | Scrolls to correct section; active link visual update | High | E2E |
| TC-UI-002 | Responsive layout | Responsive layout | Site open | 1. Resize to 375px, 768px, 1440px | No horizontal scroll; menu collapses to mobile menu | High | E2E |
| TC-UI-003 | Contact Form | Submit valid form | Site open on Contact | 1. Fill fields, click submit | Success message shown; form reset | High | E2E |
| TC-UI-004 | Contact Form | Empty fields validation | Site open on Contact | 1. Leave fields empty, click submit | Browser validation triggers; no success message | High | E2E |
| TC-UI-005 | Projects | Project visibility | Site open on Projects | 1. Verify 3 cards exist | All 3 cards visible with details | Medium | E2E |
| TC-UI-006 | Theme Switch | Toggle light/dark mode | Site open | 1. Click toggle button | Theme switches; persists on reload | Medium | E2E |
| TC-A11Y-001 | Accessibility | Keyboard navigation | Site open | 1. Use Tab key | All links/buttons reachable; focus ring visible | High | E2E |
| TC-A11Y-002 | Accessibility | Alt text | Site open | 1. Inspect images | All have meaningful alt attributes | High | E2E |
| TC-SEC-001 | Security | Script injection | Site open on Contact | 1. Enter `<script>alert(1)</script>` | Renders as text; no execution | High | E2E |
| TC-API-001 | API Stub | Contact POST | N/A | 1. POST /api/contact | Validates structure; returns 200/201 | High | API |
