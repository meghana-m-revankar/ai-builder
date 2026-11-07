# 09 Site Template (Tailwind + Lucide, landing page)

Start every site from this template. Keep the structure, the quality level and the data-driven rendering; replace every text, colour token, image seed and data item for the project. If the brief asks for Bootstrap or plain CSS, keep the same sections and rebuild the classes in that approach. For dashboards, keep the head, tokens, rendering helpers and footer, and swap the body for the sidebar + KPI layout from 01 Design System.

## site/js/tailwind.config.js
```js
tailwind.config = {
  theme: {
    extend: {
      colors: {
        brand: { 900: "#3B1F0E", 700: "#7A3E12", 500: "#B8661E", 100: "#F8EBDD" },
        accent: { 500: "#E8A33D" },
        ink: { 900: "#1F140C", 600: "#6B5B4E" },
        canvas: "#FFFBF6",
        line: "#EADFD3"
      },
      fontFamily: {
        display: ['"Plus Jakarta Sans"', "system-ui", "sans-serif"],
        body: ["Inter", "system-ui", "sans-serif"],
        mono: ['"JetBrains Mono"', "ui-monospace", "monospace"]
      },
      boxShadow: { soft: "0 1px 2px rgba(31,20,12,.06), 0 12px 32px rgba(31,20,12,.08)" },
      borderRadius: { xl2: "20px" }
    }
  }
};
```

