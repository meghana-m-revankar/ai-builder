# UI Design Documentation

## Purpose
The portfolio website acts as a personal digital hub for professional branding. Its goal is to communicate expertise through project case studies and provide a direct channel for collaboration.

## Layout Structure
- **Navbar**: Sticky, transparent-to-solid glassmorphism, logo on left, nav items on right.
- **Hero**: Full-viewport height (min-height 70svh), center-aligned, high-contrast typography.
- **About**: 2-column layout on desktop (image + text), single column on mobile.
- **Projects**: 3-column bento-style card grid.
- **Skills**: Badge cloud or organized flex container.
- **Contact**: 2-column: Contact info on the left, Form on the right.
- **Footer**: Simple centered content with social links.

## Fields & Interactions
- **Contact Form**: Name, Email, Subject, Message. Validation via HTML5.
- **Theme Switcher**: Button in navbar toggling `data-bs-theme="dark"`.
- **Buttons**: Primary (solid brand color), Secondary (outline). Hover effects on all.
