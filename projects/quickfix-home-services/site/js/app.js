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

  renderHeroStats() {
    const ul = document.getElementById("hero-stats"); if (!ul) return;
    heroStats.forEach(s => { const li = App.el("li"); li.append(App.el("p", "font-mono text-3xl font-medium text-brand-900", s.value), App.el("p", "text-sm text-ink-600", s.label)); ul.append(li); });
  },

  renderFilter() {
    const wrap = document.getElementById("product-filter"); if (!wrap) return;
    ["All", ...new Set(products.map(p => p.category))].forEach((c, i) => {
      const b = App.el("button", "filter-pill", c); b.type = "button"; b.setAttribute("aria-pressed", String(i === 0));
      b.addEventListener("click", () => { wrap.querySelectorAll("button").forEach(x => x.setAttribute("aria-pressed", "false")); b.setAttribute("aria-pressed", "true"); App.renderProducts(c); });
      wrap.append(b);
    });
  },

  renderSteps() {
    const ol = document.getElementById("steps"); if (!ol) return;
    steps.forEach((s, i) => {
      const li = App.el("li", "card text-center");
      const num = App.el("span", "mx-auto grid h-12 w-12 place-items-center rounded-full bg-brand-700 font-mono text-lg font-medium text-white", String(i + 1).padStart(2, "0"));
      const tile = App.el("div", "icon-tile mx-auto mt-4"); tile.append(App.icon(s.icon));
      li.append(num, tile, App.el("h3", "mt-4 font-display text-lg font-bold", s.title), App.el("p", "mt-2 text-ink-600", s.text));
      ol.append(li);
    });
  },

  renderTestimonials() {
    const grid = document.getElementById("testimonial-grid"); if (!grid) return;
    testimonials.forEach(t => {
      const card = App.el("figure", "rounded-xl2 border border-white/10 bg-white/5 p-6");
      const stars = App.el("div", "flex gap-1 text-accent-500"); stars.setAttribute("aria-label", `${t.rating} out of 5 stars`);
      for (let i = 0; i < t.rating; i++) stars.append(App.icon("star", "fill-current"));
      const who = App.el("figcaption", "mt-6 flex items-center gap-3");
      const img = document.createElement("img"); img.src = t.avatar; img.alt = ""; img.width = 48; img.height = 48; img.loading = "lazy"; img.className = "h-12 w-12 rounded-full object-cover";
      const meta = App.el("div"); meta.append(App.el("p", "font-semibold text-white", t.name), App.el("p", "text-sm text-white/60", t.role));
      who.append(img, meta);
      card.append(stars, App.el("blockquote", "mt-4 text-white/85", `“${t.text}”`), who);
      grid.append(card);
    });
  },

  renderFaq() {
    const wrap = document.getElementById("faq"); if (!wrap) return;
    faqs.forEach((f, i) => {
      const item = App.el("div");
      const btn = App.el("button", "faq-btn"); btn.type = "button"; btn.id = `faq-b${i}`; btn.setAttribute("aria-controls", `faq-p${i}`); btn.setAttribute("aria-expanded", "false");
      btn.append(App.el("span", "", f.q), App.icon("chevron-down", "faq-chevron"));
      const panel = App.el("div", "px-6 pb-5 text-ink-600", f.a); panel.id = `faq-p${i}`; panel.hidden = true; panel.setAttribute("role", "region"); panel.setAttribute("aria-labelledby", btn.id);
      btn.addEventListener("click", () => {
        const open = btn.getAttribute("aria-expanded") === "true";
        wrap.querySelectorAll(".faq-btn").forEach(b => { b.setAttribute("aria-expanded", "false"); document.getElementById(b.getAttribute("aria-controls")).hidden = true; });
        if (!open) { btn.setAttribute("aria-expanded", "true"); panel.hidden = false; }
      });
      item.append(btn, panel); wrap.append(item);
    });
  },

  STORE_KEY: "quickfix:records",
  load() { try { return JSON.parse(localStorage.getItem(App.STORE_KEY)) || []; } catch { return []; } },
  save(list) { try { localStorage.setItem(App.STORE_KEY, JSON.stringify(list)); } catch { } },

  initForm() {
    const form = document.getElementById("booking-form"); if (!form) return;
    form.addEventListener("submit", e => {
      e.preventDefault();
      let ok = true;
      form.querySelectorAll("[required]").forEach(input => {
        const err = input.parentElement.querySelector(".field-error");
        const valid = input.checkValidity();
        input.classList.toggle("is-invalid", !valid); input.setAttribute("aria-invalid", String(!valid));
        if (err) { err.hidden = valid; err.textContent = valid ? "" : (input.dataset.error || "Please fill in this field."); }
        if (!valid) ok = false;
      });
      if (!ok) { form.querySelector(".is-invalid")?.focus(); return; }
      const record = Object.fromEntries(new FormData(form)); record.id = crypto.randomUUID(); record.createdAt = new Date().toISOString();
      App.save([record, ...App.load()]);
      form.reset(); App.toast(form.dataset.success || "Thanks! We received your request.");
    });
  },

  init() {
    App.initMenu(); App.renderHeroStats(); App.renderBento(); App.renderFilter(); App.renderProducts();
    App.renderSteps(); App.renderTestimonials(); App.renderFaq(); App.initForm();
    const y = document.getElementById("year"); if (y) y.textContent = new Date().getFullYear();
    App.refreshIcons();
  }
};
document.addEventListener("DOMContentLoaded", App.init);