## site/index.html
```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Golden Crust Bakery | Artisan bread and pastries in Dubai</title>
  <meta name="description" content="Slow-fermented sourdough and French pastries baked every morning in Dubai. Pre-order online for pickup.">
  <meta property="og:title" content="Golden Crust Bakery">
  <meta property="og:description" content="Artisan bread and pastries in Dubai.">
  <link rel="icon" href="assets/logo.svg" type="image/svg+xml">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400;500&family=Plus+Jakarta+Sans:wght@500;600;700;800&display=swap" rel="stylesheet">
  <script src="https://cdn.tailwindcss.com/3.4.17"></script>
  <script src="js/tailwind.config.js"></script>
  <link href="css/style.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/lucide@0.469.0/dist/umd/lucide.min.js" defer></script>
</head>
<body class="bg-canvas font-body text-ink-900 antialiased">
  <a href="#main" class="sr-only focus:not-sr-only focus:fixed focus:left-4 focus:top-4 focus:z-50 focus:rounded-lg focus:bg-white focus:px-3 focus:py-2">Skip to content</a>

  <header class="sticky top-0 z-40 border-b border-line bg-canvas/80 backdrop-blur-md">
    <nav class="mx-auto flex max-w-6xl items-center justify-between px-4 py-3 sm:px-6" aria-label="Main">
      <a href="index.html" class="flex items-center gap-2.5 font-display text-lg font-extrabold text-brand-900">
        <img src="assets/logo.svg" alt="Golden Crust Bakery logo" width="36" height="36"><span>Golden Crust</span>
      </a>
      <ul id="nav-menu" class="hidden items-center gap-1 lg:flex">
        <li><a href="index.html" aria-current="page" class="nav-link nav-link--active">Home</a></li>
        <li><a href="menu.html" class="nav-link">Menu</a></li>
        <li><a href="about.html" class="nav-link">Our story</a></li>
        <li><a href="contact.html" class="nav-link">Visit us</a></li>
      </ul>
      <div class="flex items-center gap-2">
        <a href="order.html" class="btn btn-accent hidden sm:inline-flex"><i data-lucide="shopping-bag" aria-hidden="true"></i> Pre-order</a>
        <button id="menu-toggle" type="button" class="btn-icon lg:hidden" aria-controls="mobile-menu" aria-expanded="false" aria-label="Open menu"><i data-lucide="menu" aria-hidden="true"></i></button>
      </div>
    </nav>
    <div id="mobile-menu" class="hidden border-t border-line px-4 pb-4 lg:hidden">
      <a href="index.html" class="block rounded-lg px-3 py-3 font-medium text-brand-700">Home</a>
      <a href="menu.html" class="block rounded-lg px-3 py-3 font-medium text-ink-600">Menu</a>
      <a href="about.html" class="block rounded-lg px-3 py-3 font-medium text-ink-600">Our story</a>
      <a href="contact.html" class="block rounded-lg px-3 py-3 font-medium text-ink-600">Visit us</a>
      <a href="order.html" class="btn btn-accent mt-2 w-full justify-center">Pre-order</a>
    </div>
  </header>

  <main id="main">
    <!-- Hero: headline + CTA left, image with floating chips right -->
    <section class="hero-glow relative overflow-hidden">
      <div class="mx-auto grid max-w-6xl items-center gap-12 px-4 py-16 sm:px-6 lg:grid-cols-2 lg:py-28">
        <div>
          <span class="eyebrow"><i data-lucide="flame" aria-hidden="true"></i> Baked fresh at 5 am</span>
          <h1 class="mt-4 font-display text-4xl font-extrabold leading-tight tracking-tight text-balance sm:text-5xl lg:text-6xl">Slow-fermented bread, baked <span class="text-brand-500">every morning</span> in Dubai</h1>
          <p class="mt-5 max-w-xl text-lg text-ink-600">48-hour sourdough, buttery viennoiserie and seasonal cakes. Order by 8 pm, pick up warm the next morning.</p>
          <div class="mt-8 flex flex-wrap gap-3">
            <a href="order.html" class="btn btn-accent btn-lg"><i data-lucide="shopping-bag" aria-hidden="true"></i> Order for pickup</a>
            <a href="menu.html" class="btn btn-outline btn-lg">See the menu <i data-lucide="arrow-right" aria-hidden="true"></i></a>
          </div>
          <ul id="hero-stats" class="mt-10 flex flex-wrap gap-8"></ul>
        </div>
        <div class="relative">
          <img src="https://picsum.photos/seed/golden-crust-hero/1200/900" alt="Fresh sourdough loaves on a wooden counter" width="1200" height="900" class="aspect-[4/3] w-full rounded-xl2 object-cover shadow-soft">
          <div class="chip absolute -left-4 bottom-8"><i data-lucide="star" class="text-accent-500" aria-hidden="true"></i><div><p class="font-display font-bold">4.9 rating</p><p class="text-xs text-ink-600">1,200+ reviews</p></div></div>
          <div class="chip absolute -right-3 top-6"><i data-lucide="circle-check" class="text-green-600" aria-hidden="true"></i><p class="text-sm font-semibold">Order #2481 ready</p></div>
        </div>
      </div>
    </section>

    <!-- Bento grid: one large card + smaller ones -->
    <section class="mx-auto max-w-6xl px-4 py-20 sm:px-6" aria-labelledby="why-title">
      <span class="eyebrow">Why Golden Crust</span>
      <h2 id="why-title" class="section-title">Made slowly, the traditional way</h2>
      <div id="bento" class="mt-10 grid gap-5 md:grid-cols-3 md:grid-rows-2"></div>
    </section>

    <!-- Products from data.js with category filter -->
    <section class="bg-brand-100 py-20" aria-labelledby="products-title">
      <div class="mx-auto max-w-6xl px-4 sm:px-6">
        <div class="flex flex-wrap items-end justify-between gap-4">
          <div><span class="eyebrow">Best sellers</span><h2 id="products-title" class="section-title">Today's favourites</h2></div>
          <div id="product-filter" class="flex flex-wrap gap-2" role="group" aria-label="Filter by category"></div>
        </div>
        <div id="product-grid" class="mt-10 grid gap-6 sm:grid-cols-2 lg:grid-cols-4"></div>
      </div>
    </section>

    <section class="mx-auto max-w-6xl px-4 py-20 sm:px-6" aria-labelledby="steps-title">
      <div class="text-center"><span class="eyebrow">How it works</span><h2 id="steps-title" class="section-title">Warm bread in three steps</h2></div>
      <ol id="steps" class="mt-10 grid gap-6 md:grid-cols-3"></ol>
    </section>

    <section class="bg-brand-900 py-20 text-white" aria-labelledby="reviews-title">
      <div class="mx-auto max-w-6xl px-4 sm:px-6">
        <span class="eyebrow text-accent-500">Reviews</span><h2 id="reviews-title" class="section-title text-white">Loved across Dubai</h2>
        <div id="testimonial-grid" class="mt-10 grid gap-6 md:grid-cols-3"></div>
      </div>
    </section>

    <section class="mx-auto max-w-3xl px-4 py-20 sm:px-6" aria-labelledby="faq-title">
      <div class="text-center"><span class="eyebrow">FAQ</span><h2 id="faq-title" class="section-title">Good to know</h2></div>
      <div id="faq" class="mt-10 divide-y divide-line rounded-xl2 border border-line bg-white"></div>
    </section>

    <section class="cta-band">
      <div class="mx-auto flex max-w-6xl flex-col items-start justify-between gap-6 px-4 py-14 sm:px-6 md:flex-row md:items-center">
        <div><h2 class="font-display text-3xl font-extrabold">Tomorrow's bake is filling up</h2><p class="mt-2 text-white/80">Order by 8 pm for pickup from 7 am.</p></div>
        <a href="order.html" class="btn btn-light btn-lg w-full justify-center md:w-auto"><i data-lucide="circle-arrow-right" aria-hidden="true"></i> Pre-order now</a>
      </div>
    </section>
  </main>

  <footer class="bg-brand-900 text-white/75">
    <div class="mx-auto grid max-w-6xl gap-10 px-4 py-16 sm:px-6 md:grid-cols-2 lg:grid-cols-4">
      <div class="lg:col-span-2">
        <a href="index.html" class="flex items-center gap-2 font-display text-lg font-extrabold text-white"><img src="assets/logo.svg" alt="" width="32" height="32">Golden Crust</a>
        <p class="mt-3 max-w-sm">Artisan bakery on Al Wasl Road, Dubai. Sourdough, pastries and celebration cakes.</p>
        <div class="mt-5 flex gap-3">
          <a href="https://instagram.com" class="social-link" aria-label="Instagram"><i data-lucide="instagram" aria-hidden="true"></i></a>
          <a href="https://facebook.com" class="social-link" aria-label="Facebook"><i data-lucide="facebook" aria-hidden="true"></i></a>
          <a href="https://wa.me/971501234567" class="social-link" aria-label="WhatsApp"><i data-lucide="message-circle" aria-hidden="true"></i></a>
        </div>
      </div>
      <div><h3 class="footer-title">Bakery</h3><ul class="mt-4 space-y-2"><li><a href="menu.html" class="hover:text-white">Menu</a></li><li><a href="about.html" class="hover:text-white">Our story</a></li></ul></div>
      <div><h3 class="footer-title">Visit</h3><p class="mt-4 flex items-center gap-2"><i data-lucide="clock" aria-hidden="true"></i> Daily 7:00-21:00</p><p class="mt-2 flex items-center gap-2"><i data-lucide="phone" aria-hidden="true"></i> +971 4 123 4567</p></div>
    </div>
    <p class="mx-auto max-w-6xl border-t border-white/10 px-4 py-6 text-sm sm:px-6">© <span id="year"></span> Golden Crust Bakery</p>
  </footer>

  <div id="toast" class="toast" role="status" aria-live="polite" hidden></div>

  <script src="js/data.js" defer></script>
  <script src="js/app.js" defer></script>
</body>
</html>
```

