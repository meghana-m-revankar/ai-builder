# Asha Foundation - Architecture & Site Structure

## Overview
Asha Foundation is a non-profit NGO based in Bengaluru providing free education, meals, and school supplies to children from low-income families. As a charity platform rather than a commercial business, the site focuses on warmth, hope, trust, high emotional resonance, and frictionless conversion toward donations and volunteering.

- **Tech Stack:** Static HTML5, CSS3, Tailwind CSS (via CDN), Alpine.js / Vanilla JavaScript for interactivity.
- **Design System:** Warm, hopeful, trustworthy.
  - Primary Colour: Deep Green (`#166534` / emerald-800)
  - Accent Colour: Warm Yellow (`#F59E0B` / amber-500)
  - Neutral Backgrounds: Warm Off-White (`#FEFCE8` / yellow-50)
  - Typography: Inter or Outfit for clean, modern readability.

---

## Site Structure & Pages

1. **Home (`index.html`)**
   - **Hero:** Powerful photo of children learning, headline, CTA buttons ("Donate Now", "Become a Volunteer").
   - **Impact Stats:** 5,000+ children supported, 120 volunteers, 18 partner schools, 2,40,000 meals served.
   - **Mission Statement:** Brief inspiring overview of the NGO's purpose.
   - **Core Programs:** 3 preview cards (Education, Meals, Kits).
   - **Success Story:** Spotlighting a child or community transformation.
   - **Financial Transparency / Fund Usage:** Breakdown (e.g., 85% Program Delivery, 10% Admin, 5% Fundraising).
   - **Testimonials:** Parent and volunteer quotes.
   - **Partners / Supporters Strip:** Logo grid of partner schools and supporters.
   - **FAQ:** Common questions regarding donations, tax exemptions, and volunteering.
   - **Bottom CTA:** Final call to action.

2. **About (`about.html`)**
   - **Our Story:** Journey since 2012.
   - **Founder Message:** Vision and inspiration.
   - **Mission & Vision:** Core tenets.
   - **Milestones Timeline:** Key achievements year by year.
   - **Team & Trustees:** Leadership profiles with photos.
   - **Legal & Compliance:** 80G and 12A tax exemption details, registered NGO registration number.

3. **Programs (`programs.html`)**
   - **Overview:** Introduction to holistic child development.
   - **Program 1: Education for All** (After-school tutoring, digital literacy, remedial classes).
   - **Program 2: Mid-Day Meals** (Nutritious mid-day meals and milk distribution).
   - **Program 3: School Kits** (Notebooks, uniforms, bags, and stationery distribution).
   - **Program 4: Girl Child Scholarship** (Financial support to prevent dropouts in secondary school).
   - Each program includes impact metrics, detailed description, photos, and a "Support this program" button linking directly to the Donation page.

4. **Donate (`donate.html`)**
   - **Donation Options:** One-Time / Monthly toggle.
   - **Preset Amount Buttons:** ₹500, ₹1,000, ₹2,500, ₹5,000, Custom.
   - **Impact Calculator / Explanation:** Showing what each amount achieves (e.g., "₹500 = school kit for 1 child for a year").
   - **Donor Information Form:** Name, Email, Phone, PAN (for 80G receipt).
   - **Tax Benefit Note:** Highlight 80G tax exemption.
   - **Direct Bank Transfer / UPI Card:** QR code placeholder, UPI ID, Bank Account details.

5. **Volunteer (`volunteer.html`)**
   - **Why Volunteer:** Impact on personal growth and community welfare.
   - **Roles Available:** Teaching & Mentoring, Event Organization, Fundraising & Outreach.
   - **Volunteer Sign-Up Form:** Name, Contact, Preferred Role, Availability.
   - **Volunteer Stories:** First-hand experiences from active volunteers.

6. **Contact (`contact.html`)**
   - **Contact Details:** Bengaluru office address, phone number, email address, office hours.
   - **Map:** Embedded Google Maps placeholder for the Bengaluru office.
   - **Contact Form:** Name, Email, Subject, Message.

---

## Folder Structure

```
asha-foundation/
├── index.html
├── about.html
├── programs.html
├── donate.html
├── volunteer.html
├── contact.html
├── css/
│   └── custom.css
├── js/
│   └── main.js
└── images/
    ├── hero-children.jpg
    ├── founder.jpg
    ├── program-education.jpg
    ├── program-meals.jpg
    ├── program-kits.jpg
    ├── program-scholarship.jpg
    ├── success-story.jpg
    ├── partners/
    │   ├── partner-1.png
    │   └── partner-2.png
    └── volunteers/
        └── vol-1.jpg
