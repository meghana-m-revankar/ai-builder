# 16 Production Standards

Every generated site must pass these before it is "done". The test engineer checks them automatically.

## A. Mobile and responsive (MUST)
- Viewport exactly: `<meta name="viewport" content="width=device-width, initial-scale=1">`. Never `maximum-scale=1` or `user-scalable=no` (users must be able to zoom).
- Prevent double-tap zoom delay without blocking zoom: `html { touch-action: manipulation; }`.
- No horizontal scrolling at 360px, 768px or 1280px: no fixed widths on containers, `img, video, iframe, svg { max-width: 100%; }`, long words `overflow-wrap: anywhere`.
- Form inputs, selects and textareas: `font-size: 16px` (1rem) or more on mobile, so iOS does not zoom in.
- Touch targets at least 44×44px with at least 8px between them (nav links, buttons, icon buttons, carousel arrows, filter pills).
- Use `min-height: 70svh` for tall heroes, never `100vh`.

## B. Performance
- Images: explicit `width` and `height`, `loading="lazy"` and `decoding="async"` except the hero image (`fetchpriority="high"`). Hero 1600px wide max, cards 800px.
- Video: muted, `preload="none"` or `metadata`, poster image, never auto-play on mobile.
- Scripts: `defer` or at the end of `<body>`; one small `main.js`; 3D only via lazy `import()` (15 Hero, Sections and 3D).
- No extra libraries (no jQuery, no animation libraries, no icon packs other than Lucide).
- Fonts: at most 2 families, `display=swap`, `preconnect` to Google Fonts.
- Target: Largest Contentful Paint < 2.5 s, Cumulative Layout Shift < 0.1, Interaction to Next Paint < 200 ms.

## C. SEO
- One `<h1>` per page; headings in order (h1 → h2 → h3, no skipping).
- Semantic landmarks: `header`, `nav`, `main`, `footer`, `section` with headings, `article` for blog cards.
- Unique `<title>` (50-60 chars: "Page | Business") and `<meta name="description">` (140-160 chars) per page.
- `<link rel="canonical">`, Open Graph (`og:title`, `og:description`, `og:image`, `og:url`, `og:type`) and Twitter card tags.
- `sitemap.xml` and `robots.txt` at the site root.
- JSON-LD schema: `LocalBusiness` (or `Restaurant`, `RealEstateAgent`, `Organization`, `Product` as fits) using **only given facts** — leave a property out rather than invent it.
- Clean, lowercase file names with hyphens (`our-services.html`), descriptive link text (never "click here"), descriptive `alt` on every image.

## D. Accessibility (WCAG 2.2 AA)
- Text contrast ≥ 4.5:1 (large text ≥ 3:1), including text over images and 3D scenes.
- Visible focus ring on every interactive element; logical tab order; "Skip to content" link first.
- Every form field has a `<label>`; errors are text under the field, linked with `aria-describedby`.
- Icon-only buttons have `aria-label`; decorative icons and canvases `aria-hidden="true"`.
- Menus: button with `aria-expanded` and `aria-controls`; Escape closes it.
- Carousels and accordions work with the keyboard.
- Respect `prefers-reduced-motion`.

## E. Code quality
- Relative links only; every link and asset resolves; no `href="#"` dead links.
- No inline `style=` or `onclick=`; events in `main.js` with `addEventListener`.
- Never put user input into `innerHTML`; validate every form field (required, email, phone pattern).
- No `console.log` left in, and no console errors on load.
- Reusable patterns: the same header, footer, card and button classes on every page.
- Any external API key is never written into front-end code.
