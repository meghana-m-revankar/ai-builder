# 06 Security

## Authentication
- OpenID Connect / OAuth 2.0 flow.

## Authorisation
- Roles: `Fleet Manager`, `Dispatcher`, `Viewer`.
- Check ownership via `tenant_id` and RLS in PostgreSQL.

## Threats (STRIDE)
- **Spoofing**: Mitigation - OIDC tokens.
- **Tampering**: Mitigation - FluentValidation + Database constraints.
- **Information Disclosure**: Mitigation - HTTPS + RLS.
- **Denial of Service**: Mitigation - Rate limiting on endpoints.
- **Elevation of Privilege**: Mitigation - Policy-based auth.
