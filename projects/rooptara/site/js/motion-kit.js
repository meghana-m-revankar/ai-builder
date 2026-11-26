// motion-kit.js - "Studio motion" for award-style sites (embedded by patch-knowledge-v2.js as site/js/motion-kit.js).
// Loaded only when the design direction is Studio Motion, after GSAP + ScrollTrigger + Lenis (UMD, defer).
// Everything is opt-in by data attributes the page writer adds; nothing runs with reduced motion, on touch-only
// devices for pointer effects, or on save-data connections. Content is always visible without JavaScript.
(function () {
  var reduce = matchMedia('(prefers-reduced-motion: reduce)').matches;
  var conn = navigator.connection || {};
  var light = conn.saveData === true || /(^|-)(2g|3g)$/.test(conn.effectiveType || '');
  var fine = matchMedia('(hover: hover) and (pointer: fine)').matches;
  var $ = function (s, r) { return Array.prototype.slice.call((r || document).querySelectorAll(s)); };

  // page transitions between pages (Chrome/Edge/Safari support; others just navigate)
  var vt = document.createElement('style');
  vt.textContent = '@view-transition{navigation:auto}::view-transition-old(root),::view-transition-new(root){animation-duration:.35s}' +
    '.mk-marquee{overflow:hidden;white-space:nowrap}.mk-marquee>*{display:inline-flex;gap:3rem;padding-right:3rem}' +
    '.mk-line{display:block;overflow:hidden}.mk-line>span{display:inline-block}' +
    '.mk-cursor{position:fixed;left:0;top:0;width:14px;height:14px;margin:-7px 0 0 -7px;border-radius:50%;background:currentColor;mix-blend-mode:difference;color:#fff;pointer-events:none;z-index:9999;transition:width .2s,height .2s,margin .2s}' +
    '.mk-cursor.big{width:56px;height:56px;margin:-28px 0 0 -28px}' +
    '.mk-preloader{position:fixed;inset:0;z-index:10000;display:flex;align-items:center;justify-content:center;background:#0b0b0b;color:#fff;font-size:clamp(2rem,6vw,4rem);font-weight:800;letter-spacing:-.02em}';
  document.head.appendChild(vt);

  if (reduce || light || !window.gsap) return; // calm, static version
  var gsap = window.gsap;
  if (window.ScrollTrigger) gsap.registerPlugin(window.ScrollTrigger);

  // smooth scroll (desktop only; native scrolling on touch keeps phones snappy)
  var lenis = null;
  if (window.Lenis && fine) {
    lenis = new window.Lenis({ lerp: 0.1, smoothWheel: true });
    if (window.ScrollTrigger) lenis.on('scroll', window.ScrollTrigger.update);
    gsap.ticker.add(function (t) { lenis.raf(t * 1000); });
    gsap.ticker.lagSmoothing(0);
    // in-page anchors scroll smoothly too
    $('a[href^="#"]').forEach(function (a) {
      a.addEventListener('click', function (e) { var id = a.getAttribute('href'); if (id.length > 1 && document.querySelector(id)) { e.preventDefault(); lenis.scrollTo(id, { offset: -80 }); } });
    });
  }

  // preloader: <div data-preloader>Brand</div> (optional, max 1.2 s)
  $('[data-preloader]').forEach(function (p) {
    p.classList.add('mk-preloader');
    gsap.to(p, { yPercent: -100, duration: 0.8, ease: 'power3.inOut', delay: 0.5, onComplete: function () { p.remove(); } });
  });

  // text reveal: <h1 data-split>Big headline</h1> -> words slide up line by line
  $('[data-split]').forEach(function (el) {
    if (el.children.length) return; // only plain text headings
    var words = el.textContent.trim().split(/\s+/);
    el.setAttribute('aria-label', el.textContent.trim());
    el.innerHTML = words.map(function (w) { return '<span class="mk-line" aria-hidden="true"><span>' + w.replace(/[<&>]/g, '') + '&nbsp;</span></span>'; }).join('');
    el.style.display = 'flex'; el.style.flexWrap = 'wrap';
    gsap.from(el.querySelectorAll('.mk-line>span'), {
      yPercent: 110, duration: 0.9, ease: 'power4.out', stagger: 0.05,
      scrollTrigger: window.ScrollTrigger ? { trigger: el, start: 'top 85%' } : undefined
    });
  });

  // fade / rise reveal: data-reveal on any block
  $('[data-reveal]').forEach(function (el) {
    gsap.from(el, { y: 48, opacity: 0, duration: 1, ease: 'power3.out', scrollTrigger: window.ScrollTrigger ? { trigger: el, start: 'top 88%' } : undefined });
  });

  // pinned scroll scene: <section data-pin> ... children with data-pin-step animate in while the section stays pinned (desktop)
  if (window.ScrollTrigger && innerWidth >= 1024) $('[data-pin]').forEach(function (sec) {
    var steps = $('[data-pin-step]', sec);
    var tl = gsap.timeline({ scrollTrigger: { trigger: sec, start: 'top top', end: '+=' + Math.max(1, steps.length) * 60 + '%', pin: true, scrub: 0.6 } });
    steps.forEach(function (s, i) { tl.from(s, { opacity: 0, y: 60, scale: 0.96, duration: 1 }, i); });
  });

  // parallax images: data-speed="0.15"
  if (window.ScrollTrigger) $('[data-speed]').forEach(function (el) {
    var sp = parseFloat(el.dataset.speed) || 0.15;
    gsap.to(el, { yPercent: -sp * 100, ease: 'none', scrollTrigger: { trigger: el, start: 'top bottom', end: 'bottom top', scrub: true } });
  });

  // marquee: <div data-marquee><span>Client · Client · Client</span></div>
  $('[data-marquee]').forEach(function (m) {
    m.classList.add('mk-marquee');
    var inner = m.firstElementChild; if (!inner) return;
    m.appendChild(inner.cloneNode(true)).setAttribute('aria-hidden', 'true');
    var speed = parseFloat(m.dataset.marquee) || 30;
    gsap.to(m.children, { xPercent: -100, repeat: -1, duration: speed, ease: 'none' });
  });

  if (!fine) return; // pointer effects only with a mouse

  // magnetic buttons: data-magnetic
  $('[data-magnetic]').forEach(function (b) {
    b.addEventListener('pointermove', function (e) {
      var r = b.getBoundingClientRect();
      gsap.to(b, { x: (e.clientX - r.left - r.width / 2) * 0.3, y: (e.clientY - r.top - r.height / 2) * 0.3, duration: 0.3 });
    });
    b.addEventListener('pointerleave', function () { gsap.to(b, { x: 0, y: 0, duration: 0.5, ease: 'elastic.out(1,0.4)' }); });
  });

  // image hover zoom/reveal on case-study and product cards: data-hover-zoom
  $('[data-hover-zoom]').forEach(function (card) {
    var im = card.querySelector('img'); if (!im) return;
    card.style.overflow = 'hidden';
    card.addEventListener('pointerenter', function () { gsap.to(im, { scale: 1.08, duration: 0.6, ease: 'power3.out' }); });
    card.addEventListener('pointerleave', function () { gsap.to(im, { scale: 1, duration: 0.6, ease: 'power3.out' }); });
  });

  // custom cursor (grows over links and buttons); the system cursor stays visible for accessibility
  if (document.body.hasAttribute('data-cursor')) {
    var c = document.createElement('div'); c.className = 'mk-cursor'; c.setAttribute('aria-hidden', 'true'); document.body.appendChild(c);
    var x = gsap.quickTo(c, 'x', { duration: 0.25 }), y = gsap.quickTo(c, 'y', { duration: 0.25 });
    addEventListener('pointermove', function (e) { x(e.clientX); y(e.clientY); });
    $('a, button, [data-magnetic]').forEach(function (el) {
      el.addEventListener('pointerenter', function () { c.classList.add('big'); });
      el.addEventListener('pointerleave', function () { c.classList.remove('big'); });
    });
  }
})();
