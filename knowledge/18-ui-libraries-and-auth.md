# 18 UI Libraries, Charts, Tables, Auth and PageSpeed

These are the only extra libraries allowed. Load each one only on the pages that use it, never site-wide "just in case".

## Dialogs and alerts: SweetAlert2
Use it for confirmations (delete, cancel booking), form success/error messages and important notices. It is accessible (focus trap, Escape to close, ARIA roles).
```html
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.14.5/dist/sweetalert2.all.min.js" defer></script>
```
```js
Swal.fire({ icon: 'success', title: 'Thank you!', text: 'We will reply within one working day.', confirmButtonColor: getComputedStyle(document.documentElement).getPropertyValue('--brand-600') || '#4f46e5' });
const ok = await Swal.fire({ icon: 'warning', title: 'Cancel this booking?', showCancelButton: true, confirmButtonText: 'Yes, cancel' });
if (ok.isConfirmed) { /* … */ }
```
- Use the brand colour for the confirm button; red only for destructive actions.
- Do not use it for marketing pop-ups on page load.
- Small, non-blocking notices ("Added to cart") stay as the built-in toast; SweetAlert2 is for things the user must read or decide.

## Data tables
| Situation | Use |
|---|---|
| Up to ~200 rows (menus, price lists, small admin lists) | Plain semantic `<table>` + a search box and clickable sortable headers written in `main.js` (no library) |
| Dashboards / admin screens with many rows, paging, sorting, search | **Simple-DataTables** (vanilla JS, no jQuery): `https://cdn.jsdelivr.net/npm/simple-datatables@9.2.1` (`dist/umd/simple-datatables.js` + `dist/style.css`) |
| React stack | TanStack Table with shadcn/ui table components |

Never use jQuery DataTables (it needs jQuery). Tables are always wrapped in `<div class="overflow-x-auto">`, have a `<caption>` or `aria-label`, `<th scope="col">`, and become stacked cards under 640px when they have more than 4 columns.

## Charts: Chart.js
Use Chart.js 4 for stats, dashboards and reports.
```html
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.6/dist/chart.umd.min.js" defer></script>
<canvas id="sales-chart" role="img" aria-label="Monthly bookings, January to June"></canvas>
```
- Brand colour for the main series and accent for the second; no rainbow palettes; at most 5 series.
- `responsive: true`, `maintainAspectRatio: false` inside a container with a fixed height (`h-64 md:h-80`).
- Always give a text summary or a data table next to the chart (accessibility).
- Turn animations off when `prefers-reduced-motion` is set: `Chart.defaults.animation = matchMedia('(prefers-reduced-motion: reduce)').matches ? false : Chart.defaults.animation;`.
- Marketing "stats" sections with 3-4 numbers do not need a chart; use big numbers.
- React stack: react-chartjs-2 (same library) or Recharts.

## Login and OAuth
A static site cannot keep secrets, so login is always done by an auth provider or by the backend:
| Stack | How |
|---|---|
| Static HTML site | Hosted auth with OAuth 2.0 / OpenID Connect + PKCE: **Firebase Authentication** or **Supabase Auth** (Google, Microsoft, Apple, GitHub, email magic link). Only the public client config goes in the page, never a client secret. |
| .NET stack | ASP.NET Core Identity + external providers (`AddGoogle`, `AddMicrosoftAccount`, `AddOpenIdConnect`), secrets in user-secrets / environment variables, cookies `HttpOnly` + `Secure` + `SameSite=Lax`. |
| React stack | Supabase Auth, Firebase Auth, Auth0 or Clerk SDK with PKCE. |
| Mobile apps | the same provider via the platform SDK (Expo AuthSession / Firebase), so web and app share accounts. |

Rules: show "Continue with Google" (and others the brief asks for) plus email; never build a password form that stores passwords in `localStorage`; protected pages redirect to login; logout clears the session; if no auth provider is configured, build the login screen as a clearly marked **Sample** that explains which provider to connect.

## PageSpeed Insights targets
After publishing, the site is checked with Google PageSpeed Insights (mobile and desktop). Targets:
| Category | Target |
|---|---|
| Performance (mobile) | ≥ 85 (≥ 90 for 2D sites) |
| Accessibility | ≥ 95 |
| Best practices | ≥ 95 |
| SEO | 100 |

The usual reasons for low scores and the fix:
- huge hero image → 1600px max, `fetchpriority="high"`;
- render-blocking scripts → `defer`;
- 3D loaded too early → lazy `import()` only near the viewport;
- missing alt / labels / contrast → 16 Production Standards;
- layout shift → width/height on every image.
