// Generates n8n/ai-builder-workflow.json (import it in n8n: ⋯ → Import from File).
// Run: node n8n/build-workflow.js
"use strict";
const fs = require("fs");
const path = require("path");
const crypto = require("crypto");

const body = f => { const s = f.toString(); return s.slice(s.indexOf("{") + 1, s.lastIndexOf("}")).trim() + "\n"; };
const id = () => crypto.randomUUID();
const GEM = { googlePalmApi: { id: "Hvu8Q5n5x8BMCT8J", name: "Gemini - Upshift" } };
const GH = { httpHeaderAuth: { id: "nUDu60658iuRUTYG", name: "GitHub ai-builder" } };
const FAST = "models/gemini-3.1-flash-lite";   // backend, SQL, tests: template work, speed matters
const STRONG = "models/gemini-2.5-pro";        // design work: pick the strongest model in your account
const B = "$('Normalize Brief').first().json";
const nodes = [];
const add = n => { nodes.push({ id: id(), ...n }); return n.name; };

// ---------- Code node bodies ----------
function normalizeBrief() {
  const j = $input.first().json;
  const fromHook = !!(j.body && typeof j.body === "object");
  let b = fromHook ? j.body : j;
  if (fromHook && typeof b.payload === "string") { try { b = JSON.parse(b.payload); } catch (e) { throw new Error("Platform payload is not valid JSON"); } }
  const pick = (...keys) => { for (const k of keys) { const v = b[k]; if (v != null && String(v).trim()) return v; } return ""; };
  const list = v => (Array.isArray(v) ? v.join(", ") : String(v || "")).trim();
  const slugify = s => s.toLowerCase().normalize("NFKD").replace(/[^\w\s-]/g, "").trim().replace(/[\s_]+/g, "-").replace(/-+/g, "-").slice(0, 60) || "project";

  const name = String(pick("businessName", "Business name", "Project Name")).trim() || "New project";
  const scopeRaw = String(pick("scope", "What should we build?") || "website").toLowerCase();
  const scope = scopeRaw.includes("full") ? "full-system" : scopeRaw.includes("admin") ? "website-admin" : "website";
  const ui = String(pick("uiFramework") || "Tailwind");
  const icons = String(pick("iconPack", "Icon Pack") || "Lucide");
  const facts = String(pick("facts", "Real details you already have")).trim();
  const lines = [
    `Business: ${name}`,
    `What they do: ${String(pick("description", "What does your business do?", "Requirements")).trim()}`,
    `Location: ${String(pick("location", "City and country")).trim() || "not given"}`,
    pick("colours", "Colours or feeling") && `Colours / mood: ${pick("colours", "Colours or feeling")}`,
    pick("logoUrl", "Logo link") && `Logo URL: ${pick("logoUrl", "Logo link")}`,
    list(pick("actions", "What should visitors do?")) && `Visitors should: ${list(pick("actions", "What should visitors do?"))}`,
    list(pick("pages", "Pages you want")) && `Pages wanted: ${list(pick("pages", "Pages you want"))}`,
    facts && `Real business details (use these exactly, do not invent different ones):\n${facts}`,
    pick("references") && `Websites they like: ${pick("references")}`,
    `Languages: ${pick("languages") || "English"}`,
    `UI Framework: ${ui}`,
    `Icon Pack: ${icons}`,
    pick("prefix") && `.NET prefix: ${pick("prefix")}`,
    `Scope: ${scope}`
  ].filter(Boolean);

  return [{ json: {
    source: fromHook ? "webhook" : "form",
    projectName: name,
    slug: slugify(String(pick("slug") || name)),
    scope,
    techStack: scope === "website" ? `Static website (${ui} + ${icons})` : ".NET 8 + Blazor + PostgreSQL, plus static website",
    requirements: lines.join("\n"),
    email: String(pick("email", "Your email")).trim(),
    hasUploadedLogo: !!pick("logoDataUrl")
  } }];
}

