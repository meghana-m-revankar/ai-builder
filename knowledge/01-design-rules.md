# Design rules (sample - edit to your own standards)

## Layout
- Mobile first. Must work at 375px width and on desktop.
- Max content width 1200px, centered, 16px side padding minimum.
- Every page has the same header (logo text + menu) and footer.

## Colours and type
- Primary: #1E3A8A (dark blue). Accent: #F97316 (orange) for buttons and approval actions only.
- Background: #F8FAFC. Text: #0F172A. Borders: #E2E8F0.
- Font: system-ui, -apple-system, "Segoe UI", Roboto, sans-serif. Base size 16px.

## Components
- Buttons: 8px radius, min height 40px, clear hover and focus state.
- Tables: zebra rows, sticky header, scroll horizontally on small screens.
- Forms: label above every field, required fields marked with *, inline error messages.
- Status badges for task states: Drafting (grey), Expert review (blue), Client approval (purple), Owner approval (orange), Live (green), Measuring (teal).

## Language
- Every page has an RU / EN language switch. All visible text exists in both languages.

## Accessibility
- Colour contrast at least 4.5:1. Every image has alt text. All actions usable by keyboard.

## Not allowed
- The only allowed external resource is Bootstrap 5 from the jsDelivr CDN (CSS and JS bundle). No other CDNs, web fonts or images from the internet.
- No lorem ipsum. Use realistic sample data.
