# Brew & Bean Cafe Architecture

## Overview
A modern, responsive, static one-page-plus website for a neighborhood cafe. Built using HTML5, CSS, and Tailwind CSS. The design focuses on a warm aesthetic (browns/creams), high-quality imagery, and clear navigation.

## Modules & Components
- **Layout**: Header (Logo + Nav), Footer (Social links + Copyright).
- **Home**: Hero section, Featured Items (3 cards), Hours summary, CTA.
- **Menu**: Categorized grid (Coffee, Pastries) with product cards.
- **About**: Story section, Team gallery.
- **Contact**: Contact form, Map integration (Google Maps embed).
- **Navigation**: Mobile-responsive hamburger menu.

## Folder Structure
```
/
├── index.html          # Home
├── menu.html           # Menu page
├── about.html          # About page
├── contact.html        # Contact page
├── css/
│   └── style.css       # Custom overrides
├── js/
│   └── main.js         # Mobile menu toggle
├── images/
│   ├── logo.svg
│   ├── hero-coffee.jpg
│   └── team/
└── favicon.ico
```

## Key Design Decisions
- **Stack**: Static HTML, vanilla JS, Tailwind CDN for rapid development and low hosting overhead.
- **Styling**: Tailwind's color palette for custom brown/cream themes; rounded corners (class `rounded-2xl`) for visual warmth.
- **Performance**: Use compressed images; responsive design handled via Tailwind's grid and flex utilities.
- **Form Handling**: Since no backend is required, the contact form will use a service like Formspree to handle submissions via POST.