function loadKnowledge() {
  const brief = $("Normalize Brief").first().json;
  const names = $("List Knowledge").all().map(i => i.json.name);
  const files = $input.all()
    .map((it, i) => ({ name: names[i] || `file${i}`, text: String(it.json.data || "") }))
    .filter(f => /\.(md|txt)$/i.test(f.name) && f.text.trim());
  if (!files.length) throw new Error("Knowledge base is empty: add .md files to the knowledge/ folder in GitHub");

  // which rule files each agent gets (by file number); smaller, focused prompts = faster and better output
  const map = {
    "Architect":      ["00", "03", "05", "06", "10"],
    "DB Designer":    ["00", "05", "06", "08", "10"],
    "Stored Procs":   ["00", "05", "06", "10"],
    "Services & API": ["00", "03", "04", "05", "06", "08", "10", "12"],
    "UI Design":      ["00", "01", "03", "09", "10", "11"],
    "Static Site":    ["00", "01", "02", "08", "09", "10", "11", "12"],
    "Fixer":          ["00", "02", "03", "05", "09", "12"],
    "Test Engineer":  ["00", "07", "08", "10"]
  };
  const pick = nums => files.filter(f => nums.some(n => f.name.startsWith(n)))
    .map(f => `## ${f.name}\n${f.text}`).join("\n\n");
  const rulesFor = {};
  for (const [agent, nums] of Object.entries(map)) rulesFor[agent] = pick(nums);
  return [{ json: { ...brief, rulesFor } }];
}

function collectFiles() {
  const names = ["Architect", "DB Designer", "Stored Procs", "Services & API", "UI Design", "Static Site"];
  const seen = new Map();
  for (const name of names) {
    let items = [];
    try { if (!$(name).isExecuted) continue; items = $(name).all(); } catch (e) { continue; }
    for (const item of items) {
      for (const f of ((item.json.output && item.json.output.files) || [])) {
        if (!f || !f.path) continue;
        const clean = String(f.path).replace(/\\/g, "/").split("/").filter(p => p && p !== ".." && p !== ".").join("/");
        if (clean && !seen.has(clean)) seen.set(clean, String(f.content || ""));
      }
    }
  }
  if (!seen.size) throw new Error("No files were generated");
  return [{ json: { files: [...seen].map(([path, content]) => ({ path, content })) } }];
}

function prepareFix() {
  const qg = $input.first().json;
  const paths = new Set();
  for (const f of qg.fails) { const m = f.message.match(/^((?:site|src|db|docs|tests)\/[^\s:]+)/); if (m) paths.add(m[1]); }
  if (!paths.size) paths.add("site/index.html");
  const files = [...paths].map(p => qg.files.find(f => f.path === p) || { path: p, content: "" });
  const prompt = Object.values(qg.feedback).join("\n\n") +
    "\n\nFiles to fix (current content; an empty content means the file is missing and must be created):\n" + JSON.stringify(files);
  return [{ json: { prompt, fixCount: files.length } }];
}

function applyFixes() {
  const base = $("Quality Gate").first().json.files;
  const fixes = ($input.first().json.output && $input.first().json.output.files) || [];
  const map = new Map(base.map(f => [f.path, f.content]));
  for (const f of fixes) {
    if (!f || !f.path) continue;
    const clean = String(f.path).replace(/\\/g, "/").split("/").filter(p => p && p !== ".." && p !== ".").join("/");
    const content = String(f.content || "");
    const old = map.get(clean) || "";
    if (content.length >= old.length * 0.6) map.set(clean, content); // never replace a file with a much shorter "fix"
  }
  return [{ json: { files: [...map].map(([path, content]) => ({ path, content })), fixedFiles: fixes.length } }];
}

async function finalFiles() {
  const brief = $("Normalize Brief").first().json;
  const files = $input.first().json.files;
  const binary = {};
  let i = 0;
  for (const f of files) {
    const fullPath = brief.slug + "/" + f.path;
    const bin = await this.helpers.prepareBinaryData(Buffer.from(f.content, "utf8"), fullPath, "text/plain");
    bin.fileName = fullPath;
    binary["file" + i++] = bin;
  }
  return [{ json: { files, totalFiles: i }, binary }];
}

