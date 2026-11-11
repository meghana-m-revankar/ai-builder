# Portfolio Architecture

## Overview
A responsive, single-page personal portfolio website for Meghana, a front-end developer based in Bengaluru. The site is built with static HTML, vanilla CSS, and Tailwind CSS for styling. It features a clean, modern design with a dark/light mode toggle.

## Pages and Navigation
- **Page**: `index.html` (Single-page layout)
- **Navigation**: Sticky header with anchor links (`#home`, `#about`, `#projects`, `#skills`, `#contact`) to scroll to respective sections.

## Sections
1.  **Hero**: Name, title, tagline, call-to-action buttons (See My Work, Contact Me), and ambient workspace background.
2.  **About**: Profile photo, professional introduction, and "Download Resume" button.
3.  **Projects**: Grid displaying 3 project cards (Shopping Website, Business Dashboard, Mobile App).
4.  **Skills**: List of technical proficiencies (HTML, CSS, JS, React, Figma).
5.  **Contact**: Form for user inquiries with a client-side success message.
6.  **Footer**: Social media links.

## Folder Structure
```
/
├── index.html          # Main landing page
├── css/
│   └── styles.css      # Custom overrides and component styles
├── js/
│   ├── main.js         # Theme toggle and smooth scroll
│   └── form.js         # Contact form submission simulation
├── images/             # Asset directory (e.g., profile.jpg, workspace.jpg)
└── README.md
```

## Key Design Decisions
- **Styling**: Tailwind CSS via CDN for rapid, responsive UI development.
- **Interactivity**: Vanilla JS for light/dark mode persistence (localStorage) and smooth scroll navigation.
- **Backend**: None. The contact form uses a simple client-side event handler to display a success message, assuming integration with a form-handling service (like Formspree) is added later.
- **Performance**: Mobile-first design philosophy using Tailwind utilities.
