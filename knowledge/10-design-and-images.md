# DEFAULT DESIGN, IMAGES AND QUALITY (MUST FOLLOW)

## Styling: Tailwind CSS is the default
- Use Tailwind CSS via the CDN for every static site. Do NOT use Bootstrap unless the request asks for it.
- In every page <head>, in this order:
  <script src="https://cdn.tailwindcss.com/3.4.17"></script>
  <script>tailwind.config = { darkMode: 'class', theme: { extend: { fontFamily: { sans: ['Inter','system-ui','sans-serif'] } } } };</script>
  <link rel="stylesheet" href="css/style.css">
- Style with Tailwind utility classes. Use css/style.css only for small extras (animations, scroll behaviour).
- Mobile-first: write base classes for phones, then sm: md: lg: for larger screens.
- Dark mode: toggle the "dark" class on <html>, use dark: variants, and remember the choice.
- Design: one accent colour, plenty of white space, rounded-2xl cards, soft shadows,
  readable text sizes, hover and focus states on every button and link.
- Icons: use the Icon Pack chosen in the request. For Lucide load
  https://cdn.jsdelivr.net/npm/lucide@0.469.0/dist/umd/lucide.min.js and call lucide.createIcons().

## Images
- Use ONLY this format for every picture:
  https://picsum.photos/seed/<project>-<2-4 descriptive words>/<width>/<height>
- The words must describe what the photo shows, e.g.
  https://picsum.photos/seed/meghana-portfolio-laptop-code-desk/1600/900
- Every image uses DIFFERENT words. Never use Unsplash, local or other image links.
- Do not use these words in the seed (they are ignored): img, image, photo, hero, banner,
  card, thumb, bg, cat, category, prod, product, item, main, custom, about, section,
  gallery, avatar, team, new, default, placeholder, large, small.
- Always add alt text.

## Must work
- No dead links, no "#" placeholders, no empty sections, no lorem ipsum.
- Menu links smooth-scroll to sections; hamburger menu on phones.
- Every button does something. Forms validate and show a success message.
- Link css/style.css and js/main.js correctly from every page.
- Include a dark/light toggle, a back-to-top button and scroll-reveal animations.

## Default details (when the request gives none)
- Name: Meghana M Revankar. Title: Front-End Web Developer. Location: Bengaluru, India.
- Email: meghana@example.com
- Tagline: I turn Figma designs into fast, pixel-perfect, responsive websites.
- Skills: HTML5, CSS3, JavaScript, TypeScript, React, Tailwind CSS, Material UI, Figma
- Sample projects: Shopping Website, Analytics Dashboard, Mobile App Landing Page
