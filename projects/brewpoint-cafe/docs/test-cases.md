| ID | Area | Title | Preconditions | Steps | Expected result | Priority | Type |
|---|---|---|---|---|---|---|---|
| TC-UI-001 | Navigation | All menu links work | Site open on home | 1. Click each menu item | Every page loads, active link marked, no 404, no console errors | High | E2E |
| TC-UI-002 | Responsive layout | Responsive layout | Site open | 1. Resize browser to 375px, 768px, 1440px | No horizontal scroll, menu collapses below 992px, text readable | High | E2E |
| TC-UI-003 | POS | Main form, valid data | Staff logged in | 1. Add items to cart, 2. Select payment, 3. Pay | Order saved, success toast, cart clears | High | E2E |
| TC-UI-004 | POS | Main form, empty required fields | Staff logged in | 1. Submit empty payment | Error messages shown | Medium | E2E |
| TC-UI-005 | Inventory | Search and filter | Staff logged in | 1. Search products | Table updates live, clearing resets | Medium | E2E |
| TC-UI-006 | Inventory | Delete with confirmation | Staff logged in | 1. Delete product | Modal shows, confirm removes row | Medium | E2E |
| TC-A11Y-001 | Access | Keyboard navigation | Site open | 1. Tab through elements | Focus ring visible, modal traps focus | High | A11Y |
| TC-A11Y-002 | Access | Images and icons | Site open | 1. Inspect images | All have alt text | Medium | A11Y |
| TC-SEC-001 | Security | Script injection | Any form | 1. Enter script tag | Shows as plain text | High | SEC |
| TC-API-001 | API | List products | Auth active | GET /api/v1/products | Returns 200, JSON array | High | API |
| TC-API-002 | API | Create order, valid | Auth active | POST /api/v1/orders | Returns 201, matches input | High | API |
| TC-API-003 | API | Create order, invalid | Auth active | POST /api/v1/orders | Returns 400 | Medium | API |
| TC-API-004 | API | Get, not found | Auth active | GET /api/v1/orders/{uuid} | Returns 404 | Low | API |
| TC-API-005 | API | No token | No auth | Access any endpoint | Returns 401 | High | API |
| TC-API-006 | API | Wrong role | Staff role | Access admin endpoint | Returns 403 | High | API |
| TC-API-007 | API | Response time | Auth active | Call endpoints | < 500ms | Medium | API |
