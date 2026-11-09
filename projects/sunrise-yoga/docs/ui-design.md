# UI Design Specification: Sunrise Yoga

## 1. General Design Principles
- **Typography**: Plus Jakarta Sans for headings, Inter for body.
- **Color Palette**: Brand-700 (Ocean Deep: #1E3A8A), Brand-100 (Sky Mist: #E7ECFB), Accent-500 (Golden Morning: #F97316).
- **Spacing**: Generous, using --space-section tokens (clamp(4rem, ..., 6rem)).
- **Components**: Rounded corners (12px on cards), soft shadows, Lucide icons.

## 2. Pages
### Home (index.html)
- **Purpose**: Hero CTA, value prop, quick overview.
- **Layout**: Hero section (full width image with overlay), Features grid (bento-style), Testimonial carousel, CTA footer.
- **Actions**: "Book Now", "View Schedule".

### Classes (classes.html)
- **Purpose**: Informational page detailing class types.
- **Layout**: List of class cards (image, description, level badge).
- **Actions**: "View Schedule" button per class type.

### Schedule (schedule.html)
- **Purpose**: Weekly timetable.
- **Layout**: `table-responsive` component with filters (Morning/Evening).
- **Actions**: "Reserve" link on every time slot.

### About (about.html)
- **Purpose**: Trust building.
- **Layout**: Instructor headshots (cards), Philosophy section with photo.
- **Actions**: Social media links.

### Contact (contact.html)
- **Purpose**: Lead capture.
- **Layout**: Split screen: Map on left, Inquiry form on right.
- **Fields**: Name, Email, Class Interest, Message.
- **Actions**: Submit button.
