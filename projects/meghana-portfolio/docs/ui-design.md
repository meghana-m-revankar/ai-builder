# UI Design: Meghana Portfolio

## Overview
A minimalist, high-contrast, and performant portfolio website. The design focuses on readability, clear typography, and a modern "Bento grid" aesthetic for projects.

## Pages

### index.html (Single Page Application)

#### 1. Navigation (Sticky)
- **Purpose**: Facilitate easy navigation across sections.
- **Layout**: Logo (left), Nav links (About, Projects, Skills, Contact), Theme Toggler (Sun/Moon icon).
- **Actions**: Smooth scroll navigation, theme switch.

#### 2. Hero Section
- **Purpose**: Immediate identification and value proposition.
- **Layout**: Large headline (72px), subtitle, CTA (Primary: "View Projects", Secondary: "Download Resume").
- **Actions**: Smooth scroll to Projects section, trigger file download.

#### 3. About Section
- **Purpose**: Personal narrative and professional summary.
- **Layout**: Two-column layout (Left: Text, Right: Profile image with soft shadow).
- **Actions**: None.

#### 4. Projects Section (Bento Grid)
- **Purpose**: Showcase professional work.
- **Layout**: 3-column responsive grid using Bootstrap `row`. Each card features: image, title, description, tags, and links.
- **Actions**: View Project link, View Source link.

#### 5. Skills Section
- **Purpose**: Highlight technical expertise.
- **Layout**: Flexbox container with pills for each skill.
- **Actions**: None.

#### 6. Contact Section
- **Purpose**: Lead generation.
- **Layout**: Simple form with Name, Email, Subject, Message fields.
- **Actions**: Submit (with client-side validation, showing success message).

#### 7. Footer
- **Purpose**: Standard utility links and branding.
- **Layout**: Three columns: Branding, Social Links, Copyright.
