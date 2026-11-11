# Architecture - Meghana Portfolio

## Overview
A responsive, single-page portfolio website for a front-end developer. The project uses a static architecture to ensure speed, SEO-friendliness, and simple deployment.

## Navigation & Sections
- **Navigation:** Sticky top menu with smooth-scroll linking.
- **Sections:**
    1. **Home:** Introduction, hero image, CTA buttons.
    2. **About:** Personal summary, 3+ years experience, resume download.
    3. **Projects:** Showcase of three featured works with descriptive cards.
    4. **Skills:** Visual representation of technical stack using stylized badges.
    5. **Contact:** Interactive form with client-side validation.
    6. **Footer:** Social links and copyright.

## Folder Structure
```
/
├── index.html
├── css/
│   └── style.css
├── js/
│   └── main.js
├── assets/
│   ├── images/
│   │   ├── hero.jpg
│   │   ├── project-1.jpg
│   │   ├── project-2.jpg
│   │   └── project-3.jpg
│   └── resume.pdf
└── README.md
```

## Design Decisions
- **Framework:** Vanilla HTML5, CSS3, and JavaScript to maintain zero dependencies and high performance.
- **UI System:** Custom CSS combined with a clean, modern color palette and typography.
- **Responsiveness:** Mobile-first approach with a CSS-based hamburger menu.
- **Interactivity:** Smooth scrolling, dark mode toggle using CSS variables, and basic form validation.
