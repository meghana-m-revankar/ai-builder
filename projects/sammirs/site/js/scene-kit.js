// scene-kit.js - 3D runtime for generated sites (embedded by patch-knowledge-v2.js as site/js/scene-kit.js).
// Loaded as <script type="module"> only on pages of a 3D Interactive site or pages with a data-variant="3d" section.
// 1) depth styling for the whole 3D site: card tilt + parallax (desktop pointer only, never with reduced motion)
// 2) WebGL scenes for up to 2 <section data-variant="3d" data-scene="orbit|product|walkthrough|particles">,
//    lazy-loaded near the viewport; the section's normal HTML is the 2D fallback and stays readable above the canvas.
const reduce = matchMedia('(prefers-reduced-motion: reduce)').matches;
const conn = navigator.connection || {};
const lowEnd = (navigator.hardwareConcurrency || 8) <= 4 || conn.saveData === true || /(^|-)(2g|3g)$/.test(conn.effectiveType || '');
const small = innerWidth < 768;
const webgl = (() => { try { return !!document.createElement('canvas').getContext('webgl2'); } catch (e) { return false; } })();
const can3D = !reduce && !lowEnd && !small && webgl;
document.documentElement.classList.add(can3D ? 'has-3d' : 'no-3d');

const brand = (() => {
  try { const b = window.tailwind.config.theme.extend.colors.brand; return [b['400'] || '#818cf8', b['600'] || '#4f46e5', b['200'] || '#c7d2fe']; }
  catch (e) { return ['#818cf8', '#4f46e5', '#c7d2fe']; }
})();

// ---------- 1) depth styling ----------
const fine = matchMedia('(hover: hover) and (pointer: fine)').matches;
if (document.body.classList.contains('dir-3d') && !reduce) {
  const st = document.createElement('style');
  st.textContent = '.dir-3d main section{perspective:1200px}' +
    '.dir-3d .tilt3d{transform-style:preserve-3d;transition:transform .25s ease-out,box-shadow .25s ease-out;will-change:transform}' +
    '.dir-3d .tilt3d:hover{box-shadow:0 30px 60px -20px rgba(15,23,42,.35)}' +
    '.dir-3d .depth-in{opacity:0;transform:translateY(32px) rotateX(8deg);transition:opacity .8s ease,transform .8s cubic-bezier(.2,.7,.2,1)}' +
    '.dir-3d .depth-in.in{opacity:1;transform:none}';
  document.head.appendChild(st);
  const cards = document.querySelectorAll('main [class*="rounded-2xl"], main [class*="rounded-3xl"], main .tilt');
  if (fine) cards.forEach(el => {
    if (el.closest('form') || el.querySelector('form')) return;
    el.classList.add('tilt3d');
    el.addEventListener('pointermove', e => {
      const r = el.getBoundingClientRect();
      const x = (e.clientX - r.left) / r.width - 0.5, y = (e.clientY - r.top) / r.height - 0.5;
      el.style.transform = `rotateY(${(x * 8).toFixed(2)}deg) rotateX(${(-y * 8).toFixed(2)}deg) translateZ(0)`;
    });
    el.addEventListener('pointerleave', () => { el.style.transform = ''; });
  });
  if ('IntersectionObserver' in window) {
    const io = new IntersectionObserver(es => es.forEach(e => { if (e.isIntersecting) { e.target.classList.add('in'); io.unobserve(e.target); } }), { threshold: 0.15 });
    document.querySelectorAll('main section > div').forEach(el => { if (el.getBoundingClientRect().top > innerHeight) { el.classList.add('depth-in'); io.observe(el); } });
  }
  const layers = [...document.querySelectorAll('[data-parallax], main section:first-of-type img')].slice(0, 6);
  if (layers.length && !small) {
    let ticking = false;
    addEventListener('scroll', () => {
      if (ticking) return; ticking = true;
      requestAnimationFrame(() => {
        layers.forEach(el => { const s = parseFloat(el.dataset.parallax || '0.12'); el.style.transform = `translate3d(0, ${(scrollY * s).toFixed(1)}px, 0) scale(1.08)`; });
        ticking = false;
      });
    }, { passive: true });
  }
}

// ---------- 2) WebGL scenes ----------
const targets = [...document.querySelectorAll('section[data-variant="3d"]')].slice(0, 2);
if (can3D && targets.length && 'IntersectionObserver' in window) {
  const io = new IntersectionObserver(es => es.forEach(e => {
    if (e.isIntersecting && !e.target.dataset.sceneReady) { e.target.dataset.sceneReady = '1'; mount(e.target); }
  }), { rootMargin: '200px' });
  targets.forEach(t => io.observe(t));
}

