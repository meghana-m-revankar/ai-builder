# Architecture: Meghana Portfolio

## Overview
A clean, responsive, single-page portfolio website built with HTML5, CSS3 (Bootstrap 5), and vanilla JavaScript. Designed for optimal viewing on mobile and desktop.

## Components & Sections
- **Navigation**: Sticky top navbar with smooth scrolling to sections.
- **Hero**: Introduction with CTA buttons.
- **About**: Personal profile with resume download link.
- **Projects**: Grid layout showcasing work.
- **Skills**: Badges highlighting technical stack.
- **Contact**: Functional form with client-side validation.
- **Footer**: Social media links.
- **Features**: Theme toggler (Light/Dark mode) and back-to-top button.

## Folder Structure
```
/
├── index.html          # Main entry point
├── css/
│   ├── styles.css      # Custom overrides and theme definitions
│   └── dark-mode.css   # Dark mode variables and overrides
├── js/
│   ├── main.js         # Smooth scrolling, form validation, theme toggle
│   └── scroll-top.js   # Back-to-top logic
├── images/
│   ├── profile.jpg     # Professional headshot
│   └── project-1.jpg   # Placeholder images
└── favicon.ico
```

## Design Decisions
- **Framework**: Bootstrap 5 used for rapid, responsive layout without external dependencies.
- **Interaction**: Vanilla JS used to keep the site lightweight and fast.
- **Accessibility**: Semantic HTML5 tags (`<nav>`, `<header>`, `<main>`, `<section>`, `<footer>`).
- **Theme**: Light/Dark mode toggled via a CSS class on the `<body>` element.
