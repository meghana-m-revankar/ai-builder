-- seed.sql: Sample data for Meghana Portfolio

insert into projects (id, title, description, image_url) values
('f47ac10b-58cc-4372-a567-0e02b2c3d479', 'E-commerce Dashboard', 'A responsive admin panel for inventory management.', 'https://picsum.photos/seed/p1/800/600'),
('e37bc21c-69dd-4483-b678-1f13c3d4e580', 'Task Management App', 'Drag-and-drop task board with real-time updates.', 'https://picsum.photos/seed/p2/800/600'),
('d26cd32d-70ee-4594-c789-2g24d4e5f691', 'Weather Forecast PWA', 'Offline-capable weather tracking application.', 'https://picsum.photos/seed/p3/800/600');

insert into contact_messages (full_name, email, subject, message, status) values
('Aisha Al Mansoori', 'aisha@example.com', 'Collaboration', 'Hi Meghana, I saw your portfolio and would like to discuss a web project.', 'new'),
('Omar Haddad', 'omar@example.com', 'Job Inquiry', 'We have an opening for a senior front-end developer, are you interested?', 'read'),
('Aigerim Nurlanovna', 'aigerim@example.com', 'Portfolio Feedback', 'Great work on the projects section!', 'archived'),
('Daniyar Seitkali', 'daniyar@example.com', 'Freelance Opportunity', 'Looking for a developer to help with a UI overhaul.', 'new'),
('Fatima Zahra', 'fatima@example.com', 'Question', 'What technologies did you use for the task app?', 'new'),
('Zaid Al-Farsi', 'zaid@example.com', 'Interview', 'Would you be available for a call next week?', 'new'),
('Sara Mansour', 'sara@example.com', 'Project Help', 'Need help debugging a CSS grid layout.', 'new'),
('Khalid Ibrahim', 'khalid@example.com', 'Consulting', 'We need a consultation on web performance.', 'new'),
('Leila Bakir', 'leila@example.com', 'Proposal', 'Please send your resume for our vacancy.', 'read'),
('Youssef Ahmed', 'youssef@example.com', 'General Inquiry', 'Just saying hello, wonderful site.', 'archived');
