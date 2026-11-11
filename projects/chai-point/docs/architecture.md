# Chai Point Architecture

## Overview
Chai Point is a static marketing website for a cozy tea shop in Bangalore. It provides information about our offerings, story, and location to attract customers.

## Pages & Components
- **index.html**: Hero section, featured menu items, brief about us, and call-to-action.
- **menu.html**: Full categorized menu (Hot Chai, Cold Beverages, Snacks).
- **about.html**: The story of Chai Point, quality commitment.
- **gallery.html**: Photo grid of the shop and products.
- **contact.html**: Location map (embed), opening hours, phone number, and social links.

## Folder Structure
- `index.html`, `menu.html`, `about.html`, `gallery.html`, `contact.html`
- `css/`
    - `style.css` (Tailwind directives + custom components)
    - `tailwind.config.js`
- `js/`
    - `main.js` (mobile menu toggle, simple animations)
- `images/` (product photos, logo, interior shots)

## Design Decisions
- **Stack**: Pure static HTML/CSS/JS. Tailwind CSS for rapid, maintainable styling.
- **Performance**: CDN-hosted Tailwind and Google Fonts. Images optimized for web.
- **Responsiveness**: Mobile-first design for customers looking up the shop on the go.
- **Maintenance**: Shared components (navigation, footer) will be managed via simple HTML partials or consistent template structures.
