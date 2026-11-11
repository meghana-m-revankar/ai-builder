# Architecture - My Portfolio

## Overview
A clean, responsive, single-page portfolio website designed to showcase projects, skills, and contact information. The site uses a static HTML/CSS/Bootstrap stack to ensure fast loading times and ease of hosting.

## Components & Sections
- **Navigation**: Sticky top navbar with smooth scroll links (Home, About, Projects, Skills, Contact).
- **Hero Section**: Personal introduction with clear CTA buttons.
- **About Section**: Professional bio with a personal headshot.
- **Projects Section**: Grid display of 3 key projects using Bootstrap cards.
- **Skills Section**: Visual list of technical competencies.
- **Contact Section**: Form layout (Note: frontend-only, expects formspree or similar integration).
- **Footer**: Social media links and copyright notice.
- **Theme Switcher**: JavaScript-based light/dark mode toggle.

## Folder Structure
```
/
├── index.html
├── css/
│   ├── style.css
│   └── theme-toggle.css
├── js/
│   ├── main.js
│   └── theme-switcher.js
├── images/
│   ├── profile.jpg
│   ├── project1.jpg
│   ├── project2.jpg
│   └── project3.jpg
└── assets/
    └── icons/ (for social media)
```

## Key Design Decisions
- **Responsive Framework**: Using Bootstrap 5 for rapid, mobile-first design.
- **Performance**: Minimal dependencies; icons via CDN/FontAwesome.
- **Theme Handling**: Light/Dark mode toggled via JS by applying a class to the `body` element.
- **Simplicity**: Static site structure (no backend) to eliminate maintenance requirements and hosting costs.