// ---------- Build Commit: keep the original .NET safety net, read files from "Final Files" ----------
const originalBuildCommit = JSON.parse(fs.readFileSync(path.join(__dirname, "build-commit.original.json"), "utf8")).jsCode;
const cut = originalBuildCommit.indexOf("// ---- .NET safety net");
if (cut < 0) throw new Error("build-commit.original.js: safety-net marker not found");
const buildCommit = `const brief = $('Normalize Brief').first().json;
const root = brief.slug;
const form = { 'Project Name': brief.projectName };
const tree = $('Final Files').first().json.files.map(f => ({ path: \`projects/\${root}/\${f.path}\`, mode: '100644', type: 'blob', content: f.content }));
` + originalBuildCommit.slice(cut);

const qualityGate = fs.readFileSync(path.join(__dirname, "..", "tools", "quality-gate.n8n-cloud.js"), "utf8");

// ---------- helpers for agent groups ----------
const JSON_RULE = "Return only valid JSON matching the schema. No markdown fences, no extra text.";
function agent(name, x, prompt, system, model, temperature, retry = true) {
  add({ name, type: "@n8n/n8n-nodes-langchain.agent", typeVersion: 3.1, position: [x, -192],
    parameters: { promptType: "define", text: prompt, hasOutputParser: true, options: { systemMessage: system } } });
  add({ name: `Model - ${name}`, type: "@n8n/n8n-nodes-langchain.lmChatGoogleGemini", typeVersion: 1.2, position: [x + 16, 48],
    parameters: { modelName: model, options: { maxOutputTokens: 65536, temperature } }, credentials: GEM });
  add({ name: `Parser - ${name}`, type: "@n8n/n8n-nodes-langchain.outputParserStructured", typeVersion: 1.3, position: [x + 144, 48],
    parameters: { jsonSchemaExample: "{\"summary\":\"\",\"files\":[{\"path\":\"\",\"content\":\"\"}]}" },
    ...(retry ? { retryOnFail: true, maxTries: 2 } : {}) });
}
const rules = a => `\n\nFollow these company rules strictly. If a rule conflicts with the request, follow the rule and add a note in "summary".\n{{ $('Load Knowledge').first().json.rulesFor['${a}'] }}`;
const arch = `{{ $('Architect').isExecuted ? 'Architecture:\\n' + $('Architect').first().json.output.files[0].content : '' }}`;
const ifNode = (name, x, y, left, op) => add({ name, type: "n8n-nodes-base.if", typeVersion: 2.2, position: [x, y], parameters: {
  conditions: { options: { caseSensitive: true, leftValue: "", typeValidation: "loose" },
    conditions: [{ id: id(), leftValue: left, rightValue: op.right ?? "", operator: op.operator }], combinator: "and" }, options: {} } });

// ---------- triggers ----------
add({ name: "Project Request", type: "n8n-nodes-base.formTrigger", typeVersion: 2.6, position: [-528, -192], webhookId: "2c74fd8f-0bed-4140-a914-38d33c12d92b",
  parameters: { formTitle: "Build my website", formDescription: "Answer in plain words. Only the first three questions are required.",
    formFields: { values: [
      { fieldLabel: "Business name", requiredField: true, placeholder: "e.g. Pulse Fitness Studio" },
      { fieldLabel: "What does your business do?", fieldType: "textarea", requiredField: true, placeholder: "What you sell, who your customers are, what makes you different" },
      { fieldLabel: "City and country", requiredField: true, placeholder: "e.g. Dubai Marina, UAE" },
      { fieldLabel: "Colours or feeling", placeholder: "e.g. black and gold / calm and natural / leave empty" },
      { fieldLabel: "Logo link", placeholder: "https://..." },
      { fieldLabel: "Pages you want", placeholder: "e.g. Home, Services, Pricing, Contact" },
      { fieldLabel: "Real details you already have", fieldType: "textarea", placeholder: "Prices, opening hours, phone, address, services" },
      { fieldLabel: "What should we build?", fieldType: "dropdown", fieldOptions: { values: [{ option: "Website" }, { option: "Website + admin app" }, { option: "Full system (website, app, database, API)" }] } },
      { fieldLabel: "Icon Pack", fieldType: "dropdown", fieldOptions: { values: [{ option: "Lucide" }, { option: "Phosphor" }, { option: "Boxicons" }, { option: "Bootstrap Icons" }] } },
      { fieldLabel: "Your email", fieldType: "email" }
    ] }, options: {} } });
