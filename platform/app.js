"use strict";
const App = {
  step: 1,
  maxStep: 4,
  logoDataUrl: "",
  timer: null,
  STORE_KEY: "ai-builder:last-job",

  el(tag, className, text) { const n = document.createElement(tag); if (className) n.className = className; if (text != null) n.textContent = text; return n; },
  icon(name, className = "") { const i = document.createElement("i"); i.setAttribute("data-lucide", name); i.setAttribute("aria-hidden", "true"); if (className) i.className = className; return i; },
  refreshIcons() { if (window.lucide) window.lucide.createIcons(); },
  slugify(s) { return s.toLowerCase().normalize("NFKD").replace(/[^\w\s-]/g, "").trim().replace(/[\s_]+/g, "-").replace(/-+/g, "-").slice(0, 60); },
  toast(msg) { const t = document.getElementById("toast"); t.textContent = msg; t.hidden = false; clearTimeout(App.toastT); App.toastT = setTimeout(() => { t.hidden = true; }, 3500); },

  /* ---------- static sections ---------- */
  renderStatic() {
    const hs = document.getElementById("hero-stats");
    heroStats.forEach(s => { const li = App.el("li"); li.append(App.el("p", "font-mono text-3xl font-medium text-brand-900", s.value), App.el("p", "text-sm text-ink-600", s.label)); hs.append(li); });

    const tr = document.getElementById("trust");
    trust.forEach(t => { const li = App.el("li", "flex items-start gap-3"); const tile = App.el("span", "icon-tile h-10 w-10"); tile.append(App.icon(t.icon)); const d = App.el("div"); d.append(App.el("p", "font-display font-bold", t.title), App.el("p", "text-sm text-ink-600", t.text)); li.append(tile, d); tr.append(li); });

    const st = document.getElementById("steps");
    steps.forEach((s, i) => { const li = App.el("li", "card"); const top = App.el("div", "flex items-center justify-between"); const tile = App.el("span", "icon-tile"); tile.append(App.icon(s.icon)); top.append(tile, App.el("span", "font-mono text-sm text-ink-600", String(i + 1).padStart(2, "0"))); li.append(top, App.el("h3", "mt-5 font-display text-lg font-bold", s.title), App.el("p", "mt-2 text-ink-600", s.text)); st.append(li); });

    const pr = document.getElementById("promises");
    promises.forEach(p => { const li = App.el("li", "flex items-start gap-3"); li.append(App.icon(p.icon, "mt-0.5 text-green-600"), App.el("span", "text-ink-900", p.text)); pr.append(li); });

    const inc = document.getElementById("included");
    included.forEach(f => { const c = App.el("article", "rounded-xl2 border border-white/10 bg-white/5 p-6"); const tile = App.el("span", "grid h-12 w-12 place-items-center rounded-xl bg-white/10 text-accent-500"); tile.append(App.icon(f.icon)); c.append(tile, App.el("h3", "mt-4 font-display text-lg font-bold text-white", f.title), App.el("p", "mt-2 text-white/75", f.text)); inc.append(c); });

    App.renderFaq();
    document.getElementById("year").textContent = new Date().getFullYear();
  },

  renderFaq() {
    const wrap = document.getElementById("faq-list");
    faqs.forEach((f, i) => {
      const item = App.el("div");
      const btn = App.el("button", "flex w-full items-center justify-between gap-4 px-6 py-5 text-left font-semibold"); btn.type = "button"; btn.id = `faq-b${i}`; btn.setAttribute("aria-expanded", "false"); btn.setAttribute("aria-controls", `faq-p${i}`);
      const chev = App.icon("chevron-down", "transition-transform");
      btn.append(App.el("span", "", f.q), chev);
      const panel = App.el("div", "px-6 pb-5 text-ink-600", f.a); panel.id = `faq-p${i}`; panel.hidden = true; panel.setAttribute("role", "region"); panel.setAttribute("aria-labelledby", btn.id);
      btn.addEventListener("click", () => {
        const open = btn.getAttribute("aria-expanded") === "true";
        wrap.querySelectorAll("button[aria-expanded]").forEach(b => { b.setAttribute("aria-expanded", "false"); document.getElementById(b.getAttribute("aria-controls")).hidden = true; b.querySelector("svg")?.classList.remove("rotate-180"); });
        if (!open) { btn.setAttribute("aria-expanded", "true"); panel.hidden = false; btn.querySelector("svg")?.classList.add("rotate-180"); }
      });
      item.append(btn, panel); wrap.append(item);
    });
  },

  /* ---------- wizard choices ---------- */
  choice({ type, name, value, label, hint, icon, swatch, checked }) {
    const lab = App.el("label", hint ? "choice choice-card" : "choice");
    const input = document.createElement("input"); input.type = type; input.name = name; input.value = value; input.checked = !!checked;
    const head = App.el("span", "flex items-center gap-2");
    if (swatch) head.append(App.el("span", `swatch swatch--${swatch}`));
    if (icon) head.append(App.icon(icon, "text-brand-700"));
    head.append(App.el("span", "font-semibold", label || value));
    lab.append(input, head);
    if (hint) lab.append(App.el("span", "text-sm text-ink-600", hint));
    return lab;
  },

  renderChoices() {
    const pc = document.getElementById("palette-choices");
    palettes.forEach((p, i) => pc.append(App.choice({ type: "radio", name: "palette", value: p.value, label: p.label, hint: p.hint, swatch: p.swatch, checked: i === 0 })));
    const ac = document.getElementById("action-choices");
    actions.forEach(a => ac.append(App.choice({ type: "checkbox", name: "actions", value: a.value, icon: a.icon })));
    const pg = document.getElementById("page-choices");
    pages.forEach(p => pg.append(App.choice({ type: "checkbox", name: "pages", value: p.value, checked: p.checked })));
    const sc = document.getElementById("scope-choices");
    scopes.forEach(s => sc.append(App.choice({ type: "radio", name: "scope", value: s.value, label: s.label, hint: s.hint, icon: s.icon, checked: s.checked })));
  },

  /* ---------- wizard navigation ---------- */
  showStep(n) {
    App.step = n;
    document.querySelectorAll(".wizard-step").forEach(fs => { fs.hidden = Number(fs.dataset.step) !== n; });
    document.querySelectorAll(".step-dot").forEach((d, i) => { d.dataset.state = i + 1 < n ? "done" : i + 1 === n ? "current" : ""; });
    const current = document.querySelector(`.wizard-step[data-step="${n}"]`);
    document.getElementById("step-label").textContent = `Step ${n} of ${App.maxStep}`;
    document.getElementById("step-name").textContent = current.dataset.name;
    document.getElementById("btn-back").hidden = n === 1;
    document.getElementById("btn-next").hidden = n === App.maxStep;
    document.getElementById("btn-submit").hidden = n !== App.maxStep;
    if (n === App.maxStep) App.renderSummary();
  },

  validateStep(n) {
    const fs = document.querySelector(`.wizard-step[data-step="${n}"]`);
    let firstBad = null;
    fs.querySelectorAll("input[required], textarea[required], input[pattern]").forEach(input => {
      const valid = input.checkValidity();
      input.classList.toggle("is-invalid", !valid); input.setAttribute("aria-invalid", String(!valid));
      const err = input.parentElement.querySelector(".field-error");
      if (err) { err.hidden = valid; err.textContent = valid ? "" : (input.dataset.error || "Please check this field."); }
      if (!valid && !firstBad) firstBad = input;
    });
    if (firstBad) { firstBad.focus(); return false; }
    return true;
  },

  initWizard() {
    document.getElementById("btn-next").addEventListener("click", () => { if (App.validateStep(App.step)) { App.showStep(App.step + 1); App.scrollToForm(); } });
    document.getElementById("btn-back").addEventListener("click", () => { App.showStep(App.step - 1); App.scrollToForm(); });
    document.getElementById("brief-form").addEventListener("submit", App.handleSubmit);
    document.getElementById("btn-new").addEventListener("click", App.resetAll);
    document.querySelectorAll(".form-input").forEach(i => i.addEventListener("input", () => { if (i.classList.contains("is-invalid") && i.checkValidity()) { i.classList.remove("is-invalid"); i.setAttribute("aria-invalid", "false"); const e = i.parentElement.querySelector(".field-error"); if (e) e.hidden = true; } }));
    document.getElementById("f-logo").addEventListener("change", App.handleLogo);
    App.showStep(1);
  },

  scrollToForm() { document.getElementById("start").scrollIntoView({ behavior: "smooth", block: "start" }); },

  handleLogo(e) {
    const file = e.target.files[0]; const err = document.getElementById("logo-error"); const prev = document.getElementById("logo-preview");
    err.hidden = true; App.logoDataUrl = "";
    if (!file) { prev.hidden = true; return; }
    if (file.size > 1024 * 1024) { err.textContent = "That file is larger than 1 MB. Please use a smaller logo."; err.hidden = false; e.target.value = ""; prev.hidden = true; return; }
    const reader = new FileReader();
    reader.onload = () => { App.logoDataUrl = String(reader.result); prev.src = App.logoDataUrl; prev.hidden = false; };
    reader.readAsDataURL(file);
  },

  collect() {
    const f = new FormData(document.getElementById("brief-form"));
    const palette = f.get("palette");
    const colours = (f.get("colours") || "").trim() || (palette === "auto" ? "" : palette);
    const name = (f.get("businessName") || "").trim();
    return {
      slug: App.slugify(name),
      businessName: name,
      description: (f.get("description") || "").trim(),
      location: (f.get("location") || "").trim(),
      logoUrl: (f.get("logoUrl") || "").trim(),
      logoDataUrl: App.logoDataUrl,
      colours,
      references: (f.get("references") || "").trim(),
      actions: f.getAll("actions"),
      pages: f.getAll("pages"),
      facts: (f.get("facts") || "").trim(),
      scope: f.get("scope") || "website",
      languages: f.get("languages") || "English",
      email: (f.get("email") || "").trim(),
      uiFramework: f.get("uiFramework") || "Tailwind",
      iconPack: f.get("iconPack") || "Lucide",
      prefix: (f.get("prefix") || "").trim(),
      submittedAt: new Date().toISOString()
    };
  },

  renderSummary() {
    const d = App.collect(); const box = document.getElementById("summary-box"); box.replaceChildren();
    box.append(App.el("p", "mb-2 font-semibold", "Quick check"));
    const rows = [["Business", d.businessName], ["Location", d.location], ["Colours", d.colours || "We choose (from logo / industry)"], ["Pages", d.pages.join(", ") || "We choose"], ["Visitors should", d.actions.join(", ") || "We choose"]];
    const dl = App.el("dl", "grid grid-cols-3 gap-x-3 gap-y-1");
    rows.forEach(([k, v]) => dl.append(App.el("dt", "text-ink-600", k), App.el("dd", "col-span-2 font-medium", v || "-")));
    box.append(dl);
  },

  /* ---------- submit + progress ---------- */
  async handleSubmit(e) {
    e.preventDefault();
    if (!App.validateStep(App.step)) return;
    const data = App.collect();
    const btn = document.getElementById("btn-submit"); btn.disabled = true;
    try {
      if (CONFIG.webhookUrl) {
        // Form-encoded "simple request": no CORS preflight. no-cors means we can't read the reply,
        // so success is confirmed later by polling GitHub (and the stall message covers failures).
        await fetch(CONFIG.webhookUrl, { method: "POST", mode: "no-cors", body: new URLSearchParams({ payload: JSON.stringify(data) }) });
      } else {
        App.toast("Demo mode: add your n8n webhook URL in platform/config.js to start real builds.");
      }
      const job = { slug: data.slug, name: data.businessName, startedAt: Date.now(), demo: !CONFIG.webhookUrl };
      try { localStorage.setItem(App.STORE_KEY, JSON.stringify(job)); } catch { /* storage blocked */ }
      App.showProgress(job);
    } catch (err) {
      App.toast(`We could not start the build: ${err.message}. Please try again.`);
    } finally { btn.disabled = false; }
  },

  showProgress(job) {
    document.getElementById("brief-form").hidden = true;
    document.getElementById("progress").hidden = false;
    document.getElementById("pg-name").textContent = job.name;
    App.scrollToForm();
    const tick = async () => {
      const mins = (Date.now() - job.startedAt) / 60000;
      const ol = document.getElementById("timeline"); ol.replaceChildren();
      const activeIdx = timelineSteps.reduce((acc, s, i) => (mins >= s.min ? i : acc), 0);
      timelineSteps.forEach((s, i) => {
        const li = App.el("li"); li.dataset.state = i < activeIdx ? "done" : i === activeIdx ? "active" : "";
        const dot = App.el("span", "tl-dot"); dot.append(App.icon(i < activeIdx ? "check" : "circle", "h-4 w-4"));
        li.append(dot, App.el("span", "", s.label)); ol.append(li);
      });
      App.refreshIcons();
      if (job.demo && mins >= 1) return App.stall(job, "Demo mode: no build was started.", "The form is not connected to n8n yet, so nothing is being built. Click \"Start another project\" to try again.");
      if (!job.demo && await App.isLive(job.slug)) return App.finish(job);
      if (mins >= 25) App.stall(job, "This is taking longer than expected.", "The build may have stopped. Check the latest execution in n8n, or start the project again.");
    };
    tick(); clearInterval(App.timer); App.timer = setInterval(tick, 30000);
  },

  async isLive(slug) {
    // Check the published GitHub Pages site itself: no API rate limit, and it confirms the preview is really live.
    try { const r = await fetch(`${CONFIG.pagesBase}${slug}/site/?t=${Date.now()}`, { method: "HEAD", cache: "no-store" }); return r.ok; } catch { return false; }
  },

  stall(job, title, text) {
    document.getElementById("pg-stalled-title").textContent = title;
    document.getElementById("pg-stalled-text").textContent = text;
    document.getElementById("pg-stalled").hidden = false;
    document.querySelectorAll("#timeline li[data-state='active']").forEach(li => { li.dataset.state = ""; });
    if (job.demo || (Date.now() - job.startedAt) / 60000 >= 60) {
      clearInterval(App.timer);
      try { localStorage.removeItem(App.STORE_KEY); } catch { /* ignore */ }
    }
  },

  finish(job) {
    clearInterval(App.timer);
    document.querySelectorAll("#timeline li").forEach(li => { li.dataset.state = "done"; });
    const link = document.getElementById("pg-link"); link.href = `${CONFIG.pagesBase}${job.slug}/site/`;
    document.getElementById("pg-done").hidden = false;
    try { localStorage.removeItem(App.STORE_KEY); } catch { /* ignore */ }
    App.toast("Your website is ready!");
  },

  resetAll() {
    clearInterval(App.timer);
    try { localStorage.removeItem(App.STORE_KEY); } catch { /* ignore */ }
    const form = document.getElementById("brief-form"); form.reset(); App.logoDataUrl = ""; document.getElementById("logo-preview").hidden = true;
    form.hidden = false; document.getElementById("progress").hidden = true; document.getElementById("pg-done").hidden = true; document.getElementById("pg-stalled").hidden = true;
    App.showStep(1); App.scrollToForm();
  },

  /* ---------- projects gallery (from GitHub) ---------- */
  projects: [],
  async loadProjects() {
    const grid = document.getElementById("project-grid");
    for (let i = 0; i < 3; i++) { const sk = App.el("div", "card"); sk.append(App.el("div", "mock-line mock-shimmer h-40 rounded-xl"), App.el("div", "mock-line mock-shimmer mt-4 h-4 w-2/3")); grid.append(sk); }
    try {
      const r = await fetch(`https://api.github.com/repos/${CONFIG.repo}/contents/projects`);
      if (!r.ok) throw new Error(String(r.status));
      App.projects = (await r.json()).filter(x => x.type === "dir").map(x => x.name);
      App.renderProjects("");
    } catch {
      grid.replaceChildren();
      const box = App.el("div", "card col-span-full text-center"); box.append(App.icon("cloud-off", "mx-auto icon-lg text-ink-600"), App.el("p", "mt-2 text-ink-600", "Projects could not be loaded right now. Please refresh in a minute."));
      grid.append(box); App.refreshIcons();
    }
  },

  renderProjects(q) {
    const grid = document.getElementById("project-grid"); grid.replaceChildren();
    const list = App.projects.filter(p => p.includes(App.slugify(q)));
    if (!list.length) {
      const box = App.el("div", "card col-span-full text-center"); box.append(App.icon("folder-search", "mx-auto icon-lg text-ink-600"), App.el("p", "mt-2 text-ink-600", q ? "No projects match your search." : "No projects yet. Yours could be the first!"));
      grid.append(box); App.refreshIcons(); return;
    }
    list.forEach(slug => {
      const url = `${CONFIG.pagesBase}${slug}/site/`;
      const card = App.el("a", "card group block overflow-hidden p-0"); card.href = url; card.target = "_blank"; card.rel = "noopener";
      const wrap = App.el("div", "thumb-wrap");
      const frame = document.createElement("iframe"); frame.src = url; frame.loading = "lazy"; frame.tabIndex = -1; frame.title = `Preview of ${slug}`; frame.setAttribute("aria-hidden", "true"); frame.setAttribute("sandbox", "allow-scripts allow-same-origin");
      wrap.append(frame);
      const body = App.el("div", "flex items-center justify-between gap-3 p-5");
      const title = slug.split("-").map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(" ");
      const meta = App.el("div"); meta.append(App.el("h3", "font-display font-bold", title), App.el("p", "font-mono text-xs text-ink-600", slug));
      const go = App.el("span", "icon-tile h-10 w-10 transition-transform group-hover:translate-x-1"); go.append(App.icon("arrow-up-right"));
      body.append(meta, go); card.append(wrap, body); grid.append(card);
    });
    App.refreshIcons();
  },

  resumeJob() {
    try { const job = JSON.parse(localStorage.getItem(App.STORE_KEY)); if (job && Date.now() - job.startedAt < 60 * 60000) App.showProgress(job); } catch { /* ignore */ }
  },

  init() {
    App.renderStatic(); App.renderChoices(); App.initWizard(); App.loadProjects(); App.resumeJob();
    document.getElementById("project-search").addEventListener("input", e => App.renderProjects(e.target.value));
    App.refreshIcons();
  }
};
document.addEventListener("DOMContentLoaded", App.init);
