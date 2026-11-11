# Flower Shop Architecture

## Overview
A simple, responsive static website for a local flower shop to display products, services, and contact information.

## Pages & Sections
- **Home**: Hero section, featured flowers, brief About Us.
- **Shop**: Catalog of flowers with filtering by category (e.g., Occasions, Plants).
- **About**: Story of the shop and floral team.
- **Contact**: Location map, contact form, phone, and hours.

## Navigation
- Top navigation bar persistent across all pages.
- Includes: Home, Shop, About, Contact.

## File Structure
/
├── index.html
├── shop.html
├── about.html
├── contact.html
├── css/
│   └── app.css (Custom overrides + Tailwind directives)
├── js/
│   └── main.js (UI interactivity, simple form validation)
├── images/
│   ├── hero.jpg
│   ├── logo.svg
│   └── products/ (images for individual items)
└── tailwind.config.js
