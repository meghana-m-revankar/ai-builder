# 03 Architecture - Sunrise Yoga

## Overview
Sunrise Yoga is a static website designed for a boutique yoga studio targeting beginners and busy professionals. It provides information about the studio, class schedules, pricing, and contact details.

## Pages & Navigation
- **Home (index.html):** Hero section, brief studio introduction, quick links to classes and booking.
- **Classes (classes.html):** Details on morning/evening sessions and experience levels.
- **Schedule (schedule.html):** Weekly class timetable.
- **About (about.html):** Instructor profiles and studio philosophy.
- **Contact (contact.html):** Inquiry form (via Formspree or similar service), location, and map.

## File Structure
- `index.html`
- `classes.html`
- `schedule.html`
- `about.html`
- `contact.html`
- `css/`
  - `styles.css` (Custom overrides)
  - `bootstrap.min.css` (Bootstrap 5 CDN or local)
- `js/`
  - `main.js` (UI interactivity)
- `images/`
  - `logo.svg`
  - `hero-bg.jpg`
  - `instructor-1.jpg`

## Design Decisions
- **Tech Stack:** Static HTML/CSS/JS for maximum performance and low maintenance.
- **Styling:** Bootstrap 5 for rapid, responsive grid layouts.
- **Hosting:** Suitable for GitHub Pages or Netlify.
- **Forms:** Uses external integration (like Formspree) to avoid backend requirements.
