| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | All menu links work | Site open on home | 1. Click contact | Chat window loads for selected user | High | E2E |
| TC-UI-002 | Responsive layout | Responsive layout | Site open on home | 1. Resize window to 375px, 768px, 1440px | Sidebar/Chat windows display correctly, no horizontal scroll | High | E2E |
| TC-UI-003 | Main form, valid data | Main form, valid data | Chat open | 1. Type message 2. Click send | Message appears in bubble, scroll moves, input clears | High | E2E |
| TC-UI-004 | Main form, empty required fields | Main form, empty required fields | Chat open | 1. Click send with empty input | Nothing happens, no error | Medium | E2E |
| TC-UI-005 | Search and filter | Search and filter | Site open on home | 1. Type in search bar | Contact list updates to show matching names | Medium | E2E |
| TC-UI-006 | Delete with confirmation | Delete with confirmation | N/A | N/A | Feature not implemented | Low | E2E |
| TC-UI-007 | Language switch | Language switch | N/A | N/A | Feature not requested | Low | E2E |
| TC-A11Y-001 | Keyboard navigation | Keyboard navigation | Site open | 1. Use Tab key | Focus visible on inputs and buttons | High | A11Y |
| TC-A11Y-002 | Images and icons | Images and icons | Site open | 1. Inspect DOM | Every img has alt, every button has aria-label/label | High | A11Y |
| TC-SEC-001 | Script injection | Script injection | Chat open | 1. Input <script>alert(1)</script> and send | Script rendered as text, no alert pops | High | SEC |
