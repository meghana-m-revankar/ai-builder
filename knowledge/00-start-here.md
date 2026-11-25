# 00 Start Here

Read this first. It applies to every project and every agent.

## Who writes the brief
The brief may come from a developer or from a business owner with no technical knowledge. It may be one sentence ("website for my yoga studio in Pune"). Never ask the user to fill in technical details and never stop because a field is missing. Fill **design and structure** gaps with the defaults below and list them in `summary` under "Assumptions", in plain language.

## The honesty rule (MUST, overrides every other file)
Never invent **real business facts**: address, phone, WhatsApp, email, prices, opening hours, founder or team names, licence / registration numbers, years in business, customer counts, ratings, reviews or testimonials.

- If the brief gives a fact, use it exactly.
- If it does not, write clearly marked **sample content** instead:
  - Wrap it in `<span class="sample" data-sample>…</span>` or put a small **Sample** badge on the card (`<span class="sample-badge">Sample</span>`).
  - Use obviously replaceable values: `+91 00000 00000`, `hello@yourbusiness.com`, `Your street, City`, `₹ —` or a price range like "from ₹XXX".
  - Testimonials: label the section "Sample reviews — replace with real ones".
- Design, copy tone, headings, section structure and imagery may be created freely. Only facts must be real or labelled Sample.
- In `summary` → "Assumptions", list every Sample item the owner must replace.

## Defaults when the brief is silent
| Missing | Use |
|---|---|
| Business type | Infer from the name and description; pick the industry in 14 Industries and the page plan in 11 Section Recipes |
| Pages | Home + 3-4 inner pages from the industry's page plan |
| Country / currency | From the city or country if named; otherwise India, ₹ (Indian number format) |
| Language | English |
| UI framework | Tailwind |
| Icon pack | Lucide (always) |
| Colours | See "Colour scheme" below and 17 Themes |
| Design direction | 2D Modern, unless the brief asks for 3D (see 15 Hero, Sections and 3D) |
| Images | Image Library from the brief, else picsum seeds per 01 Design System → Imagery |
| Copy | Write it yourself: specific, benefit-led, matching the business. Facts follow the honesty rule |
| Backend features | The 3 most obvious ones for the business (e.g. bookings, customers, payments) |

## Colour scheme (use the first source that exists)
1. **Brand palette from the logo** (hex values in the brief): build all tokens from it as in 01 Design System → Brand colours.
2. **Colours or mood described in words** ("black and gold", "calm and natural"): turn them into hex values.
3. **An existing website** being redesigned: keep its brand colours unless the owner asks to change them.
4. **Nothing given**: pick a theme from 17 Themes that fits the industry. Do not reuse the same theme for every project.

Always check contrast (white on brand-700 ≥ 4.5:1) and use the accent for one main call to action per screen.

## Plain-language summary (for non-technical readers)
End `summary` with 3 short parts, no jargon:
1. **What you got** - the pages and features, in everyday words.
2. **Replace these** - every Sample item ("Phone number is a sample - send your real number").
3. **How to view it** - the preview link or the one command to open it.

## Order of priority when rules compete
1. Honest: no invented facts (rule above).
2. It works (opens, every link and button does something, no console errors).
3. It is usable and fast on a phone (16 Production Standards).
4. It looks premium (01 Design System, 15, 17 - bland is a failure).
5. It follows the code rules (02-07) and is small and tidy.

## Which file is for whom
| File | Used by |
|---|---|
| 00, 20 Page Writer | every agent that writes pages |
| 01 Design System, 15 Hero/Sections/3D, 17 Themes | page writer, UI design |
| 02 Static Site, 02b Site Defaults, 09 Site Template, 11 Section Recipes | site planner, page writer |
| 14 Industries | site planner, page writer |
| 16 Production Standards | page writer, test engineer |
| 03-08 | architecture, database, backend, tests |
| 12 Quality Gate, 13 Build and Deploy | every agent before answering |

## Definition of done (every agent)
Run through 12 Quality Gate and 16 Production Standards for your files before you answer. The pipeline runs the same checks automatically and sends failures back to you.
