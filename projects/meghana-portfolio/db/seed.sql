-- Seed Data
insert into projects (id, title, description, tech_stack, project_url, display_order) values
('f47ac10b-58cc-4372-a567-0e02b2c3d479', 'E-commerce Platform', 'Full-stack retail solution', ARRAY['React', 'Node.js', 'PostgreSQL'], 'https://example.com/project1', 1),
('c3f4e5a6-b7c8-4d9e-a0f1-b2c3d4e5f6a7', 'Task Manager', 'Personal productivity tool', ARRAY['Vue.js', 'Firebase'], 'https://example.com/project2', 2),
('a1b2c3d4-e5f6-4a5b-8c9d-0e1f2a3b4c5d', 'Weather Dashboard', 'Real-time climate tracking', ARRAY['JavaScript', 'OpenWeatherAPI'], 'https://example.com/project3', 3);

insert into skills (name, category, proficiency_level) values
('HTML5', 'Frontend', 5),
('CSS3', 'Frontend', 5),
('Bootstrap', 'Frontend', 4),
('JavaScript', 'Frontend', 5),
('React', 'Frontend', 4),
('Node.js', 'Backend', 4),
('PostgreSQL', 'Backend', 4),
('Docker', 'Tools', 3),
('Git', 'Tools', 5),
('Figma', 'Design', 3);

insert into contact_messages (full_name, email, subject, message, status) values
('Aisha Al Mansoori', 'aisha@example.com', 'Collaboration', 'Would love to discuss a project.', 'new'),
('Omar Haddad', 'omar@example.com', 'Job Inquiry', 'Are you currently accepting new clients?', 'new'),
('Aigerim Nurlanovna', 'aigerim@example.com', 'Feedback', 'Love your portfolio design!', 'read'),
('Daniyar Seitkali', 'daniyar@example.com', 'Consulting', 'Need help with a web migration.', 'new'),
('John Smith', 'john@example.com', 'Bug Report', 'Broken link on projects section.', 'archived'),
('Sara Ali', 'sara@example.com', 'Freelance', 'Do you work with React Native?', 'new'),
('Khalid Ahmed', 'khalid@example.com', 'Hello', 'Just saying hi!', 'new'),
('Elena Petrova', 'elena@example.com', 'Question', 'What themes did you use?', 'new'),
('David Kim', 'david@example.com', 'Partnership', 'Looking to connect.', 'new'),
('Fatima Zahra', 'fatima@example.com', 'Pricing', 'What are your rates?', 'new');
