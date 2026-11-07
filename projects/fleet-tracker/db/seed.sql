-- Seed data for Fleet Tracker
-- Fixed UUIDs for predictable testing

insert into vans (id, plate, status, last_maintenance_date) values
('f47ac10b-58cc-4372-a567-0e02b2c3d479', 'DXB-1001', 'available', '2023-11-01 08:00:00+00'),
('a2d8e4f2-9c1a-4d2b-b6d3-9f8a7e6c5d4b', 'DXB-1002', 'in_transit', '2023-12-15 09:30:00+00'),
('3b9c8a7d-6e5f-4a3b-b2c1-d0e9f8a7b6c5', 'DXB-1003', 'in_maintenance', '2024-01-10 14:00:00+00'),
('e5a4b3c2-d1f0-4e9a-8b7c-6d5f4a3b2c1d', 'DXB-1004', 'available', '2023-10-20 10:00:00+00'),
('7f6e5d4c-3b2a-4f9e-8d7c-6b5a4f3e2d1c', 'DXB-1005', 'retired', '2023-05-01 12:00:00+00'),
('c1b2a3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d', 'DXB-1006', 'available', '2024-01-20 09:00:00+00'),
('d4c3b2a1-e0f9-4b8c-7a6d-5e4f3b2a1c0d', 'DXB-1007', 'in_transit', '2023-11-25 11:00:00+00'),
('9a8b7c6d-5e4f-4a3b-b2c1-d0e9f8a7b6c5', 'DXB-1008', 'available', '2023-12-01 08:30:00+00'),
('2f3a4b5c-6d7e-4f8a-9b0c-1d2e3f4a5b6c', 'DXB-1009', 'in_maintenance', '2024-01-25 15:00:00+00'),
('b5c6d7e8-f9a0-4b1c-2d3e-4f5a6b7c8d9e', 'DXB-1010', 'available', '2023-12-20 09:45:00+00');

insert into drivers (id, name, license_expiry) values
('11111111-1111-1111-1111-111111111111', 'Aisha Al Mansoori', '2025-12-31 23:59:59+00'),
('22222222-2222-2222-2222-222222222222', 'Omar Haddad', '2024-06-15 23:59:59+00'),
('33333333-3333-3333-3333-333333333333', 'Fatima Al Farsi', '2026-01-20 23:59:59+00'),
('44444444-4444-4444-4444-444444444444', 'Mohammed Saeed', '2024-11-10 23:59:59+00'),
('55555555-5555-5555-5555-555555555555', 'Sara Ibrahim', '2025-08-05 23:59:59+00'),
('66666666-6666-6666-6666-666666666666', 'Ahmed Hassan', '2024-03-30 23:59:59+00'),
('77777777-7777-7777-7777-777777777777', 'Layla Yusuf', '2027-05-12 23:59:59+00'),
('88888888-8888-8888-8888-888888888888', 'Khalid Al Maktoum', '2024-09-01 23:59:59+00'),
('99999999-9999-9999-9999-999999999999', 'Noura Ali', '2025-10-15 23:59:59+00'),
('00000000-0000-0000-0000-000000000000', 'Hamad Jassim', '2026-11-20 23:59:59+00');

insert into maintenance (van_id, cost, description) values
('3b9c8a7d-6e5f-4a3b-b2c1-d0e9f8a7b6c5', 1200.00, 'Full engine service and oil change'),
('2f3a4b5c-6d7e-4f8a-9b0c-1d2e3f4a5b6c', 450.50, 'Brake pad replacement'),
('f47ac10b-58cc-4372-a567-0e02b2c3d479', 200.00, 'Tire rotation'),
('a2d8e4f2-9c1a-4d2b-b6d3-9f8a7e6c5d4b', 150.00, 'AC filter replacement'),
('e5a4b3c2-d1f0-4e9a-8b7c-6d5f4a3b2c1d', 300.00, 'Battery check and charging'),
('c1b2a3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d', 800.00, 'Suspension repair'),
('d4c3b2a1-e0f9-4b8c-7a6d-5e4f3b2a1c0d', 110.00, 'Headlight bulb replacement'),
('9a8b7c6d-5e4f-4a3b-b2c1-d0e9f8a7b6c5', 550.00, 'General inspection'),
('b5c6d7e8-f9a0-4b1c-2d3e-4f5a6b7c8d9e', 250.00, 'Wiper blade replacement'),
('f47ac10b-58cc-4372-a567-0e02b2c3d479', 900.00, 'Transmission fluid flush');