## site/css/style.css (tokens, effects and the few shared components, plain CSS)
The Tailwind CDN does not process `@apply` in linked files, so shared components are plain CSS using the same token values as `tailwind.config.js`. Everything else is Tailwind utilities in the HTML.
```css
:root {
  --brand-900: #3B1F0E; --brand-700: #7A3E12; --brand-500: #B8661E; --brand-100: #F8EBDD;
  --accent-500: #E8A33D; --ink-900: #1F140C; --ink-600: #6B5B4E; --line: #EADFD3;
  --font-display: "Plus Jakarta Sans", system-ui, sans-serif;
  --shadow-soft: 0 1px 2px rgba(31,20,12,.06), 0 12px 32px rgba(31,20,12,.08);
}
.text-balance { text-wrap: balance; }
.hero-glow { background: radial-gradient(55% 60% at 90% 10%, var(--brand-100), transparent 70%), radial-gradient(40% 40% at 0% 100%, #FDF3E4, transparent 70%); }
.eyebrow { display: inline-flex; align-items: center; gap: 6px; font-size: .75rem; font-weight: 700; letter-spacing: .08em; text-transform: uppercase; color: var(--brand-500); }
.section-title { margin-top: 12px; font-family: var(--font-display); font-size: 1.875rem; font-weight: 800; letter-spacing: -0.02em; text-wrap: balance; }
@media (min-width: 640px) { .section-title { font-size: 2.25rem; } }
.nav-link { display: block; border-radius: 8px; padding: 8px 12px; font-weight: 500; color: var(--ink-600); transition: color .2s; }
.nav-link:hover, .nav-link--active { color: var(--brand-700); }
.btn { display: inline-flex; align-items: center; gap: 8px; min-height: 44px; padding: 0 16px; border-radius: 8px; font-weight: 600; transition: transform .2s, background-color .2s, color .2s, filter .2s; }
.btn:focus-visible, .btn-icon:focus-visible { outline: 3px solid var(--brand-500); outline-offset: 2px; }
.btn-lg { padding: 0 24px; font-size: 1rem; }
.btn-accent { background: var(--accent-500); color: var(--brand-900); }
.btn-accent:hover { transform: translateY(-2px); filter: brightness(.95); }
.btn-outline { border: 2px solid var(--brand-700); color: var(--brand-700); }
.btn-outline:hover { background: var(--brand-700); color: #fff; }
.btn-light { background: #fff; color: var(--brand-900); }
.btn-light:hover { background: var(--brand-100); }
.btn-icon { display: grid; place-items: center; width: 44px; height: 44px; border-radius: 8px; border: 1px solid var(--line); }
.chip { display: flex; align-items: center; gap: 10px; padding: 12px 16px; border-radius: 12px; background: rgba(255,255,255,.9); box-shadow: var(--shadow-soft); backdrop-filter: blur(8px); }
.card { height: 100%; border: 1px solid var(--line); border-radius: 20px; background: #fff; padding: 24px; transition: transform .2s, box-shadow .2s; }
.card:hover { transform: translateY(-2px); box-shadow: var(--shadow-soft); }
.icon-tile { display: grid; place-items: center; width: 48px; height: 48px; border-radius: 12px; background: var(--brand-100); color: var(--brand-700); }
.cta-band { background: linear-gradient(90deg, var(--brand-700), var(--brand-500)); color: #fff; }
.footer-title { font-size: .75rem; font-weight: 700; letter-spacing: .08em; text-transform: uppercase; color: #fff; }
.social-link { display: grid; place-items: center; width: 40px; height: 40px; border-radius: 999px; background: rgba(255,255,255,.1); color: #fff; transition: background-color .2s; }
.social-link:hover { background: rgba(255,255,255,.2); }
.toast { position: fixed; right: 20px; bottom: 20px; z-index: 50; padding: 12px 20px; border-radius: 12px; background: var(--ink-900); color: #fff; font-weight: 500; box-shadow: var(--shadow-soft); }
svg.lucide { width: 1.25em; height: 1.25em; stroke-width: 1.75; }
.img-zoom { transition: transform .4s ease; } .group:hover .img-zoom { transform: scale(1.04); }
@media (prefers-reduced-motion: reduce) { * { transition: none !important; animation: none !important; } }
```

