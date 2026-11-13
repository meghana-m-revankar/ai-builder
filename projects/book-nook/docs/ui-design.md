# UI Design Documentation - Meghana M Revankar Portfolio (.NET 8 + Blazor Server/WASM)

## Design System & Token Mapping
- **Font Family**: Plus Jakarta Sans (Headings), Inter (Body), JetBrains Mono (Code/Metrics).
- **Color Palette**:
  - `--brand-900`: `#0B1B3F` (Deep Navy)
  - `--brand-700`: `#1E3A8A` (Primary Indigo)
  - `--brand-500`: `#3B5BDB` (Interactive Blue)
  - `--brand-100`: `#E7ECFB` (Surface Tint)
  - `--accent-500`: `#F97316` (Vibrant Orange Call-to-Action)
  - `--canvas`: `#F6F7FB` (Page Background)
  - `--surface`: `#FFFFFF` (Card Panel)
  - `--ink-900`: `#0F172A` (Primary Text)
- **Icons**: Lucide icons via CDN (`lucide.min.js`), initialized via JavaScript interop or Blazor lifecycle events.

---

## Page Inventory & Layout Specifications

### 1. Home / Landing Page (`/`)
- **Purpose**: Showcase professional front-end expertise, key metrics, featured projects, and core tech stack with high-impact Dribbble-level aesthetics.
- **Layout**: Sticky navigation bar, hero section with 56-72px headline and interactive skill badges, bento grid of featured projects, timeline work experience, interactive skill matrix, and rich footer.
- **Fields**: Newsletter/Quick Contact inline input.
- **Buttons/Actions**: "Explore Projects" (scrolls/navigates to portfolio), "Download Resume", "Hire Me" (opens contact modal/page), Filter pills for skills.
- **Navigation**: Links to `/portfolio`, `/services`, `/resume`, `/contact`, and anchor links to sections.

### 2. Portfolio / Projects Page (`/portfolio`)
- **Purpose**: Comprehensive filterable showcase of client projects, SaaS dashboards, and e-commerce web apps.
- **Layout**: Top header with search bar and category filter tabs (All, React, Tailwind, Blazor, TypeScript), responsive 3-column card grid with hover zoom effects, tags, and direct view/github action buttons.
- **Fields**: Project search query input.
- **Buttons/Actions**: Category filter buttons, "View Details" modal trigger, "Live Demo" external link.
- **Navigation**: Breadcrumb back to Home, Pagination / Load More.

### 3. Services & Pricing Page (`/services`)
- **Purpose**: Detail freelance development packages, UI/UX implementation services, and custom engagement tiers.
- **Layout**: Pricing tier bento grid (3 columns, middle highlighted as "Most Popular"), feature checklist, FAQ accordion.
- **Fields**: Custom quote calculator sliders (Pages count, Delivery speed, Design system integration).
- **Buttons/Actions**: "Select Plan" (redirects to contact with pre-filled service inquiry).
- **Navigation**: Return to home, navigation to Contact.

### 4. Resume & Experience Page (`/resume`)
- **Purpose**: Detailed career timeline, education, certifications, and downloadable professional resume in PDF format.
- **Layout**: Two-column layout (Left: Career timeline & Education; Right: Technical skills breakdown with proficiency meters, certifications, and languages).
- **Fields**: None (Read-only interactive view).
- **Buttons/Actions**: "Download PDF Resume" (triggers simulated download), "Print Resume".
- **Navigation**: Back to home.

### 5. Contact & Booking Page (`/contact`)
- **Purpose**: Direct lead capture form, meeting scheduler integration preview, and direct email/social links.
- **Layout**: Split screen layout (Left: Contact info, office location Bengaluru, social badges; Right: Glassmorphism interactive contact form with validation).
- **Fields**: Full Name, Email Address, Project Type dropdown, Budget range, Message.
- **Buttons/Actions**: "Send Message" (submits form with client-side validation and success toast notification).
- **Navigation**: Return to home.
