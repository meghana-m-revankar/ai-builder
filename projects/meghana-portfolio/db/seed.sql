-- Seed data for Meghana Portfolio
-- Fixed UUIDs for consistent testing

insert into projects (id, title, description, technologies, project_url, github_url, display_order) values
('550e8400-e29b-41d4-a716-446655440000', 'E-commerce Dashboard', 'A real-time analytics dashboard for retail businesses.', ARRAY['React', 'Tailwind', 'Chart.js'], 'https://example.com/p1', 'https://github.com/meghana/p1', 1),
('660e8400-e29b-41d4-a716-446655440001', 'Task Manager App', 'Collaborative task management with drag-and-drop support.', ARRAY['Vue', 'Node.js', 'Firebase'], 'https://example.com/p2', 'https://github.com/meghana/p2', 2),
('770e8400-e29b-41d4-a716-446655440002', 'Weather API Visualizer', 'Fetch and visualize global weather data.', ARRAY['JavaScript', 'CSS', 'OpenWeatherAPI'], 'https://example.com/p3', 'https://github.com/meghana/p3', 3);

insert into contact_submissions (full_name, email, subject, message, status) values
('Aisha Al Mansoori', 'aisha@example.com', 'Collaboration Inquiry', 'Hi Meghana, loved your work on the dashboard. Let us talk!', 'new'),
('Omar Haddad', 'omar@example.com', 'Job Opportunity', 'We are looking for a frontend developer at TechCorp.', 'new'),
('Daniyar Seitkali', 'daniyar@example.com', 'Question about your Tech stack', 'What do you think about using Tailwind for complex layouts?', 'read');
