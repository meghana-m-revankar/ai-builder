"""Quality gate for generated projects (see knowledge/12-quality-gate.md).

Usage: python check_project.py <project-folder> [--build]
Prints one line per check (PASS/FAIL) and exits 1 if anything failed.
Feed the FAIL lines back to the agent that owns the file.
"""
import re
import subprocess
import sys
from pathlib import Path

ICON_PACKS = {
    "lucide": r"lucide(@|\.min\.js)",
    "phosphor": r"@phosphor-icons/web",
    "boxicons": r"boxicons@",
    "bootstrap-icons": r"bootstrap-icons@",
}
ICON_USE = r'data-lucide="|class="[^"]*\b(ph|ph-fill|bx|bxs|bxl|bi)\s+[a-z-]+'
FORBIDDEN = {
    r'style="': "inline style attribute",
    r"onclick=": "inline event handler",
    r'href="#"': "dead link href=\"#\"",
    r"(?i)lorem ipsum": "lorem ipsum text",
    r"(?i)feature 1\b": "placeholder copy 'Feature 1'",
    r"(?i)#0d6efd": "default Bootstrap blue",
}
results: list[tuple[bool, str]] = []


def check(ok: bool, msg: str) -> None:
    results.append((ok, msg))


def kb(p: Path) -> float:
    return p.stat().st_size / 1024 if p.exists() else 0


def check_site(site: Path) -> None:
    for rel, minimum in {"index.html": 15, "css/style.css": 6, "js/app.js": 4, "js/data.js": 2}.items():
        size = kb(site / rel)
        check(size >= minimum, f"site/{rel}: {size:.1f} KB (min {minimum} KB)")

    pages = sorted(site.glob("*.html"))
    check(len(pages) >= 3, f"site: {len(pages)} HTML pages (min 3)")
    app_js = (site / "js/app.js").read_text("utf-8", "ignore") if (site / "js/app.js").exists() else ""
    data_js = (site / "js/data.js").read_text("utf-8", "ignore") if (site / "js/data.js").exists() else ""

    for page in pages:
        html = page.read_text("utf-8", "ignore")
        name = f"site/{page.name}"
        check("<title>" in html, f"{name}: has <title>")
        check('name="description"' in html, f"{name}: has meta description")
        h1 = len(re.findall(r"<h1[\s>]", html))
        check(h1 == 1, f"{name}: {h1} <h1> (need exactly 1)")
        packs = [k for k, rx in ICON_PACKS.items() if re.search(rx, html)]
        check(len(packs) == 1, f"{name}: icon packs loaded = {packs or 'none'} (need exactly 1)")
        icons = len(re.findall(ICON_USE, html)) + len(re.findall(r'icon\(\s*"', app_js)) + len(re.findall(r'icon:\s*"', data_js))
        check(icons >= 15, f"{name}: ~{icons} icon uses (min 15)")
        if page.name == "index.html":
            sections = len(re.findall(r"<section[\s>]", html))
            check(sections >= 8, f"{name}: {sections} <section> (min 8)")
            imgs = len(re.findall(r"<img[\s>]", html)) + len(re.findall(r'image:\s*"', data_js))
            check(imgs >= 3, f"{name}: {imgs} images (min 3)")
        for rx, label in FORBIDDEN.items():
            n = len(re.findall(rx, html))
            check(n == 0, f"{name}: no {label}" + (f" (found {n})" if n else ""))
        for ref in re.findall(r'(?:href|src)="([^"#:?]+)"', html):
            if not ref.startswith(("//", "/")):
                check((site / ref).exists(), f"{name}: link target exists -> {ref}")
            else:
                check(False, f"{name}: absolute path not allowed -> {ref}")

    # every top-level collection used by app.js must be defined in data.js
    used = set(re.findall(r"\b([a-z][A-Za-z]+)\.(?:forEach|map|filter|find|length)\b", app_js))
    defined = set(re.findall(r"\bconst\s+([A-Za-z]+)\s*=", data_js))
    local = set(re.findall(r"\b(?:const|let)\s+([A-Za-z]+)\s*=", app_js)) | set(re.findall(r"\(([a-z][A-Za-z]*)\)\s*=>", app_js))
    missing = sorted(u for u in used - defined - local if u not in {"document", "window", "list", "wrap", "grid"})
    check(not missing, "site/js/data.js defines all collections app.js uses" + (f" (missing: {', '.join(missing)})" if missing else ""))


def check_dotnet(root: Path, build: bool) -> None:
    src = root / "src"
    for proj_dir in [p for p in src.iterdir() if p.is_dir()]:
        code = list(proj_dir.rglob("*.cs")) + list(proj_dir.rglob("*.razor"))
        if code:
            check(any(proj_dir.glob("*.csproj")), f"src/{proj_dir.name}: has .csproj")
        if proj_dir.name.endswith((".Api", ".Web")):
            for f in ["Program.cs", "appsettings.json", "Properties/launchSettings.json"]:
                check((proj_dir / f).exists(), f"src/{proj_dir.name}: has {f}")
    slns = list(root.glob("*.sln"))
    check(len(slns) == 1, f"root: {len(slns)} .sln file(s) (need 1)")
    if slns:
        sln = slns[0].read_text("utf-8", "ignore")
        for csproj in root.rglob("*.csproj"):
            check(csproj.name in sln, f"{slns[0].name} lists {csproj.name}")
    readme = (root / "README.md").read_text("utf-8", "ignore") if (root / "README.md").exists() else ""
    if "dotnet ef" in readme:
        check(any(root.rglob("Migrations")), "README uses 'dotnet ef' but no Migrations folder exists (see 05 Database)")
    if build and slns:
        r = subprocess.run(["dotnet", "build", str(slns[0]), "-nologo", "-v", "q"], capture_output=True, text=True)
        errors = sorted(set(l.strip() for l in r.stdout.splitlines() if ": error " in l))[:15]
        check(r.returncode == 0, "dotnet build succeeds" + ("" if r.returncode == 0 else ":\n    " + "\n    ".join(errors)))


def main() -> None:
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(2)
    root = Path(sys.argv[1]).resolve()
    if (root / "site").is_dir():
        check_site(root / "site")
    if (root / "src").is_dir():
        check_dotnet(root, "--build" in sys.argv)
    failed = [m for ok, m in results if not ok]
    for ok, m in results:
        print(("PASS " if ok else "FAIL ") + m)
    print(f"\n{len(results) - len(failed)}/{len(results)} checks passed")
    sys.exit(1 if failed else 0)


if __name__ == "__main__":
    main()
