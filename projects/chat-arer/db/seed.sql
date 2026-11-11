-- Seed Data for Chat Arer

-- Users
insert into users (id, username, display_name) values
('f47ac10b-58cc-4372-a567-0e02b2c3d479', 'aisha_al', 'Aisha Al Mansoori'),
('b2a9e875-1234-4b89-9a2c-f09876543210', 'omar_h', 'Omar Haddad'),
('c3d8f9a2-5678-4c90-8b1d-a123456789ab', 'aigerim_n', 'Aigerim Nurlanovna'),
('d4e9f0b3-9012-4d01-7c2e-b234567890bc', 'daniyar_s', 'Daniyar Seitkali'),
('e5f0a1c4-0123-4e12-8d3f-c345678901cd', 'fatima_k', 'Fatima Khalil'),
('a6b1c2d5-1234-4f23-9e4g-d456789012de', 'yusuf_m', 'Yusuf Mansour'),
('b7c2d3e6-2345-4a34-0f5h-e567890123ef', 'zara_l', 'Zara Latif'),
('c8d3e4f7-3456-4b45-1g6i-f678901234fg', 'hassan_a', 'Hassan Ahmed'),
('d9e4f5a8-4567-4c56-2h7j-g789012345gh', 'layla_n', 'Layla Noor'),
('e0f5a6b9-5678-4d67-3i8k-h890123456hi', 'khalid_b', 'Khalid Bin');

-- Conversations (Direct Messages)
insert into conversations (id) values
('11111111-1111-1111-1111-111111111111'),
('22222222-2222-2222-2222-222222222222'),
('33333333-3333-3333-3333-333333333333');

-- Members
insert into conversation_members (conversation_id, user_id) values
('11111111-1111-1111-1111-111111111111', 'f47ac10b-58cc-4372-a567-0e02b2c3d479'),
('11111111-1111-1111-1111-111111111111', 'b2a9e875-1234-4b89-9a2c-f09876543210'),
('22222222-2222-2222-2222-222222222222', 'c3d8f9a2-5678-4c90-8b1d-a123456789ab'),
('22222222-2222-2222-2222-222222222222', 'd4e9f0b3-9012-4d01-7c2e-b234567890bc'),
('33333333-3333-3333-3333-333333333333', 'e5f0a1c4-0123-4e12-8d3f-c345678901cd'),
('33333333-3333-3333-3333-333333333333', 'a6b1c2d5-1234-4f23-9e4g-d456789012de');

-- Messages
insert into messages (conversation_id, sender_id, content, status) values
('11111111-1111-1111-1111-111111111111', 'f47ac10b-58cc-4372-a567-0e02b2c3d479', 'Salam, how is the project going?', 'read'),
('11111111-1111-1111-1111-111111111111', 'b2a9e875-1234-4b89-9a2c-f09876543210', 'Wa alaikum salam! It is going great.', 'read'),
('22222222-2222-2222-2222-222222222222', 'c3d8f9a2-5678-4c90-8b1d-a123456789ab', 'Are you coming to the office today?', 'delivered'),
('22222222-2222-2222-2222-222222222222', 'd4e9f0b3-9012-4d01-7c2e-b234567890bc', 'Yes, will be there by 10 AM.', 'sent'),
('33333333-3333-3333-3333-333333333333', 'e5f0a1c4-0123-4e12-8d3f-c345678901cd', 'Coffee later?', 'read'),
('33333333-3333-3333-3333-333333333333', 'a6b1c2d5-1234-4f23-9e4g-d456789012de', 'Sounds like a plan!', 'read'),
('11111111-1111-1111-1111-111111111111', 'f47ac10b-58cc-4372-a567-0e02b2c3d479', 'Great, see you then.', 'sent'),
('22222222-2222-2222-2222-222222222222', 'c3d8f9a2-5678-4c90-8b1d-a123456789ab', 'Perfect.', 'sent'),
('33333333-3333-3333-3333-333333333333', 'e5f0a1c4-0123-4e12-8d3f-c345678901cd', 'See you!', 'sent'),
('11111111-1111-1111-1111-111111111111', 'b2a9e875-1234-4b89-9a2c-f09876543210', 'Looking forward to it.', 'sent');
