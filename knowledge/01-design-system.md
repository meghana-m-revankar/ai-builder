# 01 Design System

Every screen must look like a premium, modern SaaS product, not a template. When unsure, choose the more polished, more spacious option.

## Design inspiration (Dribbble / Behance / Awwwards level)
Design as if the page will be posted as a top shot on Dribbble. Use these current patterns where they fit the business:
- **Big, confident typography**: hero headline 56-72px on desktop, tight letter-spacing, one key word highlighted in the brand or accent colour.
- **Bento grids**: feature sections as a grid of cards in different sizes (one large 2×2 card with an image or mockup, smaller cards around it).
- **Layered depth**: cards on soft tinted backgrounds, floating UI chips over images (rating badge, "Order ready" notification, small stat card), subtle shadows.
- **Soft gradient backgrounds**: radial gradient or blurred colour blobs behind the hero in brand tints. No harsh rainbow gradients.
- **Product / UI mockups** built in HTML/CSS (a fake app card, dashboard preview, phone frame) instead of plain text.
- **Rounded, friendly shapes**: 16-24px radius on large cards and images, pill buttons and tags.
- **Generous whitespace**: let sections breathe; never cram.
- **Micro-interactions**: hover lift on cards, image zoom on hover (scale 1.04), animated underline on links, smooth accordion.
- **Rich footers**: logo, short pitch, link columns, newsletter field, social icons.
- Light glassmorphism only for overlays on images (navbar on scroll, floating chips): `background: rgba(255,255,255,.7); backdrop-filter: blur(12px)`.
- The AI cannot browse Dribbble: apply these patterns from memory, and aim for that level of polish on every section.

## Typography
- Headings and UI: **Plus Jakarta Sans** (weights 500, 600, 700, 800).
- Body text: **Inter** (weights 400, 500, 600).
- Numbers, codes, IDs, prices: **JetBrains Mono** (400, 500) with `font-variant-numeric: tabular-nums`.
- Load from Google Fonts with `display=swap` and a system fallback:
  `"Plus Jakarta Sans", system-ui, -apple-system, "Segoe UI", Roboto, sans-serif`.
- Type scale (rem): 0.75 caption, 0.875 small, 1 body, 1.125 lead, 1.5 h4, 1.875 h3, 2.25 h2, 3 h1, 3.75 hero.
- Headings: weight 700-800, letter-spacing -0.02em, line-height 1.15, `text-wrap: balance`.
- Body: line-height 1.6, max line length 70 characters.
- Uppercase labels: 0.75rem, weight 600, letter-spacing 0.08em.

## Icons
Use the pack from the "Icon Pack" field of the brief (default **Lucide**). Use exactly one pack per project. Never mix packs. Never use emoji as icons.

| Pack | Load (exact) | Usage |
|---|---|---|
| **Lucide** (default) | `<script src="https://cdn.jsdelivr.net/npm/lucide@0.469.0/dist/umd/lucide.min.js" defer></script>` | `<i data-lucide="calendar"></i>`; call `lucide.createIcons()` in `app.js` after every render |
| **Phosphor** | `<link href="https://cdn.jsdelivr.net/npm/@phosphor-icons/web@2.1.1/src/regular/style.css" rel="stylesheet">` (+ `.../src/fill/style.css` if filled icons are used) | `<i class="ph ph-calendar"></i>`, filled: `<i class="ph-fill ph-star"></i>` |
| **Boxicons** | `<link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">` | `<i class="bx bx-calendar"></i>`, solid `bxs-`, brands `bxl-` |
| **Bootstrap Icons** | `<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">` | `<i class="bi bi-calendar3"></i>` |

