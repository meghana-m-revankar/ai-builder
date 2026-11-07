# 02 Static Site Rules

Applies to the Static Site agent and any HTML/CSS/JS output.

## Mindset: designer and developer at once
- As a **designer**: every page must look like a finished, premium product page that a client would pay for. Rich sections, real imagery, icons, depth (shadows, gradients, layered shapes), strong typography, generous spacing. A plain white page with three text cards is a failure.
- As a **developer**: clean, semantic, valid code that works. Separate structure (HTML), style (CSS) and behaviour (JS). Every button, link and form does something.
- Before writing, plan each page: list its sections, the content of each, the images and icons used. Then write the code.

## UI framework (follow the "UI Framework" field of the brief; default Bootstrap)
| Choice | Load | Styling approach |
|---|---|---|
| **Bootstrap** | Bootstrap 5.3.3 CSS + JS bundle (links below) | Bootstrap components and utilities + `css/style.css` for brand tokens and custom components |
| **Tailwind** | `<script src="https://cdn.tailwindcss.com/3.4.17"></script>` followed by `<script src="js/tailwind.config.js"></script>` (sets `tailwind.config = { theme: { extend: { colors, fontFamily } } }` with the brand tokens) | Utility classes in HTML; repeated patterns (buttons, cards) as plain CSS classes in `css/style.css` |
| **Plain CSS** | Nothing | Hand-written `css/style.css` with design tokens, a grid system, and component classes (BEM naming: `.card`, `.card__title`, `.card--featured`) |

All three choices use the same fonts, the same icon pack (Bootstrap Icons) and the same colour tokens from 01 Design System.

## Allowed external resources (exact URLs, nothing else)
```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400;500&family=Plus+Jakarta+Sans:wght@500;600;700;800&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
<!-- Bootstrap only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous" defer></script>
```
- MUST include the Google Fonts link and the Bootstrap Icons link on every page, whatever the framework.
- Images only from `https://picsum.photos`, `https://i.pravatar.cc` and the client's own "Logo URL". See 01 Design System → Imagery.
- No jQuery, no other libraries. Charts: inline SVG or CSS.

## No inline styles (MUST)
- No `style="..."` attributes anywhere. No `<style>` blocks inside pages (except the Tailwind config script).
- No inline event handlers (`onclick="..."`). Attach events in `js/app.js` with `addEventListener`.
- All colours, fonts, spacing and radii come from CSS variables defined once in `css/style.css`.

## File structure (all inside site/)
```
site/
  index.html            home / landing or dashboard
  <page>.html           one file per main page (3-6 pages)
  css/style.css         design tokens (:root variables) + custom components + framework overrides
  js/data.js            seed data (see 08 Seed Data) as const arrays/objects
  js/app.js             rendering from data.js, navigation state, forms, search, filters, toasts
  assets/logo.svg       SVG logo built from the project name in brand colours
```
- Relative paths only (`css/style.css`, never `/css/style.css`). The site is served from a sub-folder.
- Lists, cards, tables, testimonials and prices are rendered by `app.js` from `data.js`, not typed by hand in HTML.

## Minimum content (MUST)
- **Landing / marketing home**: at least 8 sections: navbar, hero (headline, sub-headline, 2 buttons, hero image), trust/stats strip, features or services (6 cards with icons), products or showcase (from data.js, with images and prices), how it works (3-4 steps), testimonials (3+, with avatars and star ratings), FAQ accordion (5+), CTA band, footer (logo, 3-4 link columns, contact, social icons).
- **App / dashboard home**: sidebar, top bar, 4 KPI cards with icons and trend badges, a chart (SVG), a recent-activity table (10+ rows), a quick-actions card.
- Every page: at least 15 Bootstrap Icons used meaningfully, at least 3 images on marketing pages.
- `index.html` is typically 15-30 KB; `style.css` 6-15 KB; `app.js` 4-10 KB. A 2 KB page means content is missing.

## Every page must have
- `<!doctype html>`, `<html lang="..">`, charset, viewport, unique `<title>`, `<meta name="description">`, Open Graph title/description, favicon (inline SVG data URI).
- The same header/navbar and footer on every page, with the current page marked `active` and `aria-current="page"`.
- Semantic landmarks: `header`, `nav`, `main`, `footer`; one `h1` per page; a "Skip to content" link.

## Behaviour (must actually work)
- Navigation links go to real pages or real section ids. No `href="#"`.
- Tables and card grids render from `data.js`; search filters live; filter dropdowns work.
- Forms validate; on submit, add the record (stored in `localStorage` under a project-specific key), show a success toast, reset the form.
- Delete asks for confirmation in a modal, then removes the item and shows a toast.
- Empty, loading and error states exist for every list.

## JavaScript quality
- `"use strict"`, ES2020, one `App` namespace, small named functions (`renderProducts`, `handleOrderSubmit`).
- Build DOM with `document.createElement` / `textContent` or escape values; never put raw user input into `innerHTML`.
- No `eval`.

## Start from the template
Use 09 Site Template as the starting point and adapt it to the project, brand and framework. Keep its structure and quality level; replace all content.

## Before you answer, check
- [ ] Google Fonts and Bootstrap Icons links on every page
- [ ] Zero `style="` and zero `onclick=` in the HTML
- [ ] Minimum sections present, data rendered from data.js, images and icons used
- [ ] All files inside `site/`, relative paths only
- [ ] Looks finished at 375px and 1440px
