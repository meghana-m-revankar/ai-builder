# 10 Design and Images (short reminder)

Full rules are in 01 Design System, 15 Hero, Sections and 3D, and 17 Themes. This file only repeats the essentials.

## Styling
- Tailwind CSS via CDN is the default. Do NOT use Bootstrap unless the request asks for it.
- Mobile-first: base classes for phones, then `sm:` `md:` `lg:` for larger screens.
- Fonts come from the chosen theme in 17 Themes (default: Plus Jakarta Sans headings + Inter body).
- One accent colour for the main call to action, generous white space, rounded-2xl cards, soft shadows, hover and focus states on every button and link.
- Icons: always Lucide.

## Images
- Use ONLY: `https://picsum.photos/seed/<project>-<2-4 descriptive words>/<width>/<height>` (the words are swapped for a matching real photo later).
- The words must describe what the photo shows, e.g. `.../seed/bloom-red-rose-bouquet/800/600`.
- Every image uses DIFFERENT words. Never use Unsplash, local or other image links.
- Do not use these words in the seed (they are ignored): img, image, photo, hero, banner, card, thumb, bg, cat, category, prod, product, item, main, custom, about, section, gallery, avatar, team, new, default, placeholder, large, small.
- Every `<img>` has descriptive alt text, explicit width/height, `loading="lazy"` except the hero.

## Must work
- No dead links, no `#` placeholders, no empty sections, no lorem ipsum.
- Hamburger menu on phones; every button does something; forms validate and show a success message.
- Back-to-top button and subtle scroll-reveal (disabled under `prefers-reduced-motion`).

## Business details
Never invent them. Follow the honesty rule in 00 Start Here and the Sample table in 02b Site Defaults.
