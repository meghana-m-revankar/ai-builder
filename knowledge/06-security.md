# 06 Security (OWASP Top 10 baseline)

Security is a requirement, not an extra. Every feature must state who can do it.

## Authentication
- OpenID Connect / OAuth 2.0 (e.g. Supabase Auth, Entra ID, Keycloak). JWT access tokens (15 min) + refresh tokens (rotating).
- Passwords (if stored locally): ASP.NET Identity with PBKDF2 or Argon2id, min 12 characters, breached-password check, lockout after 5 failed attempts.
- MFA available for admin and owner roles.

## Authorisation
- Role-based plus policy-based (`[Authorize(Policy = "CanApproveBudget")]`). Deny by default.
- Check ownership on every record access (user can only read their own / their tenant's data) - prevents IDOR.
- Enforce in the API and the database (RLS), never only in the UI.

## Input and output
- Validate every input on the server (type, length, range, format) with FluentValidation.
- Parameterised queries / EF Core only. No string-concatenated SQL.
- Encode output; Blazor encodes by default - never use `MarkupString` with user input.
- File uploads: allow-list extensions and MIME types, max size, rename files, store outside web root, virus scan hook.

## Secrets and configuration
- No secrets in code, git or front-end JavaScript. Use environment variables or a secret vault.
- `.env` and `appsettings.*.local.json` in `.gitignore`. Provide `.env.example` with placeholder values.
- Rotate keys; separate keys per environment.

## Transport and headers
- HTTPS only, HSTS (`max-age=31536000; includeSubDomains`).
- Headers: `Content-Security-Policy`, `X-Content-Type-Options: nosniff`, `Referrer-Policy: strict-origin-when-cross-origin`, `X-Frame-Options: DENY`, `Permissions-Policy`.
- CORS: explicit allowed origins only, never `*` with credentials.
- Cookies: `Secure`, `HttpOnly`, `SameSite=Lax` (or `Strict`); antiforgery tokens for cookie-based forms.

## Abuse protection
- Rate limiting on login, signup, password reset and public APIs (ASP.NET Core RateLimiter).
- Generic error messages to clients ("Invalid email or password"); details only in server logs.
- Idempotency for payments and approvals.

## Data protection
- Encrypt sensitive columns (AES-GCM) and backups. TLS to the database.
- Minimise personal data; define retention; support export and deletion requests.
- Audit log (insert-only) for logins, permission changes, approvals and data exports.

## Logging and monitoring
- Structured logs with correlation id; never log passwords, tokens, card numbers or full personal data.
- Alert on repeated auth failures and 5xx spikes.

## Dependencies and pipeline
- Pin package versions; run `dotnet list package --vulnerable` and Dependabot.
- CI runs build, tests, SAST (CodeQL) and secret scanning before deploy.

## Each architecture document must include
- A threat list (STRIDE) for the main flows with the mitigation for each.
- A permissions matrix: role × action.
