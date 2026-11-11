# Architecture - Meghana Portfolio

## Overview
A responsive, one-page personal portfolio website for a front-end developer based in Bengaluru. Designed for high performance and accessibility using static HTML, CSS, and Tailwind CSS.

## Pages & Sections
- **Single Page Application (SPA) structure:**
  - **Header/Nav:** Navigation links (Home, About, Projects, Skills, Contact) + Light/Dark mode toggle.
  - **Hero:** Name, title, tagline, call-to-action buttons, background imagery.
  - **About:** Personal bio, professional summary, "Download Resume" button.
  - **Projects:** Grid layout with three project cards (Shopping Site, Dashboard, Mobile App).
  - **Skills:** Icon-based grid/flex list of core competencies.
  - **Contact:** Form with Name, Email, and Message fields, plus success state UI.
  - **Footer:** Social media links (LinkedIn, GitHub, etc.).

## Folder Structure
```
/
├── index.html          # Single page entry point
├── css/
│   └── style.css       # Custom overrides and Tailwind directives
├── js/
│   └── main.js         # Theme toggle, smooth scroll, form handling
├── assets/
│   ├── images/         # Photos, project screenshots
│   └── docs/           # Resume PDF
└── tailwind.config.js  # Tailwind CSS configuration
```

## Key Design Decisions
- **Tech Stack:** Pure static files (HTML/CSS/JS) for speed and easy hosting (e.g., GitHub Pages).
- **Styling:** Tailwind CSS (via CDN) for utility-first responsive design.
- **Interactivity:** Simple Vanilla JS for theme toggling and form submission simulation.
- **Responsiveness:** Mobile-first approach, ensuring seamless transitions between mobile, tablet, and desktop views.
- **Theme:** Simple dark/light mode toggle via CSS class manipulation on the root element.
