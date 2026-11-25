# 02b Site Defaults (fixed parts of every website)

Applies to the Static Site agent and the site planner. The user may write only one line
("website for my bakery"). Everything below is filled in automatically, so the user never has to
describe the header, footer, contact details or standard pages.

**Rule:** if the request gives a value (name, address, phone, colours, pages), use the request exactly.
Otherwise follow the honesty rule in 00 Start Here: **design and structure** come from this file,
**business facts are never invented** — they are written as clearly labelled **Sample** content.
Never write "Lorem ipsum", "Feature 1" or "123 Main Street".

---

## 1. Business details: given facts vs Sample placeholders

Replace `<Business Name>` with the project name. Put every placeholder fact inside
`<span class="sample" data-sample>…</span>` so it is visibly marked and easy to find later.

| Field | If given | If NOT given (Sample) |
|---|---|---|
| Business name | as given | the project name, Title Case (not Sample) |
| Tagline | as given | write one for the business type, max 8 words (copy, not a fact — no badge) |
| Address | as given | `Your street, City` (Sample) |
| Phone / WhatsApp | as given (`tel:` / `https://wa.me/` links) | `+91 00000 00000` (Sample), link `tel:` left empty → link to contact.html |
| Email | as given (`mailto:`) | `hello@yourbusiness.com` (Sample) |
| Opening hours | as given | `Add your opening hours` (Sample) |
| Year founded, customer counts, ratings | as given | do NOT show a number; use a non-numeric trust line ("Locally owned", "Made fresh daily") |
| Prices | as given | `from ₹XXX` or no price (Sample badge on the card) |
| Products / services | as given | 6-9 typical items for the business type, each card with a **Sample** badge |
| Team / founder | as given | role-only cards ("Head Chef", "Lead Stylist") with a Sample badge and an initials avatar; no invented personal names |
| Testimonials | as given | section titled "What customers say" with a visible note "Sample reviews — replace with real ones"; reviewer shown as "Customer name" |
| Social links | as given | omit social icons |
| Map | from the given address | omit the map; show "Add your location" (Sample) |
| Currency | from the country (default ₹) | ₹ |

Sample badge style (Tailwind): `inline-flex items-center rounded-full bg-amber-100 text-amber-800 text-xs font-semibold px-2 py-0.5`.

---

## 2. Default pages

If the request does not list pages, build exactly these 4:

| File | Title | Purpose |
|---|---|---|
| `index.html` | Home | Full landing page (sections in section 5) |
| `about.html` | About | Story, founder, values (3 cards), team (3-4 people), stats, CTA |
| `services.html` | the right word for the business: Menu / Services / Products / Courses | All items as cards with image, name, description, ₹ price, button |
| `contact.html` | Contact | Contact form, address, phone, email, hours, Google Map, FAQ (4 items) |

Add one app page only when the business clearly needs it: `booking.html` (salon, clinic, restaurant,
hotel), `cart.html` (shop, bakery, store), `dashboard.html` (admin/staff tool).

### Every inner page is a full page, never a stub (MUST)
A page with only a heading and a few lines of text is a failure. Every page other than Home has:
1. A **page hero** (`min-h-[45vh]`): full-bleed photo, dark gradient overlay, page title, one-line intro, breadcrumb (Home / Page).
2. **At least 5 content sections** below the hero, each with images or icons.
3. A **CTA band** and the full footer.
4. At least **8 photos**.

### Menu / Services / Products page (the most important inner page)
- **At least 12 items**, grouped in **3-4 categories** that fit the business (café: Coffee, Chai & Tea,
  Breakfast, Desserts; salon: Hair, Skin, Nails, Bridal; shop: by product type).
- **Category filter tabs** at the top (All + each category), working with JavaScript: clicking a tab
  shows only that category, the active tab is highlighted.
