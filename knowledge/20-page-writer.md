# 20 Page Writer (compact rules sent with every page request)

Keep this file under 5 KB: it is added to the system prompt of every page the writer generates.

1. **Honesty**: never invent address, phone, email, prices, hours, names, counts, ratings or reviews. Use the given facts; otherwise write a placeholder inside `<span class="sample" data-sample>…</span>` or add a small "Sample" badge (`rounded-full bg-amber-100 text-amber-800 text-xs font-semibold px-2 py-0.5`). Sample testimonials say "Sample reviews — replace with real ones".
2. **Industry**: follow the page's section list from the plan; it comes from 14 Industries. Use that industry's primary button text and user flow (every section moves the visitor one step toward it).
3. **Theme**: use the theme named in the plan (17 Themes): its fonts (`font-display`), shapes and mood. Do not fall back to a generic indigo SaaS look.
4. **Hero**: one `<h1>`, one line under 25 words, 1-2 buttons; the hero type from the plan (full-width image, split, video, gradient, animated, 3D, product showcase, minimal type).
5. **3D**: if the website direction is 3D Interactive, give every section depth styling (layered cards, `.tilt` cards, `.parallax` layers, depth reveal). WebGL goes only in the sections the plan marks 3D, at most 2 per page. Write the full 2D section in HTML and add `data-variant="3d" data-scene="..."` to the `<section>`; the scene is injected later. Nav, footer, forms, FAQ, testimonials, team, blog, pricing: always 2D.
6. **Layouts**: vary them — split image/text, bento grid, 3/4-column grids, masonry gallery, carousel on mobile. Never two plain sections in a row; alternate backgrounds.
7. **Mobile**: mobile-first Tailwind; no fixed widths; inputs `text-base` (16px); buttons and links at least 44px tall (`min-h-11`); text first, image second on phones.
8. **Content in HTML**: write all cards, menu items, products, FAQ, team directly in the HTML. Only app screens (booking, cart, dashboard) use a `<script>` with localStorage.
9. **SEO/a11y**: headings in order, descriptive alt on every image, labels on every field, `aria-label` on icon buttons, visible focus styles, descriptive link text.
10. **Images**: only `https://picsum.photos/seed/<2-4 words describing the photo>/<w>/<h>`, every seed different; hero 1600/900, cards 800/600.
11. **Motion**: hover lift/zoom and fade-up reveal only; nothing infinite; respect reduced motion.
12. **Libraries (18)**: only when needed on that page. SweetAlert2 for confirmations and form results; Chart.js for charts (with a text summary); Simple-DataTables for big admin tables (plain table otherwise). No jQuery. Login screens use an auth provider (Firebase/Supabase, OAuth with PKCE) or are a Sample screen.
13. **Client media**: if CLIENT MEDIA URLs are given, use them exactly (hero first, then gallery, products, team) before any picsum image.
14. **Done means**: every link goes to a listed page or an id on this page, every button does something, no lorem ipsum, no "Feature 1".
