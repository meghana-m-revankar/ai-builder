# 25 Animation and Component Libraries

Extends 18 UI Libraries. Static sites only use CDN builds; React projects may use the React versions. Honour the licence of each source and the performance rules in 16.

## A. Animation
| Need | Use |
|---|---|
| Hero stagger, number counters, SVG path draw, timelines | Anime.js (CDN) |
| Scroll reveals | IntersectionObserver + CSS (no library) |
| Heavy 3D | Per 15 B3D rules only |

Rules: total entrance animation under 600 ms, ease-out, animate only `transform` and `opacity`, honour `prefers-reduced-motion`, never block content from showing.

## B. Charts
- Simple charts: Chart.js (see 18).
- Rich dashboards (many chart types, maps, heatmaps, large data): Apache ECharts via CDN, one chart per card, theme colours from the brand tokens, responsive resize on window change.

## C. Copy-paste component sources (React projects)
React Bits (animated backgrounds, tilt cards, galleries), Magic UI, Aceternity UI, shadcn/ui. Use at most 2 animated components per page. Check each component's licence before use. Do not use a library's demo copy, images or branding.

## D. Starter-template mode
When the site planner finds a matching template in `09 Site Template` or in a saved style (24 D), it edits that template instead of generating from scratch:
1. Keep the structure and components.
2. Replace tokens (colours, fonts) from the brand.
3. Replace all copy and images.
4. Delete sections the business does not need.
Never ship the template's original content.
