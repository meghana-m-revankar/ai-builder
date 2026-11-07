# 06 Security - Golden Crust Bakery

## Threat List (STRIDE)
- **Spoofing**: Users submitting orders as others (Mitigation: Auth required for Admin).
- **Tampering**: Modifying order prices (Mitigation: Server-side validation).
- **Information Disclosure**: Exposing customer phone numbers (Mitigation: RLS + Authorized API).

## Permissions Matrix
| Role | View Products | Submit Order | View Orders |
|---|---|---|---|
| Customer | Yes | Yes | No |
| Admin | Yes | Yes | Yes |
