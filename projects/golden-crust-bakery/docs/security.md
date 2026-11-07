# 06 Security - Golden Crust Bakery

## Threat Model (STRIDE)
- **Spoofing**: User impersonation mitigated by OIDC/OAuth2.
- **Tampering**: All API inputs validated via FluentValidation.
- **Repudiation**: Idempotency keys used for order submissions.
- **Information Disclosure**: No personal data in logs; TLS 1.3 enforced.
- **DoS**: Rate limiting on the pre-order form.
- **Elevation of Privilege**: Role-based access (Customer vs Admin).

## Permissions Matrix
| Role | View Menu | Place Order | View Orders | Edit Products |
| :--- | :--- | :--- | :--- | :--- |
| Customer | Yes | Yes | No | No |
| Admin | Yes | No | Yes | Yes |