- **Every item is a card with:** a photo (`h-56 w-full object-cover rounded-xl`, picsum seed that
  describes that exact item, e.g. `masala-chai-clay-cup`), name, 2-line appetising description, the given
  ₹ price in bold brand colour (or a **Sample** badge and "from ₹XXX" when prices are not given), small badges where they fit (Bestseller, Veg, Spicy 🌶, New, Chef's pick), and an
  "Add" / "Order" / "Book" button.
- Write **all items directly in the HTML** (not rendered from empty JS arrays), so the page is never empty.
- Also on this page: a **featured item** banner (split image/text, "Today's special"), a short
  "why our <items> are special" strip with 3 icons, a **combo / offers** section (2-3 deals with
  ₹ savings), and a review quote.
- Item names and descriptions must sound delicious and specific (e.g. "Cardamom Cold Brew - 18-hour
  slow-steeped coffee with a hint of green cardamom, served over jaggery ice. ₹220"), never "Item 1",
  "Coffee", or one-word descriptions.

### About page
Page hero, story (split image/text, 2 paragraphs — the given story, or a Sample story template the owner
fills in), timeline only if real milestones are given, values (3 icon cards), team (given people; otherwise
role-only Sample cards with initials avatars), trust strip, gallery (6 photos), CTA.

### Contact page
Page hero, 3 contact cards (Call, WhatsApp, Email with icons and links), contact form (name, phone,
email, message, submit) beside the address/hours card, Google Map iframe, FAQ (4 `<details>`), CTA.

### Booking page (when present)
Page hero, working booking form (name, phone, date, time slot buttons, number of guests/service,
notes), summary card that updates live, confirmation toast on submit, saved to localStorage, plus
"what to expect" (3 icons) and FAQ.

---

## 3. Fixed header (same on every page)

```
[Logo + Business Name]     Home  About  Services  Contact      [Primary button]   [☰ mobile]
```
- Sticky at the top: `sticky top-0 z-50`, white (or dark for dark themes) with `backdrop-blur` and a bottom border.
- Left: logo icon (Lucide icon that fits the business, in a rounded brand-coloured square) + business name in `font-display font-extrabold`.
- Centre/right (desktop, `hidden md:flex`): links to every page, in the order of section 2. Current page is bold and brand-coloured with `aria-current="page"`.
- Right: one primary button. Text by business type: "Book a Table" (restaurant/café), "Book Now" (salon, clinic, hotel), "Order Now" (shop, bakery), "Get a Quote" (services), "Enrol Now" (courses), otherwise "Contact Us". Links to the booking/cart page if it exists, otherwise `contact.html`.
- Mobile: a `md:hidden` button with `aria-controls="mobile-menu"` and a Lucide `menu` icon; below the header `<div id="mobile-menu" class="hidden md:hidden">` with full-width links and the primary button.
- Top info bar (optional, above the header, hidden on mobile): phone · hours · social icons, small text.

---

## 4. Fixed footer (same on every page)

Dark background (`bg-slate-900 text-slate-300`), 4 columns on desktop, 1 column on mobile:

| Column 1 | Column 2 | Column 3 | Column 4 |
|---|---|---|---|
| Logo + name, tagline, 1-sentence description, social icons (Instagram, Facebook, X, LinkedIn, YouTube) | **Quick links**: every page | **Visit us**: address, opening hours | **Contact**: phone (`tel:` link), WhatsApp (`https://wa.me/...`), email (`mailto:` link) |

Bottom bar (border-top): `© <span data-year>2026</span> <Business Name>. All rights reserved.` on
the left, `Privacy Policy · Terms` (link to `#`) on the right.

Above the footer on every page: a **CTA band** in brand colour with a headline, one sentence and
the primary button from the header.

Floating **WhatsApp button** on every page: bottom-right, round, green (`bg-green-500`), Lucide
`message-circle` icon, link to the WhatsApp number, `aria-label="Chat on WhatsApp"`.

---

## 5. Default home page sections (in this order)

1. Hero: full-bleed photo with dark gradient overlay, headline, sub-headline, 2 buttons (primary + "Explore <Services>")
2. Trust strip: given numbers/rating only; otherwise 3-4 non-numeric trust points with icons ("Locally owned", "Fresh every day")
3. About preview: split image/text, founder quote, "Read our story" → about.html
4. Featured items: 6 cards (image, name, ₹ price, button) → services.html
5. Why choose us: 6 feature cards with Lucide icons
6. How it works: 3 steps
7. Gallery: 6-8 photos in a bento grid
8. Testimonials: real ones from the brief; otherwise 3 cards marked "Sample reviews — replace with real ones", reviewer "Customer name", no star rating
9. FAQ: 5 items using `<details>`
10. CTA band, then the footer

---

## 6. Default look

When the request gives no colours or style, pick by business type:

| Business type | Brand colour (500) | Mood |
|---|---|---|
| Café, bakery, restaurant | Warm amber `#d97706` | Warm editorial, cream backgrounds |
| Salon, spa, beauty | Rose `#e11d48` | Soft, elegant, lots of white space |
| Clinic, health, pharmacy | Teal `#0d9488` | Clean, calm, trustworthy |
| Gym, fitness, sports | Orange-red `#ea580c` on dark | Bold, dark, high-energy |
| Shop, fashion, retail | Violet `#7c3aed` | Modern, playful product grids |
| Education, coaching | Blue `#2563eb` | Friendly, structured |
| Real estate, finance, legal, B2B | Navy `#1e3a8a` + gold accent | Premium, corporate |
| Anything else | Indigo `#4f46e5` | Modern, clean |

Fonts are always Plus Jakarta Sans (headings) and Inter (body). Icons are always Lucide, whatever the request says.

---

## 7. Example request to test this file

Type only this into the form; everything else comes from the defaults above:

- **Project Name:** `Spice Garden Cafe`
- **Requirements:** `Website for my cafe.`
- **Tech Stack:** `Static HTML + CSS + Tailwind`
- **Icon Pack:** `Lucide` (always; no other pack)

Expected result: 4-5 pages (Home, About, Menu, Contact, plus Booking), sticky header with
"Book a Table", 4-column footer whose address, phone and hours are **Sample** placeholders,
a warm restaurant theme from 17 Themes, menu cards marked Sample, and a summary listing every
Sample item the owner must replace. No invented address, phone, prices or customer names.
