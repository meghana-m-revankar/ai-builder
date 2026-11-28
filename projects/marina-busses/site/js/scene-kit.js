// scene-kit.js - 3D runtime for generated sites (embedded by patch-knowledge-v2.js as site/js/scene-kit.js).
// Loaded as <script type="module"> only on pages of a 3D Interactive site or pages with a data-variant="3d" section.
// 1) depth styling for the whole 3D site: card tilt + parallax (desktop pointer only, never with reduced motion)
// 2) WebGL scenes for up to 2 <section data-variant="3d" data-scene="orbit|product|walkthrough|particles">,
//    lazy-loaded near the viewport; the section's normal HTML is the 2D fallback and stays readable above the canvas.
const reduce = matchMedia('(prefers-reduced-motion: reduce)').matches;
const conn = navigator.connection || {};
const lowEnd = (navigator.hardwareConcurrency || 8) < 4 || conn.saveData === true || /(^|-)(2g|3g)$/.test(conn.effectiveType || '');
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

// object scenes replace one image in place (product photo, device screenshot, 3D model); ambient scenes sit behind the section
const OBJECT_SCENES = ['product', 'laptop', 'phone', 'model'];

async function mount(section) {
  let THREE;
  try { THREE = await import('three'); } catch (e) { return; } // stays 2D
  const kind = section.dataset.scene || 'orbit';
  const objectScene = OBJECT_SCENES.includes(kind);
  // the product / screenshot image: marked one first, else the first image that is not a full-bleed background
  const isBackground = el => { const cs = getComputedStyle(el); return cs.position === 'absolute' || cs.position === 'fixed' || el.getBoundingClientRect().width > section.getBoundingClientRect().width * 0.9; };
  const marked = section.querySelector('img[data-product], img[data-screen]');
  const inline = [...section.querySelectorAll('img')].find(el => !isBackground(el));
  const img = marked || inline || section.querySelector('img');
  // object scenes draw inside the image's own frame (layout unchanged, image = 2D fallback); if the only image is a
  // background photo, the object floats over the right half of the section and the background stays visible
  const inFrame = objectScene && img && (marked || inline) && img.parentElement;
  const host = inFrame ? img.parentElement : section;
  const sideCanvas = objectScene && !inFrame;
  const canvas = document.createElement('canvas');
  canvas.setAttribute('aria-hidden', 'true');
  canvas.style.cssText = sideCanvas
    ? 'position:absolute;top:0;bottom:0;right:0;width:' + (innerWidth >= 1024 ? '48%' : '100%') + ';height:100%;pointer-events:none;z-index:1'
    : 'position:absolute;inset:0;width:100%;height:100%;pointer-events:none;z-index:' + (host === section ? '1;opacity:.6' : '2');
  if (getComputedStyle(host).position === 'static') host.style.position = 'relative';
  // layers: background photo / overlay (0) -> 3D canvas (1) -> text and buttons (2)
  if (host === section)
    [...section.children].forEach(ch => {
      const cs = getComputedStyle(ch);
      if (cs.position === 'absolute' || cs.position === 'fixed') { if (cs.zIndex === 'auto') ch.style.zIndex = '0'; return; }
      if (cs.position === 'static') ch.style.position = 'relative';
      ch.style.zIndex = '2';
    });
  host.prepend(canvas);

  const renderer = new THREE.WebGLRenderer({ canvas, alpha: true, antialias: true, powerPreference: 'low-power' });
  renderer.setPixelRatio(Math.min(devicePixelRatio || 1, 1.5));
  const scene = new THREE.Scene();
  const camera = new THREE.PerspectiveCamera(45, 1, 0.1, 100);
  camera.position.set(0, 0, 8);
  scene.add(new THREE.AmbientLight(0xffffff, 0.7));
  const light = new THREE.DirectionalLight(0xffffff, 1.1); light.position.set(4, 6, 5); scene.add(light);
  const c1 = new THREE.Color(brand[0]), c2 = new THREE.Color(brand[1]), c3 = new THREE.Color(brand[2]);
  const group = new THREE.Group(); scene.add(group);

  // texture from the section image (needs CORS; if it fails the scene uses brand colours instead)
  const loadTexture = () => new Promise(resolve => {
    if (!img || !img.currentSrc && !img.src) return resolve(null);
    new THREE.TextureLoader().setCrossOrigin('anonymous').load(img.currentSrc || img.src,
      t => { t.colorSpace = THREE.SRGBColorSpace; t.anisotropy = 4; resolve(t); }, undefined, () => resolve(null));
  });
  // soft round shadow under floating objects
  const shadow = () => {
    const cv = document.createElement('canvas'); cv.width = cv.height = 128;
    const g = cv.getContext('2d'), grd = g.createRadialGradient(64, 64, 4, 64, 64, 62);
    grd.addColorStop(0, 'rgba(15,23,42,.45)'); grd.addColorStop(1, 'rgba(15,23,42,0)');
    g.fillStyle = grd; g.fillRect(0, 0, 128, 128);
    const m = new THREE.Mesh(new THREE.PlaneGeometry(4.5, 1.6), new THREE.MeshBasicMaterial({ map: new THREE.CanvasTexture(cv), transparent: true, depthWrite: false }));
    m.rotation.x = -Math.PI / 2; m.position.y = -2.1; return m;
  };
  // no screenshot -> dark glass screen (never a coloured background)
  const screenMat = tex => tex ? new THREE.MeshBasicMaterial({ map: tex }) : new THREE.MeshStandardMaterial({ color: 0x0b0f19, metalness: 0.2, roughness: 0.15 });
  const body = new THREE.MeshStandardMaterial({ color: 0x1f2937, metalness: 0.6, roughness: 0.35 });

  if (kind === 'product') {
    // the product photo as a floating 3D card with thickness, tilt and a soft shadow
    const tex = await loadTexture();
    if (!tex) { canvas.remove(); return; } // photo could not load as 3D -> keep the normal photo, no coloured stand-in
    const aspect = tex.image ? tex.image.width / tex.image.height : 1;
    const w = aspect >= 1 ? 3.6 : 3.6 * aspect, h = aspect >= 1 ? 3.6 / aspect : 3.6;
    // cut-out product (transparent PNG, background removed): the object itself floats, no card at all
    const src = img.currentSrc || img.src || '';
    const cutout = img.hasAttribute('data-cutout') || /\.png($|\?)/i.test(src) || /-cutout\./i.test(src);
    if (cutout) {
      const mat = new THREE.MeshBasicMaterial({ map: tex, transparent: true, alphaTest: 0.04, side: THREE.DoubleSide });
      const front = new THREE.Mesh(new THREE.PlaneGeometry(w, h), mat);
      // a few stacked layers give the flat cut-out real thickness when it turns
      for (let i = 1; i <= 6; i++) { const layer = front.clone(); layer.position.z = -i * 0.012; layer.material = mat.clone(); layer.material.color = new THREE.Color(0.82, 0.82, 0.82); group.add(layer); }
      group.add(front, shadow());
    } else {
      // photo with a background: a thin 3D print whose edges use the photo's own pixels (no added colour)
      const photo = new THREE.MeshStandardMaterial({ map: tex, roughness: 0.55 });
      group.add(new THREE.Mesh(new THREE.BoxGeometry(w, h, 0.08), photo), shadow());
    }
    camera.position.z = 6.5;
  } else if (kind === 'laptop') {
    const tex = await loadTexture();
    const base = new THREE.Mesh(new THREE.BoxGeometry(4.2, 0.14, 2.8), body); base.position.y = -1.2;
    const hinge = new THREE.Group(); hinge.position.set(0, -1.13, -1.4); hinge.rotation.x = -0.32;
    const lid = new THREE.Mesh(new THREE.BoxGeometry(4.2, 2.7, 0.1), body); lid.position.y = 1.35;
    const screen = new THREE.Mesh(new THREE.PlaneGeometry(3.9, 2.4), screenMat(tex)); screen.position.set(0, 1.35, 0.056);
    hinge.add(lid, screen);
    const pad = new THREE.Mesh(new THREE.PlaneGeometry(1.2, 0.7), new THREE.MeshStandardMaterial({ color: 0x374151 })); pad.rotation.x = -Math.PI / 2; pad.position.set(0, -1.12, 0.8);
    group.add(base, hinge, pad, shadow());
    group.rotation.x = 0.15; camera.position.z = 7.5;
  } else if (kind === 'phone') {
    const tex = await loadTexture();
    const frame = new THREE.Mesh(new THREE.BoxGeometry(1.9, 3.9, 0.18), body);
    const screen = new THREE.Mesh(new THREE.PlaneGeometry(1.72, 3.66), screenMat(tex)); screen.position.z = 0.092;
    const notch = new THREE.Mesh(new THREE.PlaneGeometry(0.5, 0.1), new THREE.MeshBasicMaterial({ color: 0x0b0b0b })); notch.position.set(0, 1.72, 0.094);
    group.add(frame, screen, notch, shadow());
    camera.position.z = 6.5;
  } else if (kind === 'model' && section.dataset.model) {
    // a real 3D model (.glb from Blender etc.), centred and scaled to fit
    try {
      const { GLTFLoader } = await import('three/addons/loaders/GLTFLoader.js');
      const gltf = await new GLTFLoader().loadAsync(section.dataset.model);
      const model = gltf.scene, box = new THREE.Box3().setFromObject(model);
      const size = box.getSize(new THREE.Vector3()).length() || 1, center = box.getCenter(new THREE.Vector3());
      model.position.sub(center); model.scale.setScalar(4.2 / size);
      group.add(model, shadow());
    } catch (e) { canvas.remove(); return; } // model failed -> keep the 2D image
    camera.position.z = 6.5;
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

  // object scenes: hide the 2D image only once the 3D version is drawn
  // and make the frame transparent so the 3D object floats on the page itself (no box or colour behind it)
  if (inFrame) requestAnimationFrame(() => {
    img.style.transition = 'opacity .4s'; img.style.opacity = '0';
    host.style.background = 'transparent'; host.style.boxShadow = 'none'; host.style.border = '0'; host.style.overflow = 'visible';
  });

  const resize = () => {
    const w = host.clientWidth, h = host.clientHeight;
    renderer.setSize(w, h, false); camera.aspect = w / Math.max(h, 1); camera.updateProjectionMatrix();
  };
  resize();
  new ResizeObserver(resize).observe(host);

  let visible = true;
  new IntersectionObserver(es => { visible = es[0].isIntersecting; if (visible) loop(); }).observe(section);
  let px = 0, py = 0;
  if (fine) addEventListener('pointermove', e => { px = e.clientX / innerWidth - 0.5; py = e.clientY / innerHeight - 0.5; }, { passive: true });
  let raf = 0;
  function loop() {
    cancelAnimationFrame(raf);
    if (!visible) return;
    if (objectScene) {
      // gentle float + turn towards the pointer (product/devices stay readable, never spin fast)
      const t = performance.now() / 1000;
      group.position.y = Math.sin(t * 1.2) * 0.08;
      group.rotation.y += ((kind === 'model' ? t * 0.35 : px * 0.6 + Math.sin(t * 0.5) * 0.18) - group.rotation.y) * 0.06;
      group.rotation.x += (py * 0.25 + (kind === 'laptop' ? 0.15 : 0) - group.rotation.x) * 0.06;
    } else {
      group.rotation.y += 0.004;
      group.rotation.z += (py * 0.2 - group.rotation.z) * 0.05;
    }
    camera.position.x += (px * 1.2 - camera.position.x) * 0.05;
    camera.lookAt(0, 0, 0);
    renderer.render(scene, camera);
    raf = requestAnimationFrame(loop);
  }
  loop();
}
