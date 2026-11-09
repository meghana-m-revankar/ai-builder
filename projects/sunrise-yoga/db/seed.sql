-- Seed data for Sunrise Yoga

insert into instructors (id, name, bio, specialty) values
('7a9a1011-0001-4000-8000-000000000001', 'Aisha Al Mansoori', 'Certified Hatha Yoga instructor with 10 years of experience.', 'Hatha'),
('7a9a1011-0001-4000-8000-000000000002', 'Omar Haddad', 'Specialist in Vinyasa flow and meditation techniques.', 'Vinyasa');

insert into classes (id, name, description, level, duration_minutes, base_price, instructor_id) values
('8b9b2022-0002-4000-9000-000000000001', 'Morning Flow', 'Energizing vinyasa flow to start your day.', 'Beginner', 60, 80.00, '7a9a1011-0001-4000-8000-000000000002'),
('8b9b2022-0002-4000-9000-000000000002', 'Zen Hatha', 'Calming hatha session for mindfulness.', 'Beginner', 90, 100.00, '7a9a1011-0001-4000-8000-000000000001');

insert into schedules (class_id, start_time, end_time, room_number) values
('8b9b2022-0002-4000-9000-000000000001', '2023-11-01 07:00:00+04', '2023-11-01 08:00:00+04', 'Studio A'),
('8b9b2022-0002-4000-9000-000000000002', '2023-11-01 18:00:00+04', '2023-11-01 19:30:00+04', 'Studio B');
