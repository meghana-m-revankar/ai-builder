# 15 Hero, Sections and 3D

How to build heroes and content sections, choose layouts, and use 3D without hurting speed or usability.

## A. Design direction
The direction applies to the **whole website**: every page follows it.

| Direction | What it means for the whole site |
|---|---|
| **2D Modern** (default) | Clean, minimal, elegant type, smooth hover and scroll-reveal micro-interactions, fast. No WebGL on any page. |
| **3D Interactive** | Every page has a **3D look and feel**: (1) depth styling everywhere, using layered cards, CSS `perspective` tilt on cards (desktop only), parallax layers and scroll-triggered depth reveals, all CSS + IntersectionObserver; (2) a **real 3D scene (WebGL) in 1-2 sections per page**, normally the page hero plus at most one more (product showcase, property walkthrough, gallery). The home page gets the richest scene; inner pages get a lighter hero scene. |
| **Mixed** | The brief lists a mode for each section (e.g. "Hero: 3D, everything else: 2D"). Follow it exactly. A section without a mode uses the website's direction. |

Users can override any single section (2D ↔ 3D) without losing content, because both versions share the same HTML (rule 3 below).

## B. 3D rules (MUST)
1. **At most 2 WebGL sections per page**, on any page. A 3D Interactive site gets 3D depth styling on every page, but never WebGL in every section. Usability and speed come first.
2. **Always 2D**: navigation, footer, forms, checkout, FAQ, testimonials, reviews, team, blog, pricing tables.
3. **Same content both ways**: a 3D section has the same heading, text, buttons and images as its 2D version. Write the 2D version in the HTML first; the 3D scene is an enhancement layered behind or beside it.
4. **Mark it**: `<section data-variant="3d" data-scene="orbit|product|walkthrough|particles">`. The 2D fallback is the section's normal HTML.
5. **Load late**: never load three.js in `<head>`. Load it with a dynamic `import()` only when the section is near the viewport (IntersectionObserver, `rootMargin: "200px"`).
6. **Fall back to 2D automatically** when any of these is true: screen narrower than 768px, `prefers-reduced-motion: reduce`, `navigator.connection.saveData` or effective type `2g`/`3g`, `navigator.hardwareConcurrency <= 4`, WebGL not available.
7. **Budget**: one canvas per 3D section, pixel ratio capped at 1.5, no shadows, stop the render loop when the section is off-screen.
8. **Never block reading**: text stays above the canvas (`position: relative; z-index: 1`), contrast ≥ 4.5:1 over the scene, the canvas has `aria-hidden="true"`.

Allowed 3D source (static sites):
```html
<script type="importmap">{"imports":{"three":"https://cdn.jsdelivr.net/npm/three@0.169.0/build/three.module.js"}}</script>
```
Scene types (`data-scene`):
| Scene | What it shows | Use for |
|---|---|---|
| `product` | the section's product photo as a floating 3D card (thickness, soft shadow, turns towards the pointer) | e-commerce hero, featured product, tech shop items |
| `laptop` | a 3D laptop with the section's image as its screen | SaaS, hosting, IT services, web agencies (screenshot / dashboard image) |
| `phone` | a 3D phone with the section's image as its screen | mobile apps, app products, booking apps |
| `model` + `data-model="<.glb url>"` | the client's real 3D model (Blender export), auto-centred and turning | when the brief / media library gives a `.glb` |
| `orbit`, `particles`, `walkthrough` | abstract background scenes | tech heroes, agencies, real estate |

For `product`, `laptop` and `phone`, put the image inside its own frame element (`<div class="relative aspect-[4/3]"><img data-product …></div>`, or `data-screen` for device screenshots). The 3D version replaces the image in exactly that frame, and the image remains the 2D fallback. Do not load external 3D models unless the brief provides a `.glb` file.