add({ name: "Platform Webhook", type: "n8n-nodes-base.webhook", typeVersion: 2, position: [-528, 16], webhookId: id(),
  parameters: { httpMethod: "POST", path: "new-project", responseMode: "onReceived", options: { allowedOrigins: "https://meghana-m-revankar.github.io,http://localhost:5600" } } });
add({ name: "Normalize Brief", type: "n8n-nodes-base.code", typeVersion: 2, position: [-304, -80], parameters: { jsCode: body(normalizeBrief) } });

// ---------- knowledge ----------
add({ name: "List Knowledge", type: "n8n-nodes-base.httpRequest", typeVersion: 4.5, position: [-80, -80], credentials: GH,
  parameters: { url: "https://api.github.com/repos/meghana-m-revankar/ai-builder/contents/knowledge", authentication: "genericCredentialType", genericAuthType: "httpHeaderAuth", options: {} } });
add({ name: "Get Knowledge File", type: "n8n-nodes-base.httpRequest", typeVersion: 4.5, position: [144, -80], credentials: GH,
  parameters: { method: "GET", url: "={{ $json.url }}", authentication: "genericCredentialType", genericAuthType: "httpHeaderAuth", sendHeaders: true,
    headerParameters: { parameters: [{ name: "Accept", value: "application/vnd.github.raw" }] }, options: { response: { response: { responseFormat: "text" } } } } });
add({ name: "Load Knowledge", type: "n8n-nodes-base.code", typeVersion: 2, position: [368, -80], parameters: { jsCode: body(loadKnowledge) } });
ifNode("Website only?", 592, -80, "={{ $json.scope }}", { right: "website", operator: { type: "string", operation: "equals" } });

// ---------- full-stack chain (only when scope is not "website") ----------
agent("Architect", 816,
  `=Project: {{ ${B}.projectName }}\nTech stack: {{ ${B}.techStack }}\nBrief:\n{{ ${B}.requirements }}\n\nCreate ONE file at path docs/architecture.md as described in 03 Architecture → "Documentation the Architect must produce". State the .NET prefix at the top. Put it FIRST in the files list.`,
  `=You are a senior software architect. Produce a clear, practical architecture document.\n${JSON_RULE}` + rules("Architect"), FAST, 0.2);
agent("DB Designer", 1168,
  `=Architecture:\n{{ $('Architect').first().json.output.files[0].content }}\n\nCreate db/schema.sql (FIRST) and db/seed.sql as described in 05 Database and 08 Seed Data.`,
  `=You are a senior PostgreSQL database designer.\n${JSON_RULE}` + rules("DB Designer"), FAST, 0.2);
agent("Stored Procs", 1520,
  `=Architecture:\n{{ $('Architect').first().json.output.files[0].content }}\nSchema:\n{{ $('DB Designer').first().json.output.files[0].content }}\n\nCreate ONE file db/procedures.sql: CRUD for every table plus the business procedures from the architecture (05 Database).`,
  `=You are a senior PostgreSQL developer (PL/pgSQL).\n${JSON_RULE}` + rules("Stored Procs"), FAST, 0.2);
agent("Services & API", 1872,
  `=Architecture:\n{{ $('Architect').first().json.output.files[0].content }}\nSchema:\n{{ $('DB Designer').first().json.output.files[0].content }}\n\nWrite the backend solution exactly as in 10 Agent Tasks → Services & API, in the write order given there. Program.cs is copied from the 03 Architecture template.`,
  `=You are a senior .NET 8 backend developer. Write code that compiles with TreatWarningsAsErrors.\n${JSON_RULE}` + rules("Services & API"), FAST, 0.2);
agent("UI Design", 2224,
  `=Brief:\n{{ ${B}.requirements }}\nArchitecture:\n{{ $('Architect').first().json.output.files[0].content }}\n\nWrite docs/ui-design.md and the COMPLETE Blazor project src/<Prefix>.Web exactly as in 10 Agent Tasks → UI Design and 03 Architecture → Blazor Web project.`,
  `=You are a senior product designer and Blazor developer. Pages use Tailwind and the design system so the app looks like a premium SaaS product.\n${JSON_RULE}` + rules("UI Design"), STRONG, 0.4);

