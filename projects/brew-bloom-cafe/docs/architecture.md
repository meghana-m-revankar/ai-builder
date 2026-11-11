# Architecture: Brew & Bloom Cafe

## Overview
Brew & Bloom Cafe is a premium specialty coffee and flower shop located in Indiranagar, Bangalore. This website serves as a digital storefront, showcasing the signature coffee menu, fresh flower arrangements, the founder's story, and facilitating table reservations.

## Design System
- **Theme:** Warm, elegant, and modern.
- **Color Palette:** Cream background (#FDFBF7), Deep Coffee Brown text (#4A3728), Rose-Pink accents (#E6A8A8).
- **Styling:** Tailwind CSS for responsive, mobile-first design.
- **Imagery:** High-quality photography focusing on coffee craft and floral arrangements.

## Pages & Structure
- **Home:** Hero section, Key stats, Signature items, Flower highlight, Founder Story, Testimonials, Instagram gallery, FAQ, CTA.
- **Menu:** Categorized tabs (Coffee, Cold Brews, Tea, Desserts, Breakfast), item cards, dynamic cart calculation.
- **Flowers:** Catalog of 9 bouquets, category filtering, WhatsApp integration.
- **About:** Chronological timeline (2019-present), Team profiles, Sourcing details (Chikmagalur farms).
- **Contact:** Booking form (validation included), Location, Hours, Contact info.

## Navigation
- Top Navigation Bar: Home, Menu, Flowers, About, Contact.
- CTA: "Book a Table" prominent button.

## Folder Structure
- `index.html` (Home)
- `menu.html`
- `flowers.html`
- `about.html`
- `contact.html`
- `css/`
  - `app.css` (Base tokens + custom component classes)
  - `tailwind.config.js`
- `js/`
  - `app.js` (Cart logic, form validation, tab switching, mobile nav)
- `images/` (Optimized assets)
- `favicon.svg`

## Key Design Decisions
1. **Tech Stack:** Static HTML/CSS for performance and hosting simplicity.
2. **Interactivity:** JavaScript used for dynamic UI (menu tabs, shopping cart state, form handling) while keeping content static.
3. **UX:** WhatsApp button for flowers reduces checkout complexity.
4. **Performance:** All images served with explicit dimensions and modern formats (WebP).
