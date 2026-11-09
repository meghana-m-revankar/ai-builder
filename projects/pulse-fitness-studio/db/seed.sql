-- seed.sql
insert into class_types (id, name, intensity, duration_minutes) values
('f47ac10b-58cc-4372-a567-0e02b2c3d479', 'Yoga Flow', 'Low', 60),
('a2c3d4e5-f678-4901-b234-567890abcdef', 'HIIT Blast', 'High', 45),
('b3c4d5e6-f789-5012-c345-678901bcdef0', 'Pilates Core', 'Medium', 50),
('c4d5e6f7-089a-6123-d456-789012cdef01', 'Spin Cycle', 'High', 45),
('d5e6f7a8-19ab-7234-e567-890123def012', 'Strength Basics', 'Medium', 60);

insert into trainers (id, name, specialty) values
('e6f7a8b9-29bc-8345-f678-901234ef0123', 'Aisha Al Mansoori', 'Yoga'),
('f7a8b9c0-39cd-9456-0789-012345f01234', 'Omar Haddad', 'HIIT'),
('a8b9c0d1-49de-0567-1890-123456012345', 'Sarah Jenkins', 'Pilates'),
('b9c0d1e2-59ef-1678-2901-234567123456', 'Daniyar Seitkali', 'Cycling'),
('c0d1e2f3-69fa-2789-3012-345678234567', 'Fatima Zahra', 'Strength');

insert into class_schedules (id, class_type_id, trainer_id, start_time, end_time) values
('10000000-0000-0000-0000-000000000001', 'f47ac10b-58cc-4372-a567-0e02b2c3d479', 'e6f7a8b9-29bc-8345-f678-901234ef0123', now() + interval '1 day', now() + interval '1 day 1 hour'),
('10000000-0000-0000-0000-000000000002', 'a2c3d4e5-f678-4901-b234-567890abcdef', 'f7a8b9c0-39cd-9456-0789-012345f01234', now() + interval '1 day 2 hours', now() + interval '1 day 2 hours 45 minutes'),
('10000000-0000-0000-0000-000000000003', 'b3c4d5e6-f789-5012-c345-678901bcdef0', 'a8b9c0d1-49de-0567-1890-123456012345', now() + interval '2 days', now() + interval '2 days 50 minutes'),
('10000000-0000-0000-0000-000000000004', 'c4d5e6f7-089a-6123-d456-789012cdef01', 'b9c0d1e2-59ef-1678-2901-234567123456', now() + interval '3 days', now() + interval '3 days 45 minutes'),
('10000000-0000-0000-0000-000000000005', 'd5e6f7a8-19ab-7234-e567-890123def012', 'c0d1e2f3-69fa-2789-3012-345678234567', now() + interval '4 days', now() + interval '4 days 1 hour');

insert into bookings (name, phone, email, class_schedule_id, status) values
('Ahmed Rashid', '+971 50 111 2233', 'ahmed@example.com', '10000000-0000-0000-0000-000000000001', 'Confirmed'),
('Layla Noor', '+971 50 444 5566', 'layla@example.com', '10000000-0000-0000-0000-000000000002', 'Pending'),
('Omar Aziz', '+971 50 777 8899', 'omar@example.com', '10000000-0000-0000-0000-000000000003', 'Confirmed'),
('Sara Majid', '+971 50 000 1122', 'sara@example.com', '10000000-0000-0000-0000-000000000004', 'Cancelled'),
('John Smith', '+971 50 333 4455', 'john@example.com', '10000000-0000-0000-0000-000000000005', 'Confirmed');

insert into memberships (name, price_aed, description) values
('Monthly Pass', 500, 'Unlimited classes for 30 days'),
('Trial Pack', 0, 'One free trial class'),
('Premium Yearly', 5000, 'All access, priority booking, free merchandise'),
('Student Discount', 350, 'Monthly pass with valid student ID'),
('Off-Peak', 250, 'Access to classes between 10am and 4pm');
