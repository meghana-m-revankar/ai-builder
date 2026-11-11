-- Seed Data

-- Projects
insert into projects (id, title, description, image_url, project_url) values
('f47ac10b-58cc-4372-a567-0e02b2c3d479', 'E-commerce Platform', 'Full-stack web application for retail.', 'https://picsum.photos/seed/p1/800/600', 'https://example.com/p1'),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Task Management API', 'RESTful API for team collaboration.', 'https://picsum.photos/seed/p2/800/600', 'https://example.com/p2'),
('a1b2c3d4-e5f6-4789-9012-34567890abcd', 'Portfolio Generator', 'Tool to auto-generate static sites.', 'https://picsum.photos/seed/p3/800/600', 'https://example.com/p3');

-- Skills
insert into skills (name, category, proficiency_level) values
('HTML5', 'Frontend', 5),
('CSS3', 'Frontend', 5),
('JavaScript', 'Frontend', 5),
('Bootstrap', 'Frontend', 4),
('PostgreSQL', 'Backend', 4),
('Node.js', 'Backend', 3),
('Git', 'Tools', 5),
('Docker', 'Tools', 3),
('Figma', 'Design', 4),
('VS Code', 'Tools', 5);

-- Contact Messages
insert into contact_messages (name, email, subject, message) values
('Aisha Al Mansoori', 'aisha@example.com', 'Project Inquiry', 'Hi, I would like to discuss a new web project.'),
('Omar Haddad', 'omar@example.com', 'Job Opportunity', 'Are you currently taking on new freelance contracts?'),
('Aigerim Nurlanovna', 'aigerim@example.com', 'Collaboration', 'Love your work on the Task API, let''s connect.'),
('Daniyar Seitkali', 'daniyar@example.com', 'Hello', 'Just saying hello and checking out your portfolio.'),
('John Doe', 'john@example.com', 'Questions', 'How do you handle responsive images?'),
('Jane Smith', 'jane@example.com', 'Consultation', 'Need some advice on CSS layouts.'),
('Mike Ross', 'mike@example.com', 'Design help', 'Help with UI design for my project?'),
('Sarah Connor', 'sarah@example.com', 'Web App', 'Do you build using Bootstrap?'),
('Bruce Wayne', 'bruce@example.com', 'Project', 'I need a secure web solution.'),
('Diana Prince', 'diana@example.com', 'Inquiry', 'Looking for a skilled frontend developer.');
