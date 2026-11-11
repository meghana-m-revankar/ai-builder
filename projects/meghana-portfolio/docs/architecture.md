# Architecture: Meghana Portfolio

## Overview
A clean, responsive, single-page portfolio website for a front-end developer based in Bengaluru. Designed for mobile and desktop, featuring a modern aesthetic with light/dark mode support.

## Modules/Components
- **Navigation**: Sticky header with anchor links.
- **Hero Section**: Personal branding, CTA buttons, and background imagery.
- **About Section**: Professional summary and resume download action.
- **Projects Section**: Grid-based display of 3 core projects.
- **Skills Section**: Visual representation of tech stack (HTML, CSS, JS, React, Figma).
- **Contact Form**: Interactive form with feedback states.
- **Theme Switcher**: Global light/dark mode toggler.
- **Footer**: Social media navigation.

## Folder Structure
```
/
├── index.html           # Main page structure
├── css/
│   └── style.css        # Custom styles + Tailwind directives
├── js/
│   ├── main.js          # Theme toggler, form submission, scroll behavior
│   └── tailwind.config.js
├── images/              # Assets (profile, project screenshots, background)
└── favicon.svg
```

## Key Design Decisions
- **Static Site**: No backend needed; all content is hardcoded for simplicity.
- **Styling**: Tailwind CSS via CDN for rapid development and responsiveness.
- **Responsiveness**: Mobile-first grid layouts for projects and skills.
- **Theme**: JS-based class toggling on the `<html>` root for light/dark mode.
- **Contact**: Client-side form handling (e.g., using Formspree or similar service).
