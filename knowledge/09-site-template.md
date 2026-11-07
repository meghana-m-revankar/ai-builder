# 09 Site Template (Bootstrap, landing page)

Start every marketing site from this template. Keep the structure, class names and quality; replace every text, colour token, image seed and data item for the project. For Tailwind or plain CSS, keep the same sections and rebuild the classes in that approach. For dashboards, keep the head, tokens, data-driven rendering and footer, and swap the body for the sidebar + KPI layout from 01 Design System.

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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
</head>
<body>
  <a class="skip-link" href="#main">Skip to content</a>

  <header class="site-header sticky-top">
    <nav class="navbar navbar-expand-lg" aria-label="Main">
      <div class="container">
        <a class="navbar-brand brand" href="index.html"><img src="assets/logo.svg" alt="Golden Crust Bakery logo" width="36" height="36"><span>Golden Crust</span></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav" aria-controls="nav" aria-expanded="false" aria-label="Open menu"><i class="bi bi-list" aria-hidden="true"></i></button>
        <div class="collapse navbar-collapse" id="nav">
          <ul class="navbar-nav ms-auto align-items-lg-center gap-lg-2">
            <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.html">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="menu.html">Menu</a></li>
            <li class="nav-item"><a class="nav-link" href="about.html">Our story</a></li>
            <li class="nav-item"><a class="nav-link" href="contact.html">Visit us</a></li>
            <li class="nav-item"><a class="btn btn-accent" href="order.html"><i class="bi bi-bag-check" aria-hidden="true"></i> Pre-order</a></li>
          </ul>
        </div>
      </div>
    </nav>
  </header>

  <main id="main">
    <section class="hero">
      <div class="container">
        <div class="row align-items-center g-5">
          <div class="col-lg-6">
            <span class="eyebrow"><i class="bi bi-fire" aria-hidden="true"></i> Baked fresh at 5 am</span>
            <h1 class="hero__title">Slow-fermented bread, baked every morning in Dubai</h1>
            <p class="hero__lead">48-hour sourdough, buttery viennoiserie and seasonal cakes. Order by 8 pm, pick up warm the next morning.</p>
            <div class="d-flex flex-wrap gap-3">
              <a class="btn btn-accent btn-lg" href="order.html"><i class="bi bi-bag-check" aria-hidden="true"></i> Order for pickup</a>
              <a class="btn btn-outline-brand btn-lg" href="menu.html">See the menu</a>
            </div>
            <ul class="hero__proof" id="hero-stats"></ul>
          </div>
          <div class="col-lg-6">
            <div class="hero__media">
              <img src="https://picsum.photos/seed/golden-crust-hero/1200/900" alt="Fresh sourdough loaves on a wooden counter" width="1200" height="900">
              <div class="hero__badge"><i class="bi bi-star-fill" aria-hidden="true"></i><div><strong>4.9</strong><span>1,200+ reviews</span></div></div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="section" id="features" aria-labelledby="features-title">
      <div class="container">
        <div class="section__head"><span class="eyebrow">Why Golden Crust</span><h2 id="features-title">Made slowly, the traditional way</h2></div>
        <div class="row g-4" id="feature-grid"></div>
      </div>
    </section>

    <section class="section section--tint" aria-labelledby="products-title">
      <div class="container">
        <div class="section__head d-flex flex-wrap justify-content-between align-items-end gap-3">
          <div><span class="eyebrow">Best sellers</span><h2 id="products-title">Today's favourites</h2></div>
          <div class="filter" role="group" aria-label="Filter by category" id="product-filter"></div>
        </div>
        <div class="row g-4" id="product-grid"></div>
      </div>
    </section>

    <section class="section" aria-labelledby="steps-title">
      <div class="container">
        <div class="section__head text-center"><span class="eyebrow">How it works</span><h2 id="steps-title">Warm bread in three steps</h2></div>
        <ol class="steps" id="steps"></ol>
      </div>
    </section>

    <section class="section section--dark" aria-labelledby="reviews-title">
      <div class="container">
        <div class="section__head"><span class="eyebrow">Reviews</span><h2 id="reviews-title">Loved across Dubai</h2></div>
        <div class="row g-4" id="testimonial-grid"></div>
      </div>
    </section>

    <section class="section" aria-labelledby="faq-title">
      <div class="container narrow">
        <div class="section__head text-center"><span class="eyebrow">FAQ</span><h2 id="faq-title">Good to know</h2></div>
        <div class="accordion" id="faq"></div>
      </div>
    </section>

    <section class="cta">
      <div class="container cta__inner">
        <div><h2>Tomorrow's bake is filling up</h2><p>Order by 8 pm for pickup from 7 am.</p></div>
        <a class="btn btn-light btn-lg" href="order.html"><i class="bi bi-arrow-right-circle" aria-hidden="true"></i> Pre-order now</a>
      </div>
    </section>
  </main>

  <footer class="site-footer">
    <div class="container">
      <div class="row g-4">
        <div class="col-lg-4"><a class="brand brand--light" href="index.html"><img src="assets/logo.svg" alt="" width="32" height="32"><span>Golden Crust</span></a><p>Artisan bakery, Al Wasl Road, Dubai.</p>
          <div class="social"><a href="https://instagram.com" aria-label="Instagram"><i class="bi bi-instagram" aria-hidden="true"></i></a><a href="https://facebook.com" aria-label="Facebook"><i class="bi bi-facebook" aria-hidden="true"></i></a><a href="https://wa.me/971501234567" aria-label="WhatsApp"><i class="bi bi-whatsapp" aria-hidden="true"></i></a></div></div>
        <div class="col-6 col-lg-2"><h3>Bakery</h3><ul><li><a href="menu.html">Menu</a></li><li><a href="about.html">Our story</a></li></ul></div>
        <div class="col-6 col-lg-2"><h3>Order</h3><ul><li><a href="order.html">Pre-order</a></li><li><a href="contact.html">Catering</a></li></ul></div>
        <div class="col-lg-4"><h3>Visit</h3><p><i class="bi bi-clock" aria-hidden="true"></i> Daily 7:00-21:00<br><i class="bi bi-telephone" aria-hidden="true"></i> +971 4 123 4567</p></div>
      </div>
      <p class="site-footer__legal">© <span id="year"></span> Golden Crust Bakery</p>
    </div>
  </footer>

  <div class="toast-container position-fixed bottom-0 end-0 p-3"><div id="toast" class="toast" role="status" aria-live="polite"><div class="toast-body" id="toast-text"></div></div></div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous" defer></script>
  <script src="js/data.js" defer></script>
  <script src="js/app.js" defer></script>
