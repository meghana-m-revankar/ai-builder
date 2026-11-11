-- Seed data for Meghana Portfolio

insert into contact_submissions (id, full_name, email, subject, message, status) values
('550e8400-e29b-41d4-a716-446655440000', 'Arjun Mehta', 'arjun@example.com', 'Collaboration', 'Interested in building a React dashboard.', 'new'),
('550e8400-e29b-41d4-a716-446655440001', 'Priya Sharma', 'priya.s@example.com', 'Job Opportunity', 'Looking for a frontend developer for our Bengaluru office.', 'new'),
('550e8400-e29b-41d4-a716-446655440002', 'Vikram Rao', 'vikram.rao@example.com', 'Freelance Project', 'Need help with a landing page redesign.', 'read'),
('550e8400-e29b-41d4-a716-446655440003', 'Sneha Patil', 'sneha.p@example.com', 'Question', 'How do you handle theme switching in Tailwind?', 'replied'),
('550e8400-e29b-41d4-a716-446655440004', 'Rohan Gupta', 'rohan.g@example.com', 'Mentorship', 'Can I get some advice on React performance?', 'new'),
('550e8400-e29b-41d4-a716-446655440005', 'Anjali Reddy', 'anjali.r@example.com', 'Web App Dev', 'Hi, I am looking for a full stack dev for my startup.', 'new'),
('550e8400-e29b-41d4-a716-446655440006', 'Karthik Iyer', 'karthik.i@example.com', 'Portfolio Feedback', 'Great design, what tools did you use for prototyping?', 'read'),
('550e8400-e29b-41d4-a716-446655440007', 'Meera Nair', 'meera.n@example.com', 'Job Inquiry', 'Are you currently open to new roles?', 'new'),
('550e8400-e29b-41d4-a716-446655440008', 'Siddharth Bose', 'siddharth.b@example.com', 'Design Help', 'Do you work with Figma for UI design?', 'archived'),
('550e8400-e29b-41d4-a716-446655440009', 'Divya Kulkarni', 'divya.k@example.com', 'Collaboration', 'Would love to discuss a potential partnership.', 'new');

insert into project_stats (project_slug, view_count, click_count) values
('fintech-dashboard', 1250, 45),
('e-commerce-ui', 980, 32),
('social-media-app', 750, 18);
