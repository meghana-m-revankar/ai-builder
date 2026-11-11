# Wanderlane Trips Architecture

## Overview
Wanderlane Trips is a static travel agency website designed to showcase adventurous tour packages. The site focuses on visual engagement, clear information hierarchy, and high conversion for enquiries.

## Pages & Navigation
- **Home**: Hero section, featured destinations, "Why Us", quick reviews.
- **Packages**: Grid view of all destinations (Kerala, Goa, Manali, Dubai, Bali).
- **Package Details**: Deep dive into specific trip itinerary, days, price, and gallery.
- **Enquiry**: Contact form for booking/questions.
- **About/Reviews**: Agency mission and customer feedback.

## Folder Structure
```text
/
├── index.html            # Landing page
├── packages.html         # Listing page
├── package-detail.html   # Template for destinations
├── contact.html          # Enquiry form
├── reviews.html          # Testimonials
├── css/
│   └── app.css           # Tailwind custom components and base styles
├── js/
│   └── main.js           # Form handling and UI interactions
├── images/               # Destination photos, icons
└── favicon.svg
```

## Design Decisions
- **Styling**: Tailwind CSS via CDN for rapid development and responsive, "colourful and adventurous" theme.
- **Interactivity**: Lightweight Vanilla JS for form validation and basic DOM manipulation (no framework).
- **Performance**: Standard static hosting; image optimization for gallery items.
