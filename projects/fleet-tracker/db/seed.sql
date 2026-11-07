-- Seed Data for Fleet Tracker

insert into vans (plate_number, model, status, last_maintenance_date) values
('VAN-001', 'Mercedes Sprinter', 'Active', '2023-11-15'),
('VAN-002', 'Ford Transit', 'Active', '2023-12-01'),
('VAN-003', 'Ram ProMaster', 'InMaintenance', '2024-01-10'),
('VAN-004', 'Mercedes Sprinter', 'Active', '2023-10-20'),
('VAN-005', 'Ford Transit', 'Active', '2023-11-05');

insert into drivers (name, license_number, license_expiry_date) values
('Alice Johnson', 'LIC-1001', '2025-06-01'),
('Bob Smith', 'LIC-1002', '2024-12-15'),
('Charlie Davis', 'LIC-1003', '2026-03-20'),
('Diana Prince', 'LIC-1004', '2025-09-10'),
('Edward Norton', 'LIC-1005', '2025-01-20');

insert into maintenance_logs (van_id, description, cost, log_date)
select id, 'Routine Oil Change', 150.00, now() - interval '30 days' from vans where plate_number = 'VAN-001';

insert into maintenance_logs (van_id, description, cost, log_date)
select id, 'Brake Replacement', 450.00, now() - interval '5 days' from vans where plate_number = 'VAN-003';

insert into deliveries (van_id, driver_id, status, fuel_cost, completion_time)
select v.id, d.id, 'Completed', 85.50, now() - interval '2 days'
from vans v, drivers d
where v.plate_number = 'VAN-001' and d.name = 'Alice Johnson';