## site/js/app.js (render everything from data.js)
```js
"use strict";
const App = {
  el(tag, className, text) { const n = document.createElement(tag); if (className) n.className = className; if (text != null) n.textContent = text; return n; },
  icon(name, className = "") { const i = document.createElement("i"); i.setAttribute("data-lucide", name); i.setAttribute("aria-hidden", "true"); if (className) i.className = className; return i; },
  refreshIcons() { if (window.lucide) window.lucide.createIcons(); },

  renderBento() {
    const grid = document.getElementById("bento"); if (!grid) return;
    features.forEach((f, idx) => {
      const card = App.el("article", idx === 0 ? "card group md:col-span-2 md:row-span-2 flex flex-col justify-between overflow-hidden p-0" : "card");
      if (idx === 0) {
        const img = document.createElement("img"); img.src = f.image; img.alt = f.title; img.loading = "lazy"; img.className = "img-zoom aspect-[16/9] w-full object-cover";
        const body = App.el("div", "p-6"); body.append(App.el("h3", "font-display text-2xl font-bold", f.title), App.el("p", "mt-2 text-ink-600", f.text));
        card.append(img, body);
      } else {
        const tile = App.el("div", "icon-tile"); tile.append(App.icon(f.icon));
        card.append(tile, App.el("h3", "mt-4 font-display text-lg font-bold", f.title), App.el("p", "mt-2 text-ink-600", f.text));
      }
      grid.append(card);
    });
  },

  renderProducts(category = "All") {
    const grid = document.getElementById("product-grid"); if (!grid) return; grid.replaceChildren();
    const list = products.filter(p => category === "All" || p.category === category);
    if (!list.length) { grid.append(App.el("p", "col-span-full text-center text-ink-600", "No products in this category yet.")); return; }
    list.forEach(p => {
      const card = App.el("article", "group overflow-hidden rounded-xl2 bg-white shadow-soft");
      const img = document.createElement("img"); img.src = p.image; img.alt = p.name; img.loading = "lazy"; img.width = 800; img.height = 600; img.className = "img-zoom aspect-[4/3] w-full object-cover";
      const body = App.el("div", "flex flex-col gap-2 p-5");
      if (p.badge) body.append(App.el("span", "self-start rounded-full bg-brand-100 px-2.5 py-1 text-xs font-semibold text-brand-700", p.badge));
      const row = App.el("div", "flex items-center justify-between");
      row.append(App.el("h3", "font-display font-bold", p.name), App.el("span", "font-mono font-medium text-brand-700", `${p.currency} ${p.price}`));
      body.append(row, App.el("p", "text-sm text-ink-600", p.description));
      card.append(img, body); grid.append(card);
    });
    App.refreshIcons();
  },

  initMenu() {
    const btn = document.getElementById("menu-toggle"), menu = document.getElementById("mobile-menu"); if (!btn || !menu) return;
    btn.addEventListener("click", () => { const open = menu.classList.toggle("hidden") === false; btn.setAttribute("aria-expanded", String(open)); });
  },

  toast(message) { const t = document.getElementById("toast"); if (!t) return; t.textContent = message; t.hidden = false; setTimeout(() => { t.hidden = true; }, 3000); },

  init() {
    App.initMenu(); App.renderBento(); App.renderProducts();
    const y = document.getElementById("year"); if (y) y.textContent = new Date().getFullYear();
    App.refreshIcons();
  }
};
document.addEventListener("DOMContentLoaded", App.init);
```
Follow the same pattern for hero stats, the category filter buttons, steps, testimonials (avatar, stars, quote), FAQ (button + panel with `aria-expanded`), forms (validation, `localStorage`, `App.toast`) and delete (confirm dialog + toast). Call `App.refreshIcons()` after every render.
