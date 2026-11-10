# 00 Start Here

Read this first. It applies to every project and every agent.

## Who writes the brief
The brief may come from a developer or from a business owner with no technical knowledge. It may be one sentence ("website for my yoga studio in Pune"). Never ask the user to fill in technical details and never stop because a field is missing. Fill every gap with the defaults below and list them in `summary` under "Assumptions", in plain language.

## Defaults when the brief is silent
| Missing | Use |
|---|---|
| Business type | Infer from the name and description; pick the closest page plan in 11 Section Recipes |
| Pages | Home + 3-4 inner pages from the page plan (e.g. Services, About, Pricing, Contact/Booking) |
| Location, currency, phone format | From the city/country if named; otherwise neutral English, USD, `+1 555 0100` style numbers |
| Language | English |
| UI framework | Tailwind |
| Icon pack | Lucide |
| Colours | See "Colour scheme" below |
| Images | Image Library from the brief, else picsum seeds per 01 Design System → Imagery |
| Copy | Write it yourself: specific, benefit-led, matching the business. Invent realistic but clearly sample details (opening hours, prices, team names) |
| Backend features | The 3 most obvious ones for the business (e.g. bookings, customers, payments) |

## Colour scheme (use the first source that exists)
1. **Brand Palette from the logo** (hex values in the brief): build all tokens from it as in 01 Design System → Brand colours from the logo.
2. **Logo URL only, no palette**: show the logo, and take the colours from anything the brief says about it ("our logo is green and gold"). If nothing is said, use step 4 and choose a palette that sits well next to a neutral logo.
3. **Colours or mood described in words** ("we like black and gold", "calm and natural", "bold and energetic"): turn them into hex values. Main colour → brand-700; darker shade → brand-900; lighter → brand-500; ~92% white tint → brand-100; second colour or a complementary hue → accent-500.
4. **Nothing given**: choose by industry. Wellness/yoga: teal + sage. Food/bakery: warm brown + amber. Fitness: deep navy + electric orange. Beauty/salon: plum + rose. Finance/legal: navy + emerald. Tech/SaaS: indigo + cyan. Kids/education: royal blue + sunny yellow. Real estate: charcoal + brass.

Always: keep neutral and status colours from 01 Design System, check contrast (white on brand-700 >= 4.5:1, darken if not), use the accent for one main call to action per screen, and write the chosen colours and their source under "Assumptions".

## Plain-language summary (for non-technical readers)
End `summary` with 3 short parts, no jargon:
1. **What you got** - the pages and features, in everyday words.
2. **Assumptions** - what was guessed and how to change it ("Prices are samples - send your real prices").
3. **How to view it** - the preview link or the one command to open it.

## Order of priority when rules compete
1. It works (builds, opens, every button does something).
2. It looks premium (01 Design System, 11 Section Recipes - bland is a failure).
3. It follows the code rules (02-07).
4. It is small and tidy.

## Definition of done (every agent)
Follow 13 Build and Deploy: the project is compiled and started in Docker, and code that does not compile or SQL that does not run is a failed project. Image seeds must describe the photo.

Run through 12 Quality Gate for your files before you answer. The pipeline runs the same checks automatically and sends failures back to you.
