# Green Valley Public School - Architecture & Design Document

## Overview
Green Valley Public School is a bright, friendly, and trustworthy website for a CBSE-affiliated school located in Mysuru, Karnataka. The site is built with a clean, modern aesthetic featuring a light theme with warm green and yellow branding colours. It provides prospective and current parents, students, and staff with comprehensive information regarding academics, admissions, facilities, school leadership, and contact options.

## Tech Stack
- **HTML5**: Semantic markup for accessibility and SEO.
- **Tailwind CSS (CDN)**: Utility-first CSS framework for responsive and modern styling.
- **Vanilla JavaScript**: Lightweight interactive features such as mobile menu toggle, admission enquiry form validation, dynamic fee calculator, and tabbed interfaces.
- **FontAwesome / Google Fonts**: For iconography and typography (Inter & Poppins).

## Pages & File Structure
```
green-valley-school/
├── index.html            # Home page (Hero, stats, highlights, events, testimonials, CTA)
├── about.html            # About Us (History, mission, vision, leadership team)
├── academics.html        # Academics (Curriculum, CBSE affiliation, streams, sample timetable)
├── admissions.html       # Admissions (Process, fee structure table, enquiry form)
├── facilities.html       # Facilities (Labs, library, sports ground, smart classrooms gallery)
├── contact.html          # Contact Us (Address, phone, email, hours, map embed, contact form)
├── assets/
│   ├── css/
│   │   └── tailwind.config.js # Custom Tailwind configuration (colors: primary green, secondary yellow)
│   ├── js/
│   │   └── main.js           # Shared interactive scripts (mobile nav, form handling)
│   └── images/               # Optimized school photos, logos, and icons
└── README.md                 # Setup and run instructions
```

## Page Sections & Navigation

### 1. Global Navigation & Footer
- **Header**: Sticky top navigation bar featuring the school logo, links to Home, About Us, Academics, Admissions, Facilities, and Contact, with a prominent "Apply Now" call-to-action button. Mobile responsive hamburger menu.
- **Footer**: School address, contact details, working hours, quick links, CBSE affiliation badge, copyright notice, and social media links.

### 2. Home Page (`index.html`)
- **Hero Section**: Welcoming headline ("Nurturing Young Minds for a Brighter Future"), vibrant background image/gradient, and quick CTA buttons.
- **Key Statistics**: 1,800+ Students, 95% Board Results, 120+ Teachers, 19 Years of Excellence.
- **About Preview**: Brief introduction to Green Valley Public School led by Principal Dr. Lakshmi Prasad.
- **Highlights**: Modern infrastructure, holistic education, experienced faculty, safe transport.
- **Upcoming Events & News**: Notice board style cards for admissions, sports meet, and parent-teacher meetings.
- **Parent Testimonials**: Carousel/grid of positive feedback from parents.

### 3. About Us (`about.html`)
- **Our Story & History**: Founded in 2005 in Mysuru, growing into a premier educational institution.
- **Vision & Mission**: Commitment to academic excellence, moral integrity, and all-round development.
- **Leadership & Faculty**:
  - Dr. Lakshmi Prasad (Principal)
  - Ramesh Gowda (Vice Principal)
  - Ananya Shetty (Head of Science)
  - Farhan Ali (Sports Director)

### 4. Academics (`academics.html`)
- **Curriculum Overview**: CBSE curriculum from Nursery to Class 12.
- **Streams Offered (Class 11-12)**: Science (Physics, Chemistry, Biology/Mathematics) and Commerce (Accountancy, Business Studies, Economics).
- **Teaching Methodology**: Experiential learning, smart classrooms, remedial classes.
- **Sample Class Timetable**: Tabular view of daily periods and activities.

### 5. Admissions (`admissions.html`)
- **Admission Process**: Step-by-step guide (Enquiry -> Campus Visit -> Interaction -> Enrollment).
- **Fee Structure Table**:
  - Nursery: ₹45,000 / year
  - Class 1-5: ₹60,000 / year
  - Class 6-10: ₹75,000 / year
  - Class 11-12: ₹90,000 / year
  - Transport (Optional): ₹18,000 / year
- **Admission Enquiry Form**: Interactive form capturing student name, grade applying for, parent name, phone, email, and message.

### 6. Facilities (`facilities.html`)
- **Facilities Gallery**: High-resolution image cards with descriptions for:
  - Science & Computer Labs
  - Well-Stocked Library
  - Sports Ground & Indoor Games Arena
  - Smart Classrooms with Digital Boards
  - Safe Bus Transport Network

### 7. Contact Us (`contact.html`)
- **Contact Information**:
  - Address: 45 Ring Road, Vijayanagar 2nd Stage, Mysuru, Karnataka 570017
  - Phone: +91 821 456 7890
  - Email: info@greenvalleyschool.in
  - Hours: Mon - Fri: 8:00 AM - 3:30 PM, Saturday: 8:00 AM - 12:30 PM
- **Interactive Contact Form & Google Map Embed**: For general inquiries and campus visit bookings.

## Key Design Decisions
- **Static Site Performance**: Pure HTML and Tailwind CSS via CDN ensure lightning-fast load times and zero server-side maintenance overhead.
- **Friendly Colour Palette**: Forest/Emerald green combined with warm sunshine yellow to evoke trust, growth, and enthusiasm appropriate for a premier K-12 school.
- **Accessibility & Responsiveness**: Mobile-first design approach ensuring seamless navigation across smartphones, tablets, and desktops.