async function mount(section) {
  let THREE;
  try { THREE = await import('three'); } catch (e) { return; } // stays 2D
  const canvas = document.createElement('canvas');
  canvas.setAttribute('aria-hidden', 'true');
  canvas.style.cssText = 'position:absolute;inset:0;width:100%;height:100%;pointer-events:none;z-index:0;opacity:.6';
  if (getComputedStyle(section).position === 'static') section.style.position = 'relative';
  [...section.children].forEach(ch => { if (getComputedStyle(ch).position === 'static') ch.style.position = 'relative'; ch.style.zIndex = '1'; });
  section.prepend(canvas);

  const renderer = new THREE.WebGLRenderer({ canvas, alpha: true, antialias: true, powerPreference: 'low-power' });
  renderer.setPixelRatio(Math.min(devicePixelRatio || 1, 1.5));
  const scene = new THREE.Scene();
  const camera = new THREE.PerspectiveCamera(45, 1, 0.1, 100);
  camera.position.set(0, 0, 8);
  scene.add(new THREE.AmbientLight(0xffffff, 0.7));
  const light = new THREE.DirectionalLight(0xffffff, 1.1); light.position.set(4, 6, 5); scene.add(light);
  const c1 = new THREE.Color(brand[0]), c2 = new THREE.Color(brand[1]), c3 = new THREE.Color(brand[2]);
  const group = new THREE.Group(); scene.add(group);
  const kind = section.dataset.scene || 'orbit';

  if (kind === 'product') {
    const item = new THREE.Mesh(new THREE.TorusKnotGeometry(1.1, 0.35, 160, 24), new THREE.MeshStandardMaterial({ color: c2, metalness: 0.4, roughness: 0.3 }));
    item.position.y = 0.6;
    const plinth = new THREE.Mesh(new THREE.CylinderGeometry(2, 2.2, 0.4, 64), new THREE.MeshStandardMaterial({ color: c3, roughness: 0.8 }));
    plinth.position.y = -1.3;
    group.add(item, plinth); group.position.x = 2.2;
  } else if (kind === 'walkthrough') {
    for (let i = 0; i < 14; i++) {
      const h = 0.8 + Math.random() * 2.8;
      const b = new THREE.Mesh(new THREE.BoxGeometry(0.8, h, 0.8), new THREE.MeshStandardMaterial({ color: i % 3 ? c3 : c1, roughness: 0.6 }));
      b.position.set((i % 7) * 1.1 - 3.3, h / 2 - 2, Math.floor(i / 7) * -1.4);
      group.add(b);
    }
    group.rotation.x = 0.35;
  } else if (kind === 'particles') {
    const n = 900, pos = new Float32Array(n * 3);
    for (let i = 0; i < n * 3; i++) pos[i] = (Math.random() - 0.5) * 14;
    const g = new THREE.BufferGeometry(); g.setAttribute('position', new THREE.BufferAttribute(pos, 3));
    group.add(new THREE.Points(g, new THREE.PointsMaterial({ color: c1, size: 0.05 })));
  } else {
    group.add(new THREE.Mesh(new THREE.IcosahedronGeometry(1.6, 1), new THREE.MeshStandardMaterial({ color: c2, wireframe: true })));
    const ring = new THREE.Mesh(new THREE.TorusGeometry(2.6, 0.06, 16, 120), new THREE.MeshStandardMaterial({ color: c1 }));
    ring.rotation.x = 1.2; group.add(ring);
    group.position.x = 2.4;
  }

  const resize = () => {
    const w = section.clientWidth, h = section.clientHeight;
    renderer.setSize(w, h, false); camera.aspect = w / Math.max(h, 1); camera.updateProjectionMatrix();
  };
  resize();
  new ResizeObserver(resize).observe(section);

  let visible = true;
  new IntersectionObserver(es => { visible = es[0].isIntersecting; if (visible) loop(); }).observe(section);
  let px = 0, py = 0;
  if (fine) addEventListener('pointermove', e => { px = e.clientX / innerWidth - 0.5; py = e.clientY / innerHeight - 0.5; }, { passive: true });
  let raf = 0;
  function loop() {
    cancelAnimationFrame(raf);
    if (!visible) return;
    group.rotation.y += 0.004;
    group.rotation.z += (py * 0.2 - group.rotation.z) * 0.05;
    camera.position.x += (px * 1.2 - camera.position.x) * 0.05;
    camera.lookAt(0, 0, 0);
    renderer.render(scene, camera);
    raf = requestAnimationFrame(loop);
  }
  loop();
}
