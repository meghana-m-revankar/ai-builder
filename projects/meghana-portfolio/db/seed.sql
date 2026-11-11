-- Seed data for Meghana Portfolio
-- Note: Fixed UUIDs to allow testing/referencing

insert into contacts (id, full_name, email, message, is_read, created_at) values
('f47ac10b-58cc-4372-a567-0e02b2c3d479', 'Rahul Sharma', 'rahul.s@example.com', 'Hi Meghana, I saw your dashboard project and I am impressed. Would like to discuss a freelance opportunity.', false, now() - interval '2 days'),
('b2a9e321-7f8a-4d2a-b3c9-9a2d8e4f1a01', 'Priya Iyer', 'priya.iyer@example.com', 'Loved your clean UI work. Are you available for a coffee chat next week?', true, now() - interval '5 days'),
('d9b8c7a6-e5d4-4c3b-b2a1-0f9e8d7c6b5a', 'Vikram Rao', 'v.rao@example.com', 'Interested in hiring you for a mobile-first project. Please check your LinkedIn messages.', false, now() - interval '1 hour'),
('a1b2c3d4-e5f6-4a5b-8c9d-0e1f2a3b4c5d', 'Ananya Deshmukh', 'ananya.d@example.com', 'Great portfolio! Do you use React for your projects?', true, now() - interval '10 days'),
('c5d6e7f8-g9h0-4i1j-2k3l-4m5n6o7p8q9r', 'Sanjay Gupta', 'sanjay.g@example.com', 'Looking for a front-end developer for our startup based in Indiranagar.', false, now() - interval '3 days'),
('e9f8d7c6-b5a4-4321-b0a9-8d7c6b5a4e3d', 'Meera Nair', 'meera.n@example.com', 'Do you offer consulting services for accessibility audits?', false, now() - interval '12 hours'),
('f1a2b3c4-d5e6-4f7g-8h9i-0j1k2l3m4n5o', 'Karthik Reddy', 'karthik.r@example.com', 'The shopify-style project you listed looks very professional. Nice work!', true, now() - interval '7 days'),
('g2h3i4j5-k6l7-4m8n-9o0p-1q2r3s4t5u6v', 'Sneha Patil', 'sneha.p@example.com', 'We have a React vacancy. Would you like to apply?', false, now() - interval '1 day'),
('h3i4j5k6-l7m8-4n9o-0p1q-2r3s4t5u6v7w', 'Amit Kumar', 'amit.k@example.com', 'Do you have experience with Tailwind UI components?', true, now() - interval '14 days'),
('i4j5k6l7-m8n9-4o0p-1q2r-3s4t5u6v7w8x', 'Divya Suresh', 'divya.s@example.com', 'Your projects are very well documented. Impressive work.', false, now() - interval '2 days');
