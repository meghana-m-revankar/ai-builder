# 11 Section Recipes

Build every marketing page by assembling these recipes. Do not invent a plainer version. Each recipe lists the exact parts; a section missing a part is unfinished. Code for every recipe is in 09 Site Template.

## Background rhythm (MUST)
Alternate section backgrounds so the page never shows two plain white sections in a row:
`hero (.hero-glow)` → `canvas` → `bg-brand-100` → `canvas` → `bg-brand-900 text-white` → `canvas` → `.cta-band` → `footer bg-brand-900`.

## Recipes
| # | Section | Required parts |
|---|---|---|
| R1 | Navbar | sticky, `bg-canvas/80 backdrop-blur-md`, logo img + wordmark, 4-5 links, accent CTA button with icon, hamburger under lg with working mobile menu |
| R2 | Hero | 2 columns from lg. Left: eyebrow with icon, h1 (`.hero-title`, fluid `--fs-hero`) with ONE word in `text-brand-500`, lead paragraph, 2 buttons (accent + outline, both with icons), 3 stats (mono number + label). Right: 4:3 image `rounded-xl2 shadow-soft` + 2 floating `.chip` (rating, live status). Background `.hero-glow` |
| R3 | Trust strip | 4-6 items in a row: icon + bold value + small label (e.g. "4.9 Google rating", "12 trainers", "Since 2016") on `border-y border-line` |
| R4 | Bento features | `md:grid-cols-3 md:grid-rows-2`; card 1 spans 2×2 with image + title + text; 4 smaller cards each with `.icon-tile`, title, text |
| R5 | Showcase / products | `bg-brand-100`; heading left + filter pills right; 4-8 cards from data.js: image with zoom, badge pill, title + mono price, 1-line description, button or link |
| R6 | How it works | 3-4 numbered steps; each: big mono number in a brand circle, icon, title, text; connecting line on lg |
| R7 | Stats band or mockup | either 4 big numbers on `bg-brand-900`, or an HTML/CSS product mockup (app card, schedule widget, phone frame) next to a bullet list with check icons |
| R8 | Testimonials | `bg-brand-900 text-white`; 3 cards on `bg-white/5 border-white/10`: 5 star icons, quote, avatar img + name + role |
| R9 | Pricing (if the business sells plans) | 3 tiers, middle one `ring-2 ring-accent-500` + "Most popular" pill, price in mono, 4-6 features with check icons, button |
| R10 | FAQ | 5+ items, `<button aria-expanded>` + panel, chevron icon rotates, one open at a time |
| R11 | CTA band | `.cta-band` gradient, headline + sub-line left, light button with icon right; full-width button on phones |
| R12 | Footer | logo + pitch + 3 social icon buttons; 3 link columns; contact lines with icons (clock, phone, map-pin); copyright with year; image credits line |
| R13 | Form (booking / contact / order) | white card `rounded-xl2 shadow-soft`; label above each field, required `*`, helper text, inline error under field, 2 columns from md, accent submit button with icon; on submit: validate → save to localStorage → toast → reset |

## Page plans by business type (pick the closest)
- **Studio / gym / clinic / salon**: R1 R2 R3 R4 R6(class types or services as R5) R7(schedule mockup) R8 R9 R10 R11 R12; separate booking page with R13.
- **Shop / bakery / restaurant**: R1 R2 R3 R4 R5 R6 R8 R10 R11 R12; order page with R13.
- **SaaS / agency**: R1 R2 R3 R4 R7(dashboard mockup) R6 R8 R9 R10 R11 R12.
- Inner pages (about, contact, services): R1, a short hero (eyebrow + h1 + lead + image), 3+ recipes from the list, R11, R12.

## Bland = fail (any one of these means rewrite the section)
- Two plain white/canvas sections next to each other.
- A card with only text (no icon, image, number or badge).
- A section that is only a heading and a paragraph.
- A hero without an image or mockup, or with a centred text-only layout.
- Default framework look: unstyled Bootstrap `.card`, blue `btn-primary` (#0D6EFD), grey borders only.
- Fewer than 3 depth cues on the page (shadow, gradient, overlap, floating chip, blur).
- Lists or cards typed by hand in HTML instead of rendered from data.js.
- Generic copy: "Welcome to our website", "Feature 1", "Lorem ipsum", "Our services".
