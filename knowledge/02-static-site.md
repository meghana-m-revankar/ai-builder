# 02 Static Site Rules

Applies to the Static Site agent and any HTML/CSS/JS output.

## Allowed external resources (exact URLs, nothing else)
```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400;500&family=Plus+Jakarta+Sans:wght@500;600;700;800&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous" defer></script>
```
- Images only from `https://picsum.photos` (photos), `https://i.pravatar.cc` (avatars) and the client's own "Logo URL" if given. See 01 Design System → Imagery.
- No jQuery, no other libraries.
- Charts: draw with inline SVG or CSS (bars, donuts). No chart libraries.

## File structure
```
site/
  index.html            home / landing or dashboard
  <page>.html           one file per main page (max 6)
  css/style.css         design tokens + all custom styles (no inline style attributes)
  js/data.js            sample data as const arrays/objects
  js/app.js             navigation state, rendering, forms, search, filters
  assets/logo.svg       inline-able SVG logo built from the project name
```
- Relative paths only (`css/style.css`, never `/css/style.css`). The site is served from a sub-folder.

## Every page must have
- `<!doctype html>`, `<html lang="..">`, charset, viewport, unique `<title>`, `<meta name="description">`, Open Graph title/description, favicon (inline SVG data URI).
- `<meta http-equiv="Content-Security-Policy" content="default-src 'self'; style-src 'self' https://cdn.jsdelivr.net https://fonts.googleapis.com 'unsafe-inline'; font-src https://fonts.gstatic.com https://cdn.jsdelivr.net; script-src 'self' https://cdn.jsdelivr.net; img-src 'self' data: https://picsum.photos https://fastly.picsum.photos https://i.pravatar.cc https://raw.githubusercontent.com https://meghana-m-revankar.github.io;">`
- The same header/navbar and footer on every page, with the current page marked `active` and `aria-current="page"`.
- Semantic landmarks: `header`, `nav`, `main`, `footer`; one `h1` per page.
- A skip link: "Skip to content".

## Behaviour (must actually work)
- Navigation links go to real pages. No `href="#"` dead links.
- Tables render from `data.js`; search box filters rows live; status filter dropdown works.
- Forms use Bootstrap validation; on submit, add the record to the table (store in `localStorage` under a project-specific key), show a success toast and reset the form.
- Delete asks for confirmation in a modal, then removes the row and shows a toast.
- Empty, loading and error states exist for every list.
- Mobile: navbar collapses to a hamburger; sidebar becomes offcanvas.

## JavaScript quality
- `"use strict"`, ES2020, no globals except one `App` namespace.
- Small functions with clear names (`renderAppointments`, `handleBookingSubmit`).
- Escape all user input before inserting into the DOM (use `textContent`, never build HTML from raw input).
- No `eval`, no `innerHTML` with user data, no inline `onclick`.

## Done means
- Opens with no console errors.
- Looks finished at 375px, 768px and 1440px.
- Every page follows 01 Design System.
