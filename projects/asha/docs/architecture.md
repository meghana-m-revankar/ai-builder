# Asha Foundation Architecture

## 1. Overview
Asha Foundation is a non-governmental organization (NGO) based in Bengaluru, India, dedicated to providing free education and nutritious meals to underprivileged children. This architecture document defines the structure, design, and layout for the official public website of Asha Foundation, built using a lightweight, performant static tech stack: **HTML5, CSS3, and Tailwind CSS**.

The website serves as an informational, engagement, and fundraising platform. It highlights the foundation's mission, showcases impact metrics, provides clear pathways for monetary donations, facilitates volunteer registration, and shares success stories.

### Tech Stack
- **Markup:** HTML5 (semantic layout)
- **Styling:** Tailwind CSS (via CDN with custom configuration) + custom CSS tokens for brand colors
- **Interactivity:** Vanilla JavaScript (ES6+) for mobile navigation toggle, modal dialogs, form validation, and dynamic content filtering
- **Hosting:** Static hosting (GitHub Pages, Netlify, or Vercel)

---

## 2. Brand Identity & Design System
To reflect the warmth, growth, and optimism of Asha Foundation, the visual design strictly follows a **Green and Yellow** color palette:
- **Primary / Brand Green:** `#15803d` (Tailwind `green-700`), representing growth, nature, and hope.
- **Accent / Warm Yellow:** `#eab308` (Tailwind `yellow-500`), representing energy, brightness, and children.
- **Background Tints:** `#f0fdf4` (`green-50`) for light section backdrops.
- **Neutral Dark:** `#1f2937` (`gray-800`) for high-contrast readable typography.

---

## 3. Site Structure & Pages
The website is structured as a multi-page static site with a shared header, navigation, and footer across all pages.

```
asha-website/
├── index.html              # Home page (Hero, Mission, Impact, Testimonials, CTA)
├── about.html              # About Us (Our Story, Vision & Mission, Leadership, Bengaluru Centers)
├── programs.html           # Programs (Free Education, Mid-day Meals, Health Camps)
├── donate.html             # Donate Page (Tiered donation amounts, QR code, Bank Details, Impact calculator)
├── volunteer.html          # Volunteer Page (Volunteer roles, application form, FAQs)
├── contact.html            # Contact Us (Bengaluru office address, inquiry form, Google Maps embed placeholder)
├── css/
│   └── styles.css          # Custom typography, animations, and Tailwind overrides
├── js/
│   └── main.js             # Mobile menu toggle, form validation, tab handlers
└── images/
    ├── hero-children.jpg   # High-resolution hero image
    ├── logo.svg            # Asha Foundation vector logo
    ├── education.jpg       # Program photo: classroom teaching
    └── meals.jpg           # Program photo: nutritious meal distribution
```

---

## 4. Page Breakdown & Components

### 4.1. Global Components (Present on all pages)
- **Header / Navigation (`<header>`):**
  - Logo with green/yellow branding.
  - Links: Home, About Us, Programs, Donate, Volunteer, Contact Us.
  - Prominent CTA Button: "Donate Now" (Yellow background with dark text).
  - Responsive Hamburger menu for mobile devices.
- **Footer (`<footer>`):**
  - Organization summary, quick links, Bengaluru office address, contact phone/email, social media handles (Facebook, Instagram, Twitter, LinkedIn), and copyright notice.

### 4.2. Page Details
1. **Home (`index.html`):**
   - *Hero Section:* High-impact banner with headline ("Empowering Futures: Free Education & Meals for Underprivileged Children in Bengaluru"), background imagery, and dual CTA buttons ("Explore Programs" and "Support Our Cause").
   - *Impact Statistics Bar:* Animated counters for "Children Educated", "Meals Served Daily", "Active Volunteers", and "Bengaluru Learning Centers".
   - *Core Pillars:* Two feature cards highlighting Education and Nutrition.
   - *Success Story / Testimonial Carousel:* Real-life accounts from children and parents.
2. **About Us (`about.html`):**
   - Organizational history starting from Bengaluru.
   - Vision and Mission statements.
   - Core values (Transparency, Compassion, Excellence, Inclusivity).
   - Leadership & Trustee team grid.
3. **Programs (`programs.html`):**
   - Detailed breakdown of Asha Foundation's core initiatives:
     - *Asha Shala (Free Education):* After-school tutoring, digital literacy, and school supply distribution.
     - *Annapoorna (Nutritious Meals):* Daily mid-day meal program ensuring balanced nutrition.
     - *Swasthya (Health & Hygiene):* Regular health check-ups and dental camps in slums.
4. **Donate (`donate.html`):**
   - *Donation Options:* One-time vs. Monthly recurring contributions.
   - *Preset Amount Selector:* ₹500 (feeds 1 child for a month), ₹1,500 (school supplies), ₹5,000 (sponsor a classroom meal for a day). Custom amount input.
   - *Payment Modes:* UPI QR Code (Google Pay/PhonePe/Paytm), Bank Transfer (NEFT/RTGS details with 80G tax exemption note), and Credit/Debit card simulation form.
5. **Volunteer (`volunteer.html`):**
   - Roles available: Weekend Tutor, Meal Server, Health Camp Coordinator, Fundraiser.
   - Online Volunteer Registration Form (Name, Email, Phone, Preferred Center in Bengaluru, Availability, Area of Interest).
   - FAQ accordion regarding age limits, time commitments, and certification.
6. **Contact Us (`contact.html`):**
   - Bengaluru Office Address: Jayanagar 4th Block, Bengaluru, Karnataka 560011.
   - Contact numbers and official email (`support@ashafoundation.org`).
   - General Inquiry Contact Form with success toast notification.

---

## 5. Key Design Decisions
1. **Static Architecture Choice:** Since the requirements do not mandate dynamic database transactions or user authentication portals, a static site built with HTML and Tailwind CSS ensures lightning-fast load times, zero server maintenance overhead, high security, and effortless hosting on CDNs.
2. **Client-Side Validation & Feedback:** Forms (Donation and Volunteer registration) utilize vanilla JavaScript for immediate client-side validation and friendly success/error feedback toasts without requiring server roundtrips.
3. **Accessibility (a11y):** High contrast ratios for text over green and yellow backgrounds, semantic HTML5 landmarks (`<header>`, `<main>`, `<section>`, `<footer>`), and `alt` attributes on all images to ensure inclusivity for all visitors.
4. **Responsive First:** Mobile-first grid layouts using Tailwind CSS ensure seamless viewing experiences across smartphones, tablets, and desktop workstations used by donors and volunteers alike.