Common icons in each pack:
| Meaning | Lucide | Phosphor | Boxicons | Bootstrap |
|---|---|---|---|---|
| Dashboard | layout-dashboard | ph-squares-four | bx-grid-alt | bi-grid-1x2 |
| Users | users | ph-users | bx-group | bi-people |
| Calendar | calendar | ph-calendar | bx-calendar | bi-calendar3 |
| Settings | settings | ph-gear | bx-cog | bi-gear |
| Money | banknote | ph-money | bx-money | bi-cash-stack |
| Cart / order | shopping-bag | ph-shopping-bag | bx-shopping-bag | bi-bag-check |
| Success | circle-check | ph-check-circle | bx-check-circle | bi-check-circle |
| Warning | triangle-alert | ph-warning | bx-error | bi-exclamation-triangle |
| Delete | trash-2 | ph-trash | bx-trash | bi-trash3 |
| Edit | square-pen | ph-pencil-simple | bx-edit | bi-pencil-square |
| Search | search | ph-magnifying-glass | bx-search | bi-search |
| Star | star | ph-star | bxs-star | bi-star-fill |
| Time | clock | ph-clock | bx-time | bi-clock |
| Phone | phone | ph-phone | bx-phone | bi-telephone |
| Location | map-pin | ph-map-pin | bx-map | bi-geo-alt |
| Menu | menu | ph-list | bx-menu | bi-list |
| Arrow | arrow-right | ph-arrow-right | bx-right-arrow-alt | bi-arrow-right |
| Instagram | instagram | ph-instagram-logo | bxl-instagram | bi-instagram |

- Size icons with the text (1em) or 20px in buttons, 24-32px in feature cards (Lucide: set `width`/`height` via CSS on `svg.lucide`, `stroke-width: 1.75`).
- Feature icons sit in a tinted rounded square (48-56px, brand-100 background, brand-700 icon).
- Every icon-only button has `aria-label`. Decorative icons have `aria-hidden="true"`.
- The 09 Site Template uses Bootstrap Icons class names: swap them for the chosen pack using the table above.

