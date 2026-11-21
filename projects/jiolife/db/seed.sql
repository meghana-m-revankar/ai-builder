-- db/seed.sql
-- Seed data for JioLife
-- Realistic dummy data satisfying constraints and foreign keys

-- 1. Seed user_profiles (10 rows)
INSERT INTO user_profiles (id, email, first_name, last_name, created_at, updated_at) VALUES
('a1b2c3d4-e5f6-7a8b-9c0d-1e2f3a4b5c6d', 'aisha.mansoori@example.com', 'Aisha', 'Al Mansoori', '2025-01-01 08:00:00.000', '2025-01-01 08:00:00.000'),
('b2c3d4e5-f6a7-8b9c-0d1e-2f3a4b5c6d7e', 'omar.haddad@example.com', 'Omar', 'Haddad', '2025-01-02 09:15:00.000', '2025-01-02 09:15:00.000'),
('c3d4e5f6-a78b-9c0d-1e2f-3a4b5c6d7e8f', 'aigerim.nurlanovna@example.com', 'Aigerim', 'Nurlanovna', '2025-01-03 10:30:00.000', '2025-01-03 10:30:00.000'),
('d4e5f6a7-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'daniyar.seitkali@example.com', 'Daniyar', 'Seitkali', '2025-01-04 11:00:00.000', '2025-01-04 11:00:00.000'),
('e5f6a78b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'fatima.zahra@example.com', 'Fatima', 'Zahra', '2025-01-05 12:00:00.000', '2025-01-05 12:00:00.000'),
('f6a78b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'zhanar.bekova@example.com', 'Zhanar', 'Bekova', '2025-01-06 13:20:00.000', '2025-01-06 13:20:00.000'),
('7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'john.doe@example.com', 'John', 'Doe', '2025-01-07 14:00:00.000', '2025-01-07 14:00:00.000'),
('8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e', 'elena.rostova@example.com', 'Elena', 'Rostova', '2025-01-08 15:10:00.000', '2025-01-08 15:10:00.000'),
('9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'tariq.aziz@example.com', 'Tariq', 'Aziz', '2025-01-09 16:45:00.000', '2025-01-09 16:45:00.000'),
('0d1e2f3a-4b5c-6d7e-8f9a-0b1c2d3e4f5a', 'gulnara.tokenova@example.com', 'Gulnara', 'Tokenova', '2025-01-10 17:30:00.000', '2025-01-10 17:30:00.000');

-- 2. Seed wellness_plans (10 rows)
INSERT INTO wellness_plans (id, title, description, category, price, currency, created_at, updated_at) VALUES
('p1111111-1111-4000-8000-000000000001', 'Morning Yoga Flow', 'Energizing vinyasa yoga sequence to start your day with mindfulness and flexibility.', 'Fitness', 25.00, 'USD', '2025-01-01 00:00:00.000', '2025-01-01 00:00:00.000'),
('p1111111-1111-4000-8000-000000000002', 'High-Intensity Interval Training', 'Cardio and strength intervals designed to burn fat and build endurance rapidly.', 'Fitness', 35.00, 'USD', '2025-01-01 00:00:00.000', '2025-01-01 00:00:00.000'),
('p1111111-1111-4000-8000-000000000003', 'Mindful Meditation Masterclass', 'Guided meditation sessions for stress reduction, focus, and emotional clarity.', 'Mental Health', 20.00, 'USD', '2025-01-01 00:00:00.000', '2025-01-01 00:00:00.000'),
('p1111111-1111-4000-8000-000000000004', 'Mediterranean Nutrition Guide', 'Comprehensive meal plans rich in whole foods, healthy fats, and lean proteins.', 'Nutrition', 40.00, 'USD', '2025-01-01 00:00:00.000', '2025-01-01 00:00:00.000'),
('p1111111-1111-4000-8000-000000000005', 'Sleep Optimization Program', 'Science-backed protocols and soothing soundscapes for deep, restorative sleep.', 'Wellness', 30.00, 'USD', '2025-01-01 00:00:00.000', '2025-01-01 00:00:00.000'),
('p1111111-1111-4000-8000-000000000006', 'Core Strength & Stability', 'Targeted abdominal and lower back workouts to improve posture and prevent injuries.', 'Fitness', 28.00, 'USD', '2025-01-01 00:00:00.000', '2025-01-01 00:00:00.000'),
('p1111111-1111-4000-8000-000000000007', 'Plant-Based Cooking Basics', 'Delicious and nutritious vegan recipes that make healthy eating effortless.', 'Nutrition', 35.00, 'USD', '2025-01-01 00:00:00.000', '2025-01-01 00:00:00.000'),
('p1111111-1111-4000-8000-000000000008', 'Anxiety Relief Toolkit', 'Breathing exercises and cognitive techniques for managing daily anxiety.', 'Mental Health', 22.00, 'USD', '2025-01-01 00:00:00.000', '2025-01-01 00:00:00.000'),
('p1111111-1111-4000-8000-000000000009', 'Marathon Training Roadmap', '12-week structured endurance training program for long-distance runners.', 'Fitness', 50.00, 'USD', '2025-01-01 00:00:00.000', '2025-01-01 00:00:00.000'),
('p1111111-1111-4000-8000-000000000010', 'Holistic Detox Plan', 'Gentle dietary and lifestyle reset to boost energy and support natural cleansing.', 'Nutrition', 45.00, 'USD', '2025-01-01 00:00:00.000', '2025-01-01 00:00:00.000');

-- 3. Seed activity_logs (10 rows)
INSERT INTO activity_logs (id, user_id, activity_type, duration_minutes, calories_burned, logged_at, created_at, updated_at) VALUES
('ac222222-2222-4000-8000-000000000001', 'a1b2c3d4-e5f6-7a8b-9c0d-1e2f3a4b5c6d', 'Running', 45, 450.50, '2025-02-01 07:30:00.000', '2025-02-01 07:30:00.000', '2025-02-01 07:30:00.000'),
('ac222222-2222-4000-8000-000000000002', 'b2c3d4e5-f6a7-8b9c-0d1e-2f3a4b5c6d7e', 'Cycling', 60, 520.00, '2025-02-01 08:00:00.000', '2025-02-01 08:00:00.000', '2025-02-01 08:00:00.000'),
('ac222222-2222-4000-8000-000000000003', 'c3d4e5f6-a78b-9c0d-1e2f-3a4b5c6d7e8f', 'Yoga', 30, 150.25, '2025-02-02 07:00:00.000', '2025-02-02 07:00:00.000', '2025-02-02 07:00:00.000'),
('ac222222-2222-4000-8000-000000000004', 'd4e5f6a7-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'Swimming', 40, 380.00, '2025-02-02 18:30:00.000', '2025-02-02 18:30:00.000', '2025-02-02 18:30:00.000'),
('ac222222-2222-4000-8000-000000000005', 'e5f6a78b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'HIIT', 35, 410.75, '2025-02-03 09:00:00.000', '2025-02-03 09:00:00.000', '2025-02-03 09:00:00.000'),
('ac222222-2222-4000-8000-000000000006', 'f6a78b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Walking', 50, 200.00, '2025-02-03 17:00:00.000', '2025-02-03 17:00:00.000', '2025-02-03 17:00:00.000'),
('ac222222-2222-4000-8000-000000000007', '7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'Strength Training', 60, 480.00, '2025-02-04 12:00:00.000', '2025-02-04 12:00:00.000', '2025-02-04 12:00:00.000'),
('ac222222-2222-4000-8000-000000000008', '8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e', 'Pilates', 45, 230.50, '2025-02-04 10:00:00.000', '2025-02-04 10:00:00.000', '2025-02-04 10:00:00.000'),
('ac222222-2222-4000-8000-000000000009', '9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Running', 30, 310.00, '2025-02-05 06:30:00.000', '2025-02-05 06:30:00.000', '2025-02-05 06:30:00.000'),
('ac222222-2222-4000-8000-000000000010', '0d1e2f3a-4b5c-6d7e-8f9a-0b1c2d3e4f5a', 'Cycling', 90, 750.00, '2025-02-05 16:00:00.000', '2025-02-05 16:00:00.000', '2025-02-05 16:00:00.000');

-- 4. Seed metric_records (10 rows)
INSERT INTO metric_records (id, user_id, metric_name, metric_value, recorded_at, created_at, updated_at) VALUES
('me333333-3333-4000-8000-000000000001', 'a1b2c3d4-e5f6-7a8b-9c0d-1e2f3a4b5c6d', 'Weight', 62.5000, '2025-02-01 08:00:00.000', '2025-02-01 08:00:00.000', '2025-02-01 08:00:00.000'),
('me333333-3333-4000-8000-000000000002', 'b2c3d4e5-f6a7-8b9c-0d1e-2f3a4b5c6d7e', 'HeartRateResting', 58.0000, '2025-02-01 08:00:00.000', '2025-02-01 08:00:00.000', '2025-02-01 08:00:00.000'),
('me333333-3333-4000-8000-000000000003', 'c3d4e5f6-a78b-9c0d-1e2f-3a4b5c6d7e8f', 'Weight', 55.2000, '2025-02-02 08:00:00.000', '2025-02-02 08:00:00.000', '2025-02-02 08:00:00.000'),
('me333333-3333-4000-8000-000000000004', 'd4e5f6a7-8b9c-0d1e-2f3a-4b5c6d7e8f9a', 'BodyFatPercentage', 18.5000, '2025-02-02 08:00:00.000', '2025-02-02 08:00:00.000', '2025-02-02 08:00:00.000'),
('me333333-3333-4000-8000-000000000005', 'e5f6a78b-9c0d-1e2f-3a4b-5c6d7e8f9a0b', 'SleepHours', 7.5000, '2025-02-03 08:00:00.000', '2025-02-03 08:00:00.000', '2025-02-03 08:00:00.000'),
('me333333-3333-4000-8000-000000000006', 'f6a78b9c-0d1e-2f3a-4b5c-6d7e8f9a0b1c', 'Weight', 68.0000, '2025-02-03 08:00:00.000', '2025-02-03 08:00:00.000', '2025-02-03 08:00:00.000'),
('me333333-3333-4000-8000-000000000007', '7a8b9c0d-1e2f-3a4b-5c6d-7e8f9a0b1c2d', 'HeartRateResting', 62.0000, '2025-02-04 08:00:00.000', '2025-02-04 08:00:00.000', '2025-02-04 08:00:00.000'),
('me333333-3333-4000-8000-000000000008', '8b9c0d1e-2f3a-4b5c-6d7e-8f9a0b1c2d3e', 'SleepHours', 8.0000, '2025-02-04 08:00:00.000', '2025-02-04 08:00:00.000', '2025-02-04 08:00:00.000'),
('me333333-3333-4000-8000-000000000009', '9c0d1e2f-3a4b-5c6d-7e8f-9a0b1c2d3e4f', 'Weight', 79.4000, '2025-02-05 08:00:00.000', '2025-02-05 08:00:00.000', '2025-02-05 08:00:00.000'),
('me333333-3333-4000-8000-000000000010', '0d1e2f3a-4b5c-6d7e-8f9a-0b1c2d3e4f5a', 'BodyFatPercentage', 22.1000, '2025-02-05 08:00:00.000', '2025-02-05 08:00:00.000', '2025-02-05 08:00:00.000');