</body>
</html>
```

## site/css/style.css
```css
:root {
  --brand-900: #3B1F0E; --brand-700: #7A3E12; --brand-500: #B8661E; --brand-100: #F8EBDD;
  --accent-500: #E8A33D; --surface: #FFFFFF; --canvas: #FFFBF6; --ink-900: #1F140C; --ink-600: #6B5B4E; --line: #EADFD3;
  --font-display: "Plus Jakarta Sans", system-ui, sans-serif; --font-body: "Inter", system-ui, sans-serif; --font-mono: "JetBrains Mono", ui-monospace, monospace;
  --radius-sm: 8px; --radius: 12px; --radius-lg: 20px;
  --shadow: 0 1px 2px rgba(31,20,12,.06), 0 12px 32px rgba(31,20,12,.08);
  --bs-primary: var(--brand-700); --bs-body-font-family: var(--font-body); --bs-body-color: var(--ink-900); --bs-body-bg: var(--canvas);
}
body { font-family: var(--font-body); color: var(--ink-900); background: var(--canvas); line-height: 1.6; }
h1, h2, h3, .brand { font-family: var(--font-display); letter-spacing: -0.02em; text-wrap: balance; }
h2 { font-size: clamp(1.75rem, 2.5vw + 1rem, 2.5rem); font-weight: 800; }
.skip-link { position: absolute; left: -999px; } .skip-link:focus { left: 16px; top: 16px; z-index: 2000; background: var(--surface); padding: 8px 12px; border-radius: var(--radius-sm); }
.site-header { background: rgba(255,251,246,.85); backdrop-filter: blur(12px); border-bottom: 1px solid var(--line); }
.brand { display: inline-flex; align-items: center; gap: 10px; font-weight: 800; color: var(--brand-900); text-decoration: none; }
.nav-link { font-weight: 500; color: var(--ink-600); } .nav-link.active, .nav-link:hover { color: var(--brand-700); }
.btn { border-radius: var(--radius-sm); font-weight: 600; display: inline-flex; align-items: center; gap: 8px; min-height: 44px; }
.btn-accent { background: var(--accent-500); color: var(--brand-900); border: 0; } .btn-accent:hover { filter: brightness(.95); transform: translateY(-1px); }
.btn-outline-brand { border: 1.5px solid var(--brand-700); color: var(--brand-700); } .btn-outline-brand:hover { background: var(--brand-700); color: #fff; }
.eyebrow { display: inline-flex; gap: 6px; align-items: center; font-size: .75rem; font-weight: 700; letter-spacing: .08em; text-transform: uppercase; color: var(--brand-500); margin-bottom: 12px; }
.hero { padding: clamp(48px, 8vw, 112px) 0; background: radial-gradient(60% 60% at 90% 10%, var(--brand-100), transparent 70%), var(--canvas); }
.hero__title { font-size: clamp(2.25rem, 4vw + 1rem, 3.75rem); font-weight: 800; line-height: 1.08; margin-bottom: 20px; }
.hero__lead { font-size: 1.125rem; color: var(--ink-600); max-width: 52ch; margin-bottom: 28px; }
.hero__proof { display: flex; flex-wrap: wrap; gap: 28px; list-style: none; padding: 0; margin: 36px 0 0; }
.hero__proof strong { display: block; font-family: var(--font-display); font-size: 1.5rem; color: var(--brand-900); }
.hero__media { position: relative; } .hero__media img { width: 100%; height: auto; aspect-ratio: 4 / 3; object-fit: cover; border-radius: var(--radius-lg); box-shadow: var(--shadow); }
.hero__badge { position: absolute; left: -16px; bottom: 24px; display: flex; gap: 10px; align-items: center; background: var(--surface); padding: 12px 16px; border-radius: var(--radius); box-shadow: var(--shadow); }
.hero__badge i { color: var(--accent-500); font-size: 1.5rem; } .hero__badge span { display: block; font-size: .8rem; color: var(--ink-600); }
.section { padding: clamp(64px, 8vw, 96px) 0; } .section--tint { background: var(--brand-100); } .section--dark { background: var(--brand-900); color: #fff; }
.section__head { margin-bottom: 40px; } .narrow { max-width: 800px; }
.feature { height: 100%; background: var(--surface); border: 1px solid var(--line); border-radius: var(--radius); padding: 28px; transition: transform .2s, box-shadow .2s; }
.feature:hover { transform: translateY(-2px); box-shadow: var(--shadow); }
.feature__icon { width: 52px; height: 52px; display: grid; place-items: center; border-radius: 14px; background: var(--brand-100); color: var(--brand-700); font-size: 1.5rem; margin-bottom: 16px; }
.product { height: 100%; background: var(--surface); border-radius: var(--radius); overflow: hidden; box-shadow: var(--shadow); display: flex; flex-direction: column; }
.product img { width: 100%; aspect-ratio: 4 / 3; object-fit: cover; } .product__body { padding: 20px; display: flex; flex-direction: column; gap: 8px; flex: 1; }
.product__price { font-family: var(--font-mono); font-weight: 500; color: var(--brand-700); font-size: 1.125rem; }
.badge-soft { background: var(--brand-100); color: var(--brand-700); font-weight: 600; border-radius: 999px; padding: 4px 10px; font-size: .75rem; align-self: flex-start; }
.filter .btn { min-height: 36px; border-radius: 999px; } .filter .btn.active { background: var(--brand-700); color: #fff; }
.steps { list-style: none; padding: 0; display: grid; gap: 24px; grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); counter-reset: step; }
.steps li { background: var(--surface); border: 1px solid var(--line); border-radius: var(--radius); padding: 28px; counter-increment: step; }
.steps li::before { content: counter(step); display: grid; place-items: center; width: 40px; height: 40px; border-radius: 50%; background: var(--accent-500); color: var(--brand-900); font-weight: 800; margin-bottom: 14px; }
.review { height: 100%; background: rgba(255,255,255,.06); border: 1px solid rgba(255,255,255,.12); border-radius: var(--radius); padding: 24px; }
.review__stars { color: var(--accent-500); } .review__person { display: flex; gap: 12px; align-items: center; margin-top: 16px; } .review__person img { border-radius: 50%; }
.cta { background: linear-gradient(120deg, var(--brand-700), var(--brand-500)); color: #fff; padding: 56px 0; }
.cta__inner { display: flex; flex-wrap: wrap; gap: 24px; justify-content: space-between; align-items: center; }
.site-footer { background: var(--brand-900); color: rgba(255,255,255,.75); padding: 64px 0 24px; }
.site-footer h3 { font-size: .8rem; text-transform: uppercase; letter-spacing: .08em; color: #fff; } .site-footer ul { list-style: none; padding: 0; } .site-footer a { color: rgba(255,255,255,.75); text-decoration: none; }
.brand--light { color: #fff; } .social { display: flex; gap: 12px; font-size: 1.25rem; } .site-footer__legal { border-top: 1px solid rgba(255,255,255,.12); margin-top: 40px; padding-top: 20px; font-size: .85rem; }
:focus-visible { outline: 3px solid var(--brand-500); outline-offset: 2px; }
@media (prefers-reduced-motion: reduce) { * { transition: none !important; animation: none !important; } }
```

## site/js/app.js (pattern: render everything from data.js)
```js
"use strict";
const App = {
  el(tag, className, text) { const n = document.createElement(tag); if (className) n.className = className; if (text != null) n.textContent = text; return n; },
  icon(name) { const i = document.createElement("i"); i.className = `bi ${name}`; i.setAttribute("aria-hidden", "true"); return i; },
  renderFeatures() {
    const grid = document.getElementById("feature-grid"); if (!grid) return;
    features.forEach(f => {
      const col = App.el("div", "col-12 col-md-6 col-lg-4"); const card = App.el("article", "feature");
      const ic = App.el("div", "feature__icon"); ic.append(App.icon(f.icon));
      card.append(ic, App.el("h3", "h5", f.title), App.el("p", "mb-0 text-secondary", f.text)); col.append(card); grid.append(col);
    });
  },
  renderProducts(category = "All") {
    const grid = document.getElementById("product-grid"); if (!grid) return; grid.replaceChildren();
    const list = products.filter(p => category === "All" || p.category === category);
    if (!list.length) { grid.append(App.el("p", "text-center", "No products in this category yet.")); return; }
    list.forEach(p => {
      const col = App.el("div", "col-12 col-sm-6 col-lg-3"); const card = App.el("article", "product");
      const img = document.createElement("img"); img.src = p.image; img.alt = p.name; img.loading = "lazy"; img.width = 800; img.height = 600;
      const body = App.el("div", "product__body");
      if (p.badge) body.append(App.el("span", "badge-soft", p.badge));
      body.append(App.el("h3", "h6 mb-0", p.name), App.el("span", "product__price", `${p.currency} ${p.price}`));
      card.append(img, body); col.append(card); grid.append(col);
    });
  },
  init() {
    App.renderFeatures(); App.renderProducts();
    const y = document.getElementById("year"); if (y) y.textContent = new Date().getFullYear();
  }
};
document.addEventListener("DOMContentLoaded", App.init);
```
Follow the same pattern for stats, filters, steps, testimonials, FAQ (Bootstrap accordion), forms (validation + localStorage + toast) and delete (modal + toast).
