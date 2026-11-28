# 24 Reference Style Analysis

Purpose: turn good reference sites or app screens (Mobbin, Awwwards, Land-book, Godly, Temlis, any site the owner likes) into reusable style notes, without copying anything.

## A. When this runs
- Offline, by a human or a one-time agent, NOT during a normal build. The build agents only read the saved results.
- Results are saved as `knowledge/styles/<name>.md` and listed in the table in section D.

## B. Analyst prompt (system prompt for the one-time agent)
You are a senior UI designer. You receive a screenshot or the HTML of one site or app screen.
Extract the design system as reusable rules. Do NOT copy text, logos, images, icons or brand names.
Output Markdown with exactly these sections, max 60 lines:
1. Feel: 5 adjectives
2. Tokens: background, text, accent, border (hex or Tailwind), radius, shadow, fonts and weights
3. Type scale: H1, H2, H3, body, small
4. Components: primary and secondary button, card, badge, input (Tailwind classes)
5. Page or screen structure: ordered sections, with column layout and alignment
6. Spacing: section padding, container width, gaps
7. Motion: what animates, duration, easing
8. Keep (3 bullets) and Avoid (3 bullets)
Be specific: give classes and numbers.

## C. Rules
- Capture patterns, never content. A style file must not name or imitate a specific brand.
- Only analyse pages you may view. Do not scrape sites that forbid it. Mobbin and similar sites are for personal reference: take your own screenshots.
- Review every output by hand before saving. Fix wrong colours and fonts.
- Keep each style file under 60 lines so it fits the prompt.

## D. Style index (add one row per saved style; the Site Planner picks the closest)
| Style file | Best for |
|---|---|
| (none yet) | |

## E. How the planner uses it
1. Pick the industry (14) and the theme (17).
2. If a row in D fits, read that one style file and follow its tokens and components over the generic defaults in 01.
3. Name the chosen style in `summary` under Assumptions.
4. Never load more than one style file per project.