## B2. Studio Motion direction (award-style)
For agencies, portfolios, creative studios and premium brands. It uses the same 3D rules plus motion attributes, handled by the motion kit (GSAP + ScrollTrigger + Lenis, loaded only for this direction):
| Attribute | Effect |
|---|---|
| `data-split` on an h1/h2 with plain text | words slide up line by line |
| `data-reveal` | block fades and rises in |
| `data-pin` on a section, `data-pin-step` on its children | section pins and steps animate in while scrolling (desktop) |
| `data-speed="0.15"` on an image | parallax |
| `data-marquee` on a wrapper with one child `<span>` | infinite scrolling strip (clients, services) |
| `data-magnetic` on buttons | button pulls towards the cursor |
| `data-hover-zoom` on case-study / product cards | image zoom on hover |
| `data-cursor` on `<body>` (added automatically) | custom cursor that grows over links |
| `<div data-preloader>Brand</div>` first in `<main>` (optional) | short branded intro |

Use oversized type (`text-6xl md:text-8xl`), generous space, one bold accent, big case-study images, and at most one marquee and one pinned section per page. All motion turns off for reduced motion, touch devices (pointer effects) and slow connections, and every piece of content is readable without it.

## C. Hero / banner types
Pick the one the brief asks for; otherwise the industry default from 14 Industries.

| Type | Layout | Best for |
|---|---|---|
| Full-width image | full-bleed photo, dark gradient overlay, text bottom-left or centred | restaurants, hotels, real estate |
| Split-screen | text left, image/mockup right (stack on mobile, image after text) | SaaS, agencies, services |
| Video background | muted, looped, `playsinline`, poster image, under 4 MB; poster only on mobile and reduced-motion | hospitality, events, real estate |
| Gradient | brand gradient or blurred colour blobs, big type, product chip | tech, startups |
| Animated | headline words reveal, subtle floating shapes (CSS only) | agencies, creative |
| 3D interactive | 2D hero content + 3D scene behind/right (rules in B) | tech, e-commerce, real estate |
| Product showcase | large product image on a plinth or soft background, price + "Shop now" | e-commerce |
| Minimal typography | huge headline, one line, one button, lots of space | law, consulting, portfolios |

Every hero has: one `<h1>`, one supporting line (max 25 words), 1-2 buttons (primary + secondary), and on mobile the text comes first and fits without zooming. Options the brief may set: text placement (left / centre / bottom), CTA style (solid / outline / pill / with arrow icon), background colour, animation style (none / fade / reveal / parallax), separate mobile image.

## D. Section library and layouts
| Section | Layouts allowed |
|---|---|
| Image gallery | 3 or 4 columns, masonry, carousel (with lightbox on click) |
| Video gallery | 2 or 3 columns of poster + play button; video loads on click |
| Image + text | split 50/50, alternating left/right, image overlapping a tinted card |
| Product showcase | 2/3/4-column grid, carousel on mobile |
| Testimonials / reviews | 3 cards, carousel, single large quote |
| Team | 3 or 4 columns, photo or initials avatar |
| Portfolio / featured projects | masonry, 2-column large cards, filterable grid |
| Blog / articles | featured + 3 grid, list |
| Stats / achievements | 3-4 numbers in a band (given numbers only) |
| FAQ | accordion with `<details>`, 1 or 2 columns |
| Client logos | single row (wraps), greyscale, colour on hover |
| Social feed | 3x2 image grid linking to the given profile (never fake posts) |

Grid rules: mobile 1 column (2 for small tiles like logos/gallery thumbnails), tablet 2, desktop the chosen 3/4. Cards in a row have equal height. Carousels have visible prev/next buttons (44px), swipe on touch, and never auto-play faster than 5 s.

## E. Motion (2D)
- 150-300 ms ease-out on hover/focus; cards lift 2-4px; images zoom 1.04.
- Scroll reveal: fade + 16-24px rise, once, staggered 60-80 ms. Disabled under `prefers-reduced-motion`.
- No infinite animations except a slow (≥ 8 s) background gradient drift in heroes.
- No animation libraries for static sites; CSS + IntersectionObserver only.
