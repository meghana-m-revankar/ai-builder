// n8n CLOUD Code node: "Quality Gate"  (Language: JavaScript, Mode: Run Once for All Items)
// No file system needed: checks the files the agents returned, before they are committed to GitHub.
// Input: one or more items whose json has  files: [{ path, content }]  (the agents' output, merged).
//        Paths are relative to the project root, e.g. "site/index.html", "src/X.Api/Program.cs".
// Output: { passed, failCount, total, fails:[{owner,message}], feedback:{ "<Agent>": "prompt text" }, files }
const files = $input.all().flatMap(i => i.json.files || []);
const byPath = new Map(files.map(f => [String(f.path).replace(/^\.?\//, ''), String(f.content ?? '')]));
const has = p => byPath.has(p);
const read = p => byPath.get(p) || '';
const kb = p => Buffer.byteLength(read(p), 'utf8') / 1024;
const count = (s, rx) => (s.match(rx) || []).length;
const norm = p => { const out = []; for (const seg of p.split('/')) { if (seg === '..') out.pop(); else if (seg && seg !== '.') out.push(seg); } return out.join('/'); };

const fails = []; let total = 0;
const check = (ok, owner, message) => { total++; if (!ok) fails.push({ owner, message }); };

// ---------- static site ----------
const pages = [...byPath.keys()].filter(p => /^site\/[^/]+\.html$/.test(p));
if (pages.length) {
  const S = 'Static Site';
  for (const [rel, min] of Object.entries({ 'site/index.html': 15, 'site/css/style.css': 6, 'site/js/app.js': 4, 'site/js/data.js': 2 }))
    check(kb(rel) >= min, S, `${rel} is ${kb(rel).toFixed(1)} KB, must be at least ${min} KB. Write it completely from 09 Site Template.`);
  check(pages.length >= 3, S, `Only ${pages.length} HTML page(s); need at least 3.`);
  const appJs = read('site/js/app.js'), dataJs = read('site/js/data.js');
  const packs = { lucide: /lucide(@|\.min\.js)/, phosphor: /@phosphor-icons\/web/, boxicons: /boxicons@/, 'bootstrap-icons': /bootstrap-icons@/ };
  const forbidden = { 'style="': /style="/g, 'onclick=': /onclick=/g, 'href="#"': /href="#"/g, 'lorem ipsum': /lorem ipsum/gi, '"Feature 1"': /feature 1\b/gi, '#0D6EFD': /#0d6efd/gi };

  for (const n of pages) {
    const html = read(n);
    check(html.includes('<title>'), S, `${n}: missing <title>.`);
    check(html.includes('name="description"'), S, `${n}: missing <meta name="description">.`);
    const h1 = count(html, /<h1[\s>]/g);
    check(h1 === 1, S, `${n}: has ${h1} <h1>; need exactly 1.`);
    const loaded = Object.keys(packs).filter(k => packs[k].test(html));
    check(loaded.length === 1, S, `${n}: icon packs loaded = [${loaded.join(', ') || 'none'}]; load exactly one.`);
    const icons = count(html, /data-lucide="|class="[^"]*\b(ph|ph-fill|bx|bxs|bxl|bi)\s+[a-z-]+/g) + count(appJs, /icon\(\s*"/g) + count(dataJs, /icon:\s*"/g);
    check(icons >= 15, S, `${n}: about ${icons} icons; need at least 15 used meaningfully.`);
    if (n === 'site/index.html') {
      const sections = count(html, /<section[\s>]/g);
      check(sections >= 8, S, `${n}: ${sections} sections; need at least 8 (see 11 Section Recipes).`);
      const imgs = count(html, /<img[\s>]/g) + count(dataJs, /image:\s*"/g);
      check(imgs >= 3, S, `${n}: ${imgs} images; need at least 3.`);
    }
    for (const [label, rx] of Object.entries(forbidden)) { const c = count(html, rx); check(c === 0, S, `${n}: remove ${c} occurrence(s) of ${label}.`); }
    for (const m of html.matchAll(/(?:href|src)="([^"#:?]+)"/g)) {
      const ref = m[1];
      if (ref.startsWith('/')) check(false, S, `${n}: absolute path "${ref}"; use a relative path.`);
      else check(has(norm('site/' + ref)), S, `${n}: "${ref}" does not exist; create it or fix the link.`);
    }
  }
  const used = new Set([...appJs.matchAll(/\b([a-z][A-Za-z]+)\.(?:forEach|map|filter|find|length)\b/g)].map(m => m[1]));
  const defined = new Set([...dataJs.matchAll(/\bconst\s+([A-Za-z]+)\s*=/g)].map(m => m[1]));
  const local = new Set([...appJs.matchAll(/\b(?:const|let)\s+([A-Za-z]+)\s*=/g), ...appJs.matchAll(/\(([a-z][A-Za-z]*)\)\s*=>/g)].map(m => m[1]));
  const missing = [...used].filter(u => !defined.has(u) && !local.has(u) && !['document', 'window', 'list', 'wrap', 'grid'].includes(u));
  check(missing.length === 0, S, `site/js/data.js must define: ${missing.join(', ')} (used by app.js).`);
}

// ---------- .NET structure ----------
const srcFiles = [...byPath.keys()].filter(p => p.startsWith('src/'));
if (srcFiles.length) {
  const A = 'Services & API', U = 'UI Design';
  const projects = [...new Set(srcFiles.map(p => p.split('/')[1]))];
  for (const dir of projects) {
    const inDir = srcFiles.filter(p => p.startsWith(`src/${dir}/`));
    const owner = dir.endsWith('.Web') ? U : A;
    if (inDir.some(f => /\.(cs|razor)$/.test(f))) check(inDir.some(f => f.endsWith('.csproj')), owner, `src/${dir} has code but no .csproj.`);
    if (/\.(Api|Web)$/.test(dir)) for (const f of ['Program.cs', 'appsettings.json', 'Properties/launchSettings.json'])
      check(has(`src/${dir}/${f}`), owner, `src/${dir}/${f} is missing (copy from 03 Architecture templates).`);
    for (const f of inDir.filter(f => f.endsWith('.cs')))
      if (/async\s+Task[^{;]*\{(?:(?!await)[^}])*\}/.test(read(f))) check(false, owner, `${f}: async method without await (warnings are errors).`);
  }
  const slns = [...byPath.keys()].filter(p => !p.includes('/') && p.endsWith('.sln'));
  check(slns.length === 1, A, `Found ${slns.length} .sln files at the root; need exactly 1.`);
  if (slns.length) for (const p of [...byPath.keys()].filter(f => f.endsWith('.csproj'))) {
    const name = p.split('/').pop();
    check(read(slns[0]).includes(name), A, `${slns[0]} does not list ${name}.`);
  }
  if (read('README.md').includes('dotnet ef')) check(false, A, `README uses "dotnet ef" but the project uses SQL scripts; use the commands in 05 Database.`);
}

const feedback = {};
for (const f of fails) (feedback[f.owner] ||= []).push('- ' + f.message);
for (const k of Object.keys(feedback)) feedback[k] = `Your previous output failed the quality gate. Fix ONLY these problems and return the complete corrected files as the same JSON format:\n${feedback[k].join('\n')}`;

return [{ json: { passed: fails.length === 0, failCount: fails.length, total, fails, feedback, files } }];
