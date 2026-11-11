# Saffron Leaf Restaurant Architecture

## Overview
A premium, static, high-performance website for Saffron Leaf Restaurant, Jayanagar. Focuses on an elegant dark luxury aesthetic using deep charcoal backgrounds and saffron/gold accents. Built with static HTML5, CSS3, and Tailwind CSS for responsive design.

## Components and Pages
- **Global Components**: Navigation (responsive, fixed), Footer (contact, social, hours), Shared UI (buttons, badges, forms).
- **Home**: Hero section, stats, signature dishes, chef's story, gallery preview, reviews, FAQ.
- **Menu**: Categorized tabbed interface with filterable items.
- **About**: Timeline of legacy, team showcase, sourcing ethos, awards.
- **Gallery**: Responsive masonry grid with lightbox functionality.
- **Contact**: Reservation form and location/operational details.

## Folder Structure
```text
/
├── index.html
├── menu.html
├── about.html
├── gallery.html
├── contact.html
├── css/
│   └── app.css       # Tailwind directives + custom luxury styles
├── js/
│   └── main.js       # Tab switching, form handling, lightbox logic
├── images/           # High-res assets (optimized)
│   ├── hero.jpg
│   └── dishes/
├── tailwind.config.js
└── README.md
```

## Design Decisions
- **Static Assets**: All content is static; performance is prioritized.
- **Interactivity**: Lightbox and form validation handled via lightweight vanilla JS.
- **Styling**: Tailwind utility classes for consistent spacing and typography, with custom CSS for 'fine-dining' polish (transitions, shadows).
- **Accessibility**: Semantic HTML5 used throughout for better SEO and assistive technology compliance.
