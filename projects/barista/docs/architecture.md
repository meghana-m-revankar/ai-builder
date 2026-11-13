# Architecture: Barista South Indian Cafe

## Overview
Barista is a boutique South Indian cafe located in Bengaluru, specializing in authentic South Indian filter coffee, crispy dosas, and traditional snacks. The website provides visitors with a rich visual showcase of the menu, an interactive table booking system, operating hours, cafe locations, and a way to connect with the cafe.

Given the tech stack (Static HTML + CSS + Tailwind), the website is implemented as a lightning-fast, highly responsive static multi-page website hosted on modern CDN infrastructure without any backend or database dependencies.

## Pages & File Structure
```
barista-cafe/
├── index.html          # Home page (Hero, featured items, USP, quick booking)
├── menu.html           # Full menu with filter categories (Coffee, Dosa, Snacks, Beverages)
├── booking.html        # Interactive table booking form & availability info
├── about.html          # Our story, heritage of Bengaluru filter coffee, team
├── contact.html        # Location map, hours, contact form, phone, social links
├── css/
│   └── styles.css      # Custom styles complementing Tailwind
├── js/
│   ├── main.js         # Mobile nav toggle, booking validation, notification toast
│   └── menu.js         # Menu item filtering and modal viewer
├── images/             # Optimized WebP assets for food and cafe ambience
└── tailwind.config.js  # Custom theme configuration (brand colors: coffee brown, turmeric yellow)
```

## Sections & Navigation
- **Header / Navigation Bar**: Sticky header featuring the cafe logo, links to Home, Menu, Table Booking, About Us, and Contact, plus a prominent "Book a Table" CTA button.
- **Footer**: Quick links, operating hours, Bengaluru addresses, social media icons, copyright, and newsletter signup.
- **Home (`index.html`)**:
  - Hero section with high-impact imagery and tagline ("Authentic Bengaluru Filter Coffee & Crispy Dosas").
  - Featured Specialties (Mysore Masala Dosa, Degree Coffee, Filter Kaapi pairings).
  - Customer Reviews / Testimonials.
  - Quick Reservation CTA banner.
- **Menu (`menu.html`)**:
  - Category tabs: Filter Coffee, Dosas, Tiffins, Snacks, Desserts.
  - Interactive grid displaying item name, description, price (₹), and dietary tags (Vegetarian, Vegan, Gluten-Free).
- **Booking (`booking.html`)**:
  - Date & time picker, party size selector, seating preference (Indoor AC, Garden Patio, Traditional Seating).
  - Instant client-side validation and booking confirmation success state.
- **About (`about.html`)**:
  - History of South Indian filter coffee culture in Bengaluru.
  - Commitment to locally sourced ingredients, authentic chicory blends, and traditional batter preparation.
- **Contact (`contact.html`)**:
  - Branch locations in Indiranagar, Jayanagar, and Koramangala.
  - Contact details, interactive Google Maps embed, and inquiry form.

## Key Design Decisions
1. **Static HTML + Tailwind CSS**: Chosen for maximum performance, minimal hosting cost, instant page loads, and superior SEO indexing for local search in Bengaluru.
2. **Client-Side Interactivity**: Vanilla JavaScript handles menu filtering, mobile navigation drawer toggle, and booking form validation, avoiding heavy framework overhead.
3. **Responsive Mobile-First Design**: Optimized for smartphone users browsing menus and booking tables on the go.
4. **Brand Color Palette**: Rich coffee browns (`#3E2723`), warm turmeric gold (`#FFB300`), and crisp cream backgrounds (`#FAFAFA`) to evoke traditional South Indian cafe warmth.
