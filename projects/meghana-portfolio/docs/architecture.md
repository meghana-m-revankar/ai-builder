# 03 Architecture - Meghana Portfolio

## Overview
A modern, responsive, one-page portfolio website for a front-end developer. The site focuses on performance, accessibility, and clean design using Tailwind CSS.

## Navigation & Sections
- **Sticky Header**: Navigation links (Home, About, Projects, Skills, Contact) with smooth scrolling. Hamburger menu for mobile.
- **Home**: Hero section with name, title, tagline, call-to-action buttons, and atmospheric background.
- **About**: Professional summary emphasizing 3+ years of experience and resume download.
- **Projects**: Showcase of 3 key projects using card components.
- **Skills**: Visual representation of technical stack using color-coded badges.
- **Contact**: Interactive form with validation and feedback loop.
- **Footer**: Social links (LinkedIn, GitHub, Instagram) and copyright.

## Functional Requirements
- **Theme**: Light/Dark mode toggle.
- **Interactivity**: Smooth scrolling, hamburger menu, form validation, "Back to Top" button.
- **Responsiveness**: Mobile-first design via Tailwind CSS.

## Folder Structure
```
/
├── index.html          # Main entry point
├── css/
│   └── style.css       # Custom overrides and animations
├── js/
│   └── script.js       # Main interaction logic (theme, scroll, form, menu)
├── images/             # Assets (profile, projects, background)
└── favicon.ico
```

## Key Design Decisions
- **Architecture**: Static Site (Jamstack-ready). No backend/database required.
- **Styling**: Tailwind CSS CDN for rapid styling and responsiveness.
- **Icons**: Lucide or FontAwesome via CDN for professional UI icons.
- **State**: Vanilla JavaScript for theme toggling and DOM manipulation.