## Brand colours from the logo (takes priority)
- If the brief contains a "Brand Palette" (extracted from the client's logo), build the colour tokens from it:
  - brand-700 = the logo's main colour; brand-900 = a darker shade of it; brand-500 = a lighter shade; brand-100 = a very light tint (about 92% white).
  - accent-500 = the logo's second colour if it contrasts well; otherwise a complementary hue.
  - Keep the neutral, success, warning and danger tokens below unchanged.
  - Check contrast: if white text on brand-700 is below 4.5:1, darken brand-700 until it passes.
- If a "Logo URL" is given, show that logo in the navbar (height 32-40px) and footer, with `alt="<Project Name> logo"`. Otherwise build a simple SVG wordmark from the project name in brand-700.
- If no brand palette is given, use the default tokens below.

## Colour tokens (define as CSS variables in :root and use them everywhere)
| Token | Value | Use |
|---|---|---|
| --brand-900 | #0B1B3F | dark surfaces, sidebar, footer |
| --brand-700 | #1E3A8A | primary buttons, links, active nav |
| --brand-500 | #3B5BDB | hover, focus rings, charts |
| --brand-100 | #E7ECFB | soft backgrounds, selected rows |
| --accent-500 | #F97316 | one main call to action per screen, highlights |
| --surface | #FFFFFF | cards, panels |
| --canvas | #F6F7FB | page background |
| --ink-900 | #0F172A | headings, main text |
| --ink-600 | #475569 | secondary text |
| --line | #E2E8F0 | borders, dividers |
| --success | #16A34A | --warning #D97706, --danger #DC2626, --info #0284C7 |

- Override Bootstrap: `--bs-primary` = brand-700, `--bs-body-font-family` = Inter, `--bs-border-radius` = 0.75rem.
- Contrast: text at least 4.5:1, large text at least 3:1.
- Never use pure grey #808080 or default Bootstrap blue #0D6EFD.

## Spacing, radius, shadow
- Spacing scale on a 4px grid: 4, 8, 12, 16, 24, 32, 48, 64, 96.
- Sections on marketing pages: 96px top and bottom on desktop, 64px on mobile.
- Radius: 8px inputs and buttons, 12px cards, 20px hero panels, 999px pills.
- Shadows (soft, layered): `0 1px 2px rgba(15,23,42,.06), 0 8px 24px rgba(15,23,42,.06)`. Only cards, dropdowns and modals get shadows.

## Layout patterns
- **Marketing / landing**: sticky translucent navbar (backdrop blur) → hero with headline, sub-headline, 2 buttons and a product visual (inline SVG or CSS mockup) → logo/trust strip → features grid (3 columns, icon in tinted circle) → how-it-works (numbered steps) → stats band → testimonials → pricing (3 tiers, middle highlighted) → FAQ accordion → CTA band → footer with 4 link columns.
- **Web app / dashboard**: fixed left sidebar (240px, collapses to offcanvas under 992px) with logo, grouped nav and user card → top bar with search, notifications, profile dropdown → page header (title, breadcrumb, primary action on the right) → KPI cards row (icon, value, trend badge) → main content (tables, charts, forms).
- Container max width 1200px (marketing) or fluid with 24px padding (app).
- Grids collapse: 4 → 2 → 1 columns. Nothing scrolls sideways except tables in `.table-responsive`.

## Responsive (mobile first, mandatory)
- Write mobile styles first, then add `min-width` media queries. Use Bootstrap breakpoints: sm 576, md 768, lg 992, xl 1200, xxl 1400.
- Must look finished at 360px, 375px, 414px (phones), 768px (tablet), 1024px, 1280px and 1440px+ (desktop).
- Use Bootstrap grid (`row`, `col-12 col-md-6 col-lg-4`) and `gap`; never fixed pixel widths on layout containers.
- Side padding at least 16px on phones; content never touches the screen edge and nothing scrolls sideways.
- Navbar collapses to a hamburger below lg; app sidebar becomes an offcanvas drawer below lg.
- Fluid type for hero headings: `font-size: clamp(2rem, 5vw + 1rem, 3.75rem)`.
- Tables: wrap in `.table-responsive`; on phones, show key columns only or switch to stacked cards.
- Forms: one column on phones, two columns from md. Inputs full width on phones.
- Buttons: full width on phones in forms and CTA bands (`w-100 w-md-auto`).
- Touch targets at least 44×44px; spacing between tappable items at least 8px.
- Images: `max-width: 100%`, `height: auto`, `aspect-ratio` set, `srcset` sizes where it matters (e.g. hero 800 / 1600 wide).
- Grids: 4 → 2 → 1 columns; cards keep equal height per row.
- Test landscape phones and avoid `100vh` heroes (use `min-height: 70svh` at most).

## Components (quality bar)
- **Buttons**: primary solid, secondary outline, tertiary link. Min height 40px, icon + label, visible focus ring `0 0 0 3px var(--brand-100)`.
- **Cards**: 24px padding, title + supporting text + action. Same height in a row.
- **Tables**: sticky header, zebra or hover rows, status badges, row actions in a dropdown, empty state, pagination, search and filters above.
- **Forms**: label above every field, helper text, required `*`, Bootstrap validation states, grouped in sections with headings, primary action bottom right.
- **Badges/status pills**: soft background + strong text (e.g. success: bg #DCFCE7, text #166534).
- **Feedback**: toasts for success, inline alerts for errors, skeleton loaders for loading, designed empty states (icon, sentence, action button).
- **Modals**: for confirm/delete only; destructive buttons in danger colour.

## Motion
- 150-250ms ease-out on hover, focus, dropdowns. Cards lift 2px on hover.
- One subtle entrance animation for the hero. No bouncing, no infinite animations.
- Respect `prefers-reduced-motion`.

## Imagery
- Marketing pages need real images: a hero image, one image per main section (about, services, gallery) and team/testimonial photos where they fit.
- Image source: `https://picsum.photos/seed/<project-slug>-<topic>/<width>/<height>` (e.g. `https://picsum.photos/seed/bakery-hero/1600/900`). Use a different seed per image so they don't repeat.
- Picsum photos are generic, so always style them to fit the brand: `object-fit: cover`, fixed `aspect-ratio`, rounded corners, and a brand-coloured gradient overlay on hero images so text stays readable.
- Every `<img>` has a descriptive `alt`, `loading="lazy"` (except the hero), and explicit `width` and `height`.
- Combine photos with inline SVG illustrations, CSS gradient shapes, product mockups built in HTML/CSS, and Bootstrap Icons in tinted circles.
- Dashboards and app screens use few photos: avatars (initials in coloured circles or `https://i.pravatar.cc/80?u=<name>`), illustrations for empty states.

## Content
- Real, specific copy for the business. No lorem ipsum, no "Feature 1".
- Realistic sample data (names, dates, amounts in the right currency and locale).
- Languages: follow the "Languages" field of the brief. If more than one, add a language switch in the navbar and provide every visible string in each language.