// ---------- static site (always) ----------
agent("Static Site", 2576,
  `=Project: {{ ${B}.projectName }}\nBrief:\n{{ ${B}.requirements }}\n${arch}\n\nBuild the complete static website inside site/ exactly as described in 02 Static Site, 09 Site Template and 11 Section Recipes.\n1. Start "summary" with your page plan: each page and its recipe numbers.\n2. Write files in this order: site/css/style.css, site/js/tailwind.config.js, site/js/data.js, site/js/app.js, site/assets/logo.svg, site/index.html, then the other pages.\n3. Copy every renderer from 09 Site Template; replace all content for this business.\n4. End "summary" with the plain-language part from 00 Start Here (What you got / Assumptions / How to view it).`,
  `=You are a senior product designer and senior front-end developer at once. Every page must look like a premium, Dribbble-quality product site; bland output is a failure. Write every file completely.\n${JSON_RULE}` + rules("Static Site"), STRONG, 0.5);

// ---------- quality gate + one fix pass ----------
add({ name: "Collect Files", type: "n8n-nodes-base.code", typeVersion: 2, position: [2928, -80], parameters: { jsCode: body(collectFiles) } });
add({ name: "Quality Gate", type: "n8n-nodes-base.code", typeVersion: 2, position: [3152, -80], parameters: { jsCode: qualityGate } });
ifNode("Passed?", 3376, -80, "={{ $json.passed }}", { operator: { type: "boolean", operation: "true", singleValue: true } });
add({ name: "Prepare Fix", type: "n8n-nodes-base.code", typeVersion: 2, position: [3600, 64], parameters: { jsCode: body(prepareFix) } });
agent("Fixer", 3824, "={{ $json.prompt }}",
  `=You fix generated projects so they pass the quality gate. Return ONLY the listed files, each COMPLETE (never shortened), with the problems fixed and everything else kept.\n${JSON_RULE}` + rules("Fixer"), STRONG, 0.3);
nodes.find(n => n.name === "Fixer").position = [3824, 64];
nodes.find(n => n.name === "Model - Fixer").position = [3840, 288];
nodes.find(n => n.name === "Parser - Fixer").position = [3968, 288];
add({ name: "Apply Fixes", type: "n8n-nodes-base.code", typeVersion: 2, position: [4176, 64], parameters: { jsCode: body(applyFixes) } });
add({ name: "Final Files", type: "n8n-nodes-base.code", typeVersion: 2, position: [4400, -80], parameters: { jsCode: body(finalFiles) } });

// ---------- package + download (form only) ----------
add({ name: "Zip Project", type: "n8n-nodes-base.compression", typeVersion: 1.1, position: [4624, -80],
  parameters: { operation: "compress", binaryPropertyName: "={{ Object.keys($binary).join(',') }}", fileName: `={{ ${B}.slug }}.zip` } });
ifNode("From form?", 4848, -256, `={{ ${B}.source }}`, { right: "form", operator: { type: "string", operation: "equals" } });
add({ name: "Download Page", type: "n8n-nodes-base.form", typeVersion: 2.5, position: [5072, -256], executeOnce: true, webhookId: "6655fdb5-b57f-4136-bcbf-ee356e091a1b",
  parameters: { operation: "completion", respondWith: "returnBinary", completionTitle: "Your project is ready",
    completionMessage: `={{ 'Preview: https://meghana-m-revankar.github.io/ai-builder/projects/' + ${B}.slug + '/site/  (live in about 1 minute). Download the full project zip below.' }}`, options: {} } });

// ---------- commit to GitHub (unchanged logic) ----------
const ghReq = (name, x, p) => add({ name, type: "n8n-nodes-base.httpRequest", typeVersion: 4.5, position: [x, -80], credentials: GH,
  parameters: { authentication: "genericCredentialType", genericAuthType: "httpHeaderAuth", options: {}, ...p } });
