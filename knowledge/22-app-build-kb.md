App and Web Application Build Knowledge Base
This document tells an agent how to take a product idea to a build-ready specification. It is stack-neutral. Section 3 holds a default stack profile; replace it per project and keep everything else.
Use the words MUST, SHOULD and MAY as follows: MUST is a rule with no exceptions unless the user overrides it in writing, SHOULD is the default that needs a stated reason to drop, MAY is optional.
1. How to work
1.1 Order of work
Produce the deliverables in this order. Each one depends on the one before it.
1.Intake: read every document, screenshot and message the user gave.
2.Scope document (section 4).
3.Screen set (section 12), if the product has a user interface.
4.API specification (sections 6 and 7).
5.Database schema (section 8).
6.Security, performance and reliability sections (sections 9 to 11).
7.Delivery phases and open questions (sections 14 and 15).
When the user changes a decision (a technology, a module in or out of scope), update every deliverable that mentions it in the same pass. Search all documents for the old term before saying the change is done.
1.2 Rules for every deliverable
State what is in scope and what is out of scope. Never leave a feature unlabelled.
Never invent numbers. Durations, costs, user volumes, limits, token lifetimes and performance targets are either given by the user or written as a proposal marked "to be confirmed".
Every assumption you make goes in an Assumptions list. Every decision the user has not made goes in an Open Questions list.
When a request removes a capability, write down what else breaks (example: removing an AI service that was also parsing OCR text).
When a requested property cannot be guaranteed ("fully secure", "never down"), say so plainly and commit to named standards, controls and tests instead.
Recommend one option when the user asks for options. Give the reason and the condition under which the other option becomes right.
Bump the document version on every change and say what changed.
Use sample data that is obviously sample data. Never copy real people's names, phone numbers or emails from reference material.
1.3 Questions to answer at intake
Ask only for what you cannot find in the material. Proceed with labelled assumptions when the user is unavailable.
What problem does the product solve, and for whom?
Which clients are needed: mobile app, web app, admin portal, public site?
Who are the user roles, and is it multi-tenant (many customer organisations in one system)?
Which modules are in the first build, and which are later?
Which technology stack does the user want, and what is fixed?
Where is it hosted, and which regions and data protection laws apply?
How is it paid for: free, subscription, in-app purchase, per seat?
Which third-party services are required (payments, email, push, maps, OCR)?
Expected users and data volume in year one.
Is there existing branding, or is design part of the work?
2. Reference material and intellectual property
A competitor or reference app is input for structure and flows only. Do not reproduce its visual design, branding, logo, copy or content.
Translate or summarise reference screens when asked. Replace personal data in them with placeholders such as [name].
Design the product's own screens with its own name, colours, typography and components, even when the flow follows the reference closely.
Mark logo, tagline and colour choices as proposals until the user supplies a brand.
3. Default stack profile (replace per project)
Fill this table before writing the scope document. The rest of this knowledge base refers to these roles, not to specific products.
Role
Default
Notes
Mobile client
Flutter, one codebase for iOS and Android
Use when a mobile app is required
Web client for end users
Decide per project
Only when users need a browser version
Admin portal
Server-rendered web app with the platform's built-in components
No third-party UI library unless the user asks for one
API
REST over HTTPS, one versioned backend for all clients
The only path to the database
Database
One relational database
SQL Server or PostgreSQL
Authentication
Platform identity framework with JWT access and refresh tokens
Section 7
Background jobs
Job runner backed by the main database
No separate queue server at the start
File storage
Private object storage with time-limited links
Cache
In-process first, shared cache when scaled out
Section 10
Push notifications
Platform push service
Mobile only
Email
Transactional email provider
Secrets
Managed secret store
Never in code or client binaries
Logging and monitoring
Structured logs, health checks, alerts
Hosting
Managed cloud services, staging and production
Rules:
Prefer the platform's own features over extra packages. Add a dependency only when it removes more work than it creates.
Clients never access the database directly. The admin portal calls the same API.
Record each replaced default and the reason.
4. Scope document template
Write these sections in this order.
1.Project overview: one paragraph, the modules covered, the objectives.
2.Scope summary: a table with Area, In scope, Out of scope (future).
3.Technology stack: a table with Layer, Technology, Notes.
4.Solution architecture: the project or service list with one line of responsibility each, then the key design decisions.
5.System flow: one diagram from the first user action to the final outcome.
6.Functional scope by module: for each module, Features and Acceptance points. An out-of-scope module keeps a short note so the design leaves room for it.
7.Database design: table groups and conventions (detail lives in the schema document).
8.Integrations: a table with Integration, Purpose, Approach.
9.Non-functional requirements: a table covering security, data isolation, privacy, performance, availability, scalability, platform support, audit and quality.
10.Security and VAPT readiness (section 9).
11.Performance, concurrency and caching (section 10).
12.Optional microservices path (section 5.3).
13.Delivery phases and deliverables (section 14).
14.Assumptions, exclusions and open questions.
15.Application screens: inventory table and screen images (section 12).
Acceptance points are testable statements, for example "A failed upload falls back to manual entry and the original file is kept".
5. Architecture
5.1 Default: modular monolith
One backend, one database, one deployment pipeline.
Layers: API, Application (use cases, validation, feature gating), Domain (entities and rules), Infrastructure (data access and external clients), Jobs, Tests.
Each module owns its application services and its tables. No module reads another module's tables directly.
The API holds no session state, so any instance can serve any request.
Slow or failure-prone work (OCR, file processing, email, push, reports) runs as queued background jobs with idempotent handlers.
Every external service sits behind one interface so the provider can change without touching the modules.
5.2 Multi-tenancy
Shared database with a tenant id on every tenant-owned table.
Enforce the tenant filter in the data access layer, not in each query.
An individual user is a tenant of one.
The tenant id comes from the access token. Clients never send it.
A record in another tenant returns "not found", not "forbidden".
Automated tests MUST prove one tenant cannot read or change another's data.
5.3 Microservices: optional, by trigger
Recommend the monolith first. Offer microservices as a path, with this content:
Why monolith first: one deployment, transactional consistency, lower cost, smaller surface to secure and test.
Candidate services, each with the reason and the measurable trigger: ingestion or file processing (bursty, CPU heavy), AI or other slow external calls, notifications (high volume), billing (separate security boundary), search (dedicated engine), reporting (long queries on a separate store).
What it adds: independent scaling, deployment and failure isolation, against a message broker, an API gateway, distributed tracing, per-service pipelines, eventual consistency and higher hosting cost.
First split: deploy the job worker as a separate process. This usually needs no code change and may be all that is needed.
5.4 Feature gating and plans
One plan and feature table decides what each tenant can use.
Endpoints and screens check feature keys, never plan names.
Tag every endpoint with a feature key from the first phase so plans can be attached later without changing endpoints.
Do not put features in the access token; read them from cache so a plan change applies without a new sign-in.
6. API conventions
Item
Rule
Base path
/api/v1; a breaking change means /api/v2
Format
JSON, UTF-8, camelCase, ISO 8601 UTC dates
Identifiers
Public ids are GUIDs; database keys are never exposed
Authentication
Authorization: Bearer <access token> unless marked Public
Paging
Keyset: limit and cursor; cap the page size
Concurrency
ETag on editable records; If-Match on update and delete; stale value returns 412
Idempotency
Idempotency-Key on create and payment requests; a repeat returns the first result
Correlation
Accept and return a correlation id; include it in errors
Errors
RFC 9457 problem details with a stable code and a trace id
Rate limits
429 with Retry-After; per user, per tenant, per IP
Uploads
Multipart; check size, declared type and real file signature
Long work
Return 202 with a job or resource id; notify on completion
Endpoint tables use the columns Method, Path, Purpose, Access.
Every specification MUST include these groups when the product has them:
Auth: register, confirm email, login, two-factor verify, refresh, logout, logout everywhere, forgot and reset password, signing keys.
Current user: profile, photo, change password, change email, sessions, workspaces and switch, settings, data export, delete account.
Two-factor setup, enable, disable, recovery codes.
Devices and push token registration.
One group per functional module with list, create, read, update, delete and the module's actions.
Search, dashboard, reference lists.
Import and export as background jobs with status endpoints.
Workspace or team: members, roles, invitations, ownership transfer, tenant audit log.
Plans and billing: plans, subscription, checkout, invoices, cancel.
Notifications: list, unread count, mark read, preferences.
Admin: tenants, users, plans and features, usage, failures, audit log, announcements, background jobs, platform settings.
Webhooks in, health checks, and the real-time channel with its events.
Also include:
A phase map: which endpoint groups ship in which phase.
Later-phase endpoints as an outline with reserved paths, marked not built. Unbuilt endpoints return 404, never a placeholder response.
Roles and the authorisation checks run on every request.
A status and error code table with the client behaviour for each code.
Sample requests and responses for sign-in, refresh and the main create flow.
Flow diagrams for sign-in and token refresh, and for the product's main flow.
7. Authentication and tokens
7.1 Token types
Token
Format
Stored on client
Stored on server
Sent as
Access token
Signed JWT, short-lived
Memory, backed by the OS secure store
Not stored
Bearer header
Refresh token
Opaque random value, single use
OS secure store only
Hash, with family id, device id and expiry
Body of the refresh call only
Two-factor challenge
Opaque, single use, minutes
Memory
Hash
Body of the verify call
Email and reset codes
Short code or signed link, minutes
Not stored
Hash
Body of the confirm or reset call
File link
Signed storage URL, minutes
Not stored
Not stored
Direct GET to storage
Web admin session
Secure, HttpOnly, SameSite cookie
Browser cookie
Server session
Cookie; tokens stay on the server
Lifetimes are proposals marked "to be confirmed" unless the user sets them.
7.2 Access token claims
Subject (user id), tenant id, role in that tenant, plan, session id, authentication methods used, and the standard issuer, audience, timing and token id claims.
7.3 Rules
Sign with an asymmetric key held in the secret store; publish public keys at a well-known URL; rotate keys on a schedule; carry a key id in the header.
Validate signature, issuer, audience, expiry and that the session is not revoked, on every request.
Rotate the refresh token on every use.
If a used refresh token is presented again, revoke the whole token family and sign that device out.
Sign-out, password change and two-factor change revoke sessions.
One token family per device; list devices to the user.
The client refreshes only after a 401 with the "token expired" code, and only once per request.
Forgot-password always returns the same response whether or not the account exists.
No tokens in URLs or logs.
8. Database conventions
Integer identity primary key plus a public GUID on every table the API addresses.
Tenant id on every tenant-owned table, first column of most indexes.
Created and updated timestamps (UTC) and user ids on every table.
A row version column for optimistic concurrency, surfaced as the ETag.
Soft delete on user data, with a scheduled purge.
Unicode text columns. Money as fixed decimal with a currency code. Status and type columns as small integers mapped to enums.
Normalised copies of email, phone and names for duplicate checks, with indexes.
Many-to-many through link tables with composite primary keys.
Unique constraints for every business rule that must hold (example: one tag name per tenant).
Index each list screen's filter and sort columns. Full-text indexes for search before adding a search engine.
Change history on the main business tables.
An append-only audit log; the application login cannot update or delete it.
Schema changes only through versioned migrations run by the pipeline.
The schema document contains:
1.The columns every table carries.
2.One table per group with Table, Columns, Keys and indexes.
3.A relationship table with Parent, Child, Type, Foreign key, On delete.
4.An entity relationship diagram of the main tables.
Always include the supporting tables the API needs: sessions, refresh tokens, devices, user settings, idempotency keys, export and import jobs, notifications, audit log, announcements, platform settings, plans, features, plan features, subscriptions, invoices and usage counters.
9. Security and VAPT readiness
9.1 Standards
OWASP API Security Top 10 for the API. Include a table with one named control per risk.
OWASP ASVS Level 2 for the API and web applications.
OWASP MASVS for mobile apps.
Independent penetration test before go-live, after major releases and at least yearly. Critical and high findings are fixed and retested before release.
Static analysis, dependency scanning and secret scanning on every build.
9.2 API controls
Deny by default; a named policy on every endpoint.
Object-level check on every record: tenant and ownership, on the server.
Separate request and response models with explicit fields. Clients cannot set tenant, role, plan or owner. Never bind or return entities directly.
Validate type, length, range and format on every request; reject unknown fields; parameterised database access only.
Rate limits everywhere, tighter on login, password reset and costly endpoints. Account lockout on repeated failures.
No stack traces, SQL or internal ids in errors.
TLS 1.2 or later, HSTS, restricted CORS, security headers and a content security policy on web applications.
API documentation UI off in production. One documented inventory of endpoints; retired versions removed.
The API does not fetch user-supplied URLs. Outbound calls go only to listed services. Third-party responses are validated before use and webhooks are signature-checked.
Admin endpoints in a separate route group with mandatory two-factor.
9.3 Data security
Encryption in transit on every hop and at rest for database and files.
Column-level encryption for fields classed as sensitive.
Secrets in the managed secret store, accessed by managed identity.
Least-privilege database login; time-limited, logged production access.
Private file storage with short-lived links.
No passwords, tokens or personal data in logs.
Backups with point-in-time restore; rehearse a restore before go-live.
Export and delete on request; purge deleted data from backups on expiry.
Third-party processors configured not to train on customer data.
9.4 Client controls
Mobile: tokens in the OS secure store, optional certificate pinning with a renewal plan, encrypted local cache cleared on sign-out, obfuscated release builds, no debug logging, root and jailbreak warning.
Web admin: mandatory two-factor, idle time-out, optional IP allow-list, cookies with Secure, HttpOnly and SameSite.
Optional items that add cost or operating work (web application firewall, certificate pinning, shared cache) are labelled optional with the trade-off.
10. Performance, concurrency and caching
10.1 Concurrency
Optimistic concurrency with row versions on editable records.
Async I/O end to end.
Unique constraints plus idempotency keys to prevent duplicates from retries and double submissions.
Separate job queues with fixed worker counts so bursts of background work cannot starve interactive requests.
Idempotent jobs, retries with backoff, and a lock so a recurring job never runs twice at once.
Snapshot-based read isolation, short transactions, batched bulk writes.
10.2 Performance
Read queries project straight to response models and skip change tracking.
Keyset paging on long lists.
Reports and totals from summary tables filled by jobs or stored procedures.
Response compression, field-limited responses, ETags.
Resize images on upload; serve thumbnails through a CDN.
Mobile: lazy lists, cached images, a local cache for fast start, background upload.
Horizontal scaling with autoscale rules; a read replica as an option.
Load and soak tests against agreed volumes before go-live.
10.3 Caching
Add caching where measurement shows a gain. For each cached item, state where it is cached, when it refreshes and how it is invalidated.
Good candidates: plans and features, roles and permissions, tenant settings, reference lists, dashboard totals, static files and thumbnails.
Every cache key includes the tenant id.
Do not cache personal records in shared memory.
Start in-process. Add a shared cache when a second instance runs; it then also carries real-time backplane, distributed locks and rate-limit counters.
11. Reliability
Liveness and readiness health checks.
Timeouts, retries with backoff and circuit breakers on every external call.
Graceful degradation: when a dependency is down, queue the work and keep the rest of the product usable. Never lose the user's upload.
Zero-downtime deployment with a staging slot and rollback.
Dashboards and alerts on error rate, response time, queue length, failed jobs and failed sign-ins.
Recovery targets (acceptable data loss and downtime) are an open question until the user answers.
12. Screens
Phone screens at 390 by 844; web pages fluid from phone width to desktop.
Cover onboarding first: splash, sign in, create account, verify.
For each flow include the empty, loading, success and failure states.
One nameable visual direction: a ground colour, one or two accents, one type pairing. Text contrast at least 4.5 to 1. Touch targets at least 44 pixels.
Real controls in mockups: buttons, links, labelled inputs.
Bracketed placeholders for unknown content. No invented statistics.
Sample contact names and companies are invented and generic.
Deliver a screen inventory table: Number, Screen, Module, Purpose, Phase. Phase is a build phase, "To be confirmed", or "Future".
When a screen needs behaviour the scope does not describe, list it under "Points to confirm" instead of silently adding scope.
13. Admin module
Built as a web application that calls the API only.
Use the framework's built-in components for forms, validation, tables and navigation. Write shared pieces (dialog, toast, pager, status badge, date filter, simple charts) in the project.
Document: how it is built, a page-to-endpoint table, any admin endpoints the pages add, and which pages ship in which phase.
Platform administrators cannot read tenant business data unless the scope says so.
14. Delivery phases
Phase 0, Foundation: solution setup, database baseline, authentication, tenancy, client shells, pipelines, environments.
Phase 1, MVP: the smallest set of modules that delivers the core value.
Later phases: one theme each, with a named deliverable.
A "Later" row lists everything out of this build.
Deliverables always include source code with pipelines, database migrations, staging and production environments, app store releases where relevant, technical documentation, user and admin guides, a test report per phase, a load test report and the independent penetration test report with retest confirmation.
Do not estimate durations or cost in the scope document unless asked.
15. Open questions to raise every time
Launch markets and the data protection rules that apply.
Payment route: hosted checkout, in-app purchase, or both. Store rules and fees change the billing design.
Limits per plan, and what separates each paid plan from the free one.
Whether users need a web version in addition to the mobile app.
Expected users and data volume for sizing.
Languages at launch, including right-to-left.
Who performs the penetration test and whether a named certification is required.
Recovery targets.
Minimum operating system versions.
Token lifetimes, upload limits and rate limit values.
16. Definition of done for a specification set
Every feature is labelled in scope, out of scope or to be confirmed.
Every screen maps to a module, a phase and at least one endpoint.
Every endpoint has an access rule and a phase.
Every table has keys, indexes and a tenant rule.
Each OWASP API risk has a named control.
Every external service has an owner, a failure behaviour and a data handling note.
No number appears without a source or a "to be confirmed" mark.
All documents use the same names for modules, roles, plans and tables.
The change log states what changed in this version.
