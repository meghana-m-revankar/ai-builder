# 03 Architecture

## Style: Static Website (HTML + CSS + Tailwind)
A modern, energetic website for **Iron Pulse Fitness**, a premium gym in Bengaluru. Built with clean, semantic HTML5, CSS3, and Tailwind CSS (via CDN) to ensure fast load times, excellent responsiveness, and an immersive dark-themed athletic aesthetic with vibrant orange accents (`#f97316` / orange-500).

```
src/
  index.html
  programs.html
  membership.html
  trainers.html
  schedule.html
  contact.html
  css/
    app.css
  js/
    main.js
  images/
    hero-gym.jpg
    trainer-vikram.jpg
    trainer-meera.jpg
    trainer-arjun.jpg
    trainer-kavya.jpg
    logo.svg
```

## Solution and File Structure
- **index.html**: Home page featuring hero banner, value proposition, quick stats (3,500+ members, 4.9★ rating, 6+ years), featured programs, BMI calculator widget, testimonials, and call-to-action.
- **programs.html**: Detailed breakdown of gym programs: Strength Training, HIIT, CrossFit, Yoga, Zumba, and Personal Training.
- **membership.html**: Transparent pricing tiers (Monthly, Quarterly, Half-Yearly, Annual, Personal Training 12 sessions) with membership feature comparison and signup modals.
- **trainers.html**: Profiles of the expert coaching team led by Founder & Head Coach Vikram Reddy, Meera Iyer, Arjun Singh, and Kavya Menon.
- **schedule.html**: Interactive weekly class schedule table with time slots, workout types, and trainer names.
- **contact.html**: Gym location details (3rd Floor, 22 Indiranagar 100 Feet Road, Bengaluru), contact info (+91 80 4123 7788, hello@ironpulse.in), operating hours, interactive free trial booking form, and embedded map placeholder.
- **css/app.css**: Custom Tailwind extensions, typography rules, dark theme background tokens (`bg-zinc-950`, `bg-zinc-900`), and orange accent utility classes.
- **js/main.js**: Client-side interactivity including mobile navigation toggle, BMI calculator logic, trial booking form validation and success toast, and active schedule filtering.

## Design System & Theme
- **Theme**: Dark athletic mode (`bg-zinc-950` base, `bg-zinc-900` card surfaces).
- **Accent**: Vibrant Orange (`text-orange-500`, `bg-orange-600`, `hover:bg-orange-500`).
- **Typography**: Inter / Montserrat sans-serif fonts loaded via Google Fonts.
- **Responsiveness**: Fully mobile-optimized with flexible grid and flexbox layouts.

## Key Design Decisions
1. **Static Architecture**: Chosen for blazing-fast performance, zero hosting complexity, and instant deployment.
2. **Tailwind via CDN**: Enables rapid styling with precise design tokens without requiring a complex Node.js build pipeline for static hosting.
3. **Client-Side Interactivity**: Vanilla JavaScript handles lightweight widgets like the BMI calculator and trial booking form without heavy framework overhead.