add({ name: "Build Commit", type: "n8n-nodes-base.code", typeVersion: 2, position: [4848, -80], parameters: { jsCode: buildCommit } });
ghReq("Get Main", 5072, { url: "https://api.github.com/repos/meghana-m-revankar/ai-builder/git/ref/heads/main" });
ghReq("Get Commit", 5296, { url: "=https://api.github.com/repos/meghana-m-revankar/ai-builder/git/commits/{{ $('Get Main').first().json.object.sha }}" });
ghReq("Get Old Files", 5520, { url: "=https://api.github.com/repos/meghana-m-revankar/ai-builder/git/trees/{{ $('Get Commit').first().json.tree.sha }}?recursive=1" });
add({ name: "Prepare Tree", type: "n8n-nodes-base.code", typeVersion: 2, position: [5744, -80], parameters: { jsCode:
  "const build = $('Build Commit').first().json;\nconst prefix = `projects/${build.root}/`;\nconst keep = new Set(build.tree.map(t => t.path));\nconst oldFiles = ($input.first().json.tree || []).filter(t => t.type === 'blob' && t.path.startsWith(prefix) && !keep.has(t.path));\nconst deletions = oldFiles.map(t => ({ path: t.path, mode: '100644', type: 'blob', sha: null }));\nreturn [{ json: { tree: build.tree.concat(deletions), added: build.tree.length, deleted: deletions.length } }];\n" } });
ghReq("Create Tree", 5968, { method: "POST", url: "https://api.github.com/repos/meghana-m-revankar/ai-builder/git/trees", sendBody: true, specifyBody: "json",
  jsonBody: "={{ JSON.stringify({ base_tree: $('Get Commit').first().json.tree.sha, tree: $('Prepare Tree').first().json.tree }) }}" });
ghReq("Create Commit", 6192, { method: "POST", url: "https://api.github.com/repos/meghana-m-revankar/ai-builder/git/commits", sendBody: true, specifyBody: "json",
  jsonBody: "={{ JSON.stringify({ message: $('Build Commit').first().json.message, tree: $('Create Tree').first().json.sha, parents: [ $('Get Main').first().json.object.sha ] }) }}" });
ghReq("Update Main", 6416, { method: "POST", url: "https://api.github.com/repos/meghana-m-revankar/ai-builder/git/refs/heads/main", sendBody: true, specifyBody: "json",
  jsonBody: "={{ JSON.stringify({ sha: $json.sha }) }}" });

// ---------- connections ----------
const connections = {};
const main = (from, to, out = 0) => { ((connections[from] ||= { main: [] }).main[out] ||= []).push({ node: to, type: "main", index: 0 }); };
const ai = (from, to, kind) => { (connections[from] ||= {})[kind] = [[{ node: to, type: kind, index: 0 }]]; };
for (const a of ["Architect", "DB Designer", "Stored Procs", "Services & API", "UI Design", "Static Site", "Fixer"]) {
  ai(`Model - ${a}`, a, "ai_languageModel"); ai(`Parser - ${a}`, a, "ai_outputParser");
}
main("Project Request", "Normalize Brief"); main("Platform Webhook", "Normalize Brief");
main("Normalize Brief", "List Knowledge"); main("List Knowledge", "Get Knowledge File"); main("Get Knowledge File", "Load Knowledge");
main("Load Knowledge", "Website only?");
main("Website only?", "Static Site", 0); main("Website only?", "Architect", 1);
main("Architect", "DB Designer"); main("DB Designer", "Stored Procs"); main("Stored Procs", "Services & API"); main("Services & API", "UI Design"); main("UI Design", "Static Site");
main("Static Site", "Collect Files"); main("Collect Files", "Quality Gate"); main("Quality Gate", "Passed?");
main("Passed?", "Final Files", 0); main("Passed?", "Prepare Fix", 1);
main("Prepare Fix", "Fixer"); main("Fixer", "Apply Fixes"); main("Apply Fixes", "Final Files");
main("Final Files", "Zip Project"); main("Zip Project", "From form?"); main("Zip Project", "Build Commit");
main("From form?", "Download Page", 0);
main("Build Commit", "Get Main"); main("Get Main", "Get Commit"); main("Get Commit", "Get Old Files"); main("Get Old Files", "Prepare Tree");
main("Prepare Tree", "Create Tree"); main("Create Tree", "Create Commit"); main("Create Commit", "Update Main");

const workflow = { name: "AI Builder v2", nodes, connections, pinData: {}, settings: { executionOrder: "v1" } };
const out = path.join(__dirname, "ai-builder-workflow.json");
fs.writeFileSync(out, JSON.stringify(workflow, null, 2));
console.log(`Wrote ${out} with ${nodes.length} nodes`);
