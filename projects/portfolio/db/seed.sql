-- Seed Data for Portfolio

-- Projects
insert into projects (id, title, description, technologies, project_url, image_url) values
('f47ac10b-58cc-4372-a567-0e02b2c3d479', 'Shopping Website', 'Full-featured e-commerce platform with cart and checkout.', '{React, Tailwind, Stripe}', 'https://example.com/shopping', 'https://picsum.photos/seed/shop/800/600'),
('b2a9d8c7-4f6e-4b3a-9c8d-7e6f5d4c3b2a', 'Business Dashboard', 'Analytics dashboard for visualizing business metrics.', '{TypeScript, Chart.js, Tailwind}', 'https://example.com/dashboard', 'https://picsum.photos/seed/dash/800/600'),
('e1c2d3b4-a5f6-4e7d-8c9b-0a1b2c3d4e5f', 'Mobile App UI', 'High-fidelity prototype for a fitness tracking application.', '{Figma, Adobe XD}', 'https://example.com/mobile-ui', 'https://picsum.photos/seed/mobile/800/600');

-- Skills
insert into skills (name, category, proficiency_level) values
('HTML', 'Frontend', 5),
('CSS', 'Frontend', 5),
('JavaScript', 'Frontend', 4),
('React', 'Frontend', 4),
('Figma', 'Design', 4),
('Tailwind CSS', 'Frontend', 5),
('Git', 'Tools', 4),
('Node.js', 'Backend', 3),
('PostgreSQL', 'Backend', 3),
('Docker', 'Tools', 2);

-- Contact Inquiries
insert into contact_inquiries (full_name, email, message, status) values
('Arjun Mehta', 'arjun@example.com', 'Loved your projects! Are you available for a freelance collaboration?', 'new'),
('Priya Sharma', 'priya@example.com', 'Interested in your dashboard project, can you share the source code?', 'read'),
('Vikram Singh', 'vikram@example.com', 'Hiring for a Senior Frontend role in Bengaluru.', 'new'),
('Anita Reddy', 'anita@example.com', 'Great portfolio site, what theme are you using?', 'archived'),
('Rohan Gupta', 'rohan@example.com', 'Inquiry regarding React development services.', 'new'),
('Sneha Patil', 'sneha@example.com', 'Portfolio feedback: your design skills are impressive!', 'read'),
('Deepak Kumar', 'deepak@example.com', 'Consulting request for a new web startup.', 'new'),
('Meera Nair', 'meera@example.com', 'Are you attending the upcoming tech conference in BLR?', 'new'),
('Suresh Babu', 'suresh@example.com', 'Job opportunity for Front-end Developer.', 'new'),
('Divya Iyer', 'divya@example.com', 'Questions about your resume formatting.', 'read');
