-- Seed data for QuickFix Home Services

-- Technicians
insert into technicians (id, name, specialty, phone) values
('550e8400-e29b-41d4-a716-446655440000', 'Rajesh Kumar', 'Plumber', '+91 98765 43210'),
('550e8400-e29b-41d4-a716-446655440001', 'Suresh Reddy', 'Electrician', '+91 98765 43211'),
('550e8400-e29b-41d4-a716-446655440002', 'Anita Sharma', 'AC Technician', '+91 98765 43212'),
('550e8400-e29b-41d4-a716-446655440003', 'Vikram Singh', 'Plumber', '+91 98765 43213'),
('550e8400-e29b-41d4-a716-446655440004', 'Priya Das', 'Electrician', '+91 98765 43214'),
('550e8400-e29b-41d4-a716-446655440005', 'Amit Patel', 'AC Technician', '+91 98765 43215'),
('550e8400-e29b-41d4-a716-446655440006', 'Sunita Rao', 'Plumber', '+91 98765 43216'),
('550e8400-e29b-41d4-a716-446655440007', 'Rahul Verma', 'Electrician', '+91 98765 43217'),
('550e8400-e29b-41d4-a716-446655440008', 'Kavita Iyer', 'AC Technician', '+91 98765 43218'),
('550e8400-e29b-41d4-a716-446655440009', 'Vijay Gupta', 'Plumber', '+91 98765 43219');

-- Bookings
insert into bookings (id, customer_id, service_type, address, scheduled_at, status, technician_id, total_price) values
('660e8400-e29b-41d4-a716-446655440000', '770e8400-e29b-41d4-a716-446655440000', 'Plumbing', 'Flat 101, Jubilee Hills, Hyderabad', now() + interval '1 day', 'pending', null, 500.00),
('660e8400-e29b-41d4-a716-446655440001', '770e8400-e29b-41d4-a716-446655440001', 'Electrical', 'House 22, Banjara Hills, Hyderabad', now() + interval '2 days', 'assigned', '550e8400-e29b-41d4-a716-446655440001', 750.00),
('660e8400-e29b-41d4-a716-446655440002', '770e8400-e29b-41d4-a716-446655440002', 'AC Repair', 'Apt 404, Gachibowli, Hyderabad', now() - interval '1 day', 'completed', '550e8400-e29b-41d4-a716-446655440002', 1200.00),
('660e8400-e29b-41d4-a716-446655440003', '770e8400-e29b-41d4-a716-446655440003', 'Plumbing', 'Villa 5, Madhapur, Hyderabad', now() + interval '3 days', 'pending', null, 600.00),
('660e8400-e29b-41d4-a716-446655440004', '770e8400-e29b-41d4-a716-446655440004', 'Electrical', 'Flat 303, Kondapur, Hyderabad', now() - interval '2 days', 'in_progress', '550e8400-e29b-41d4-a716-446655440004', 800.00),
('660e8400-e29b-41d4-a716-446655440005', '770e8400-e29b-41d4-a716-446655440005', 'AC Repair', 'House 12, Hitech City, Hyderabad', now() + interval '4 days', 'pending', null, 1500.00),
('660e8400-e29b-41d4-a716-446655440006', '770e8400-e29b-41d4-a716-446655440006', 'Plumbing', 'Flat 202, Kukatpally, Hyderabad', now() - interval '3 days', 'completed', '550e8400-e29b-41d4-a716-446655440000', 450.00),
('660e8400-e29b-41d4-a716-446655440007', '770e8400-e29b-41d4-a716-446655440007', 'Electrical', 'Villa 9, Miyapur, Hyderabad', now() + interval '5 days', 'pending', null, 900.00),
('660e8400-e29b-41d4-a716-446655440008', '770e8400-e29b-41d4-a716-446655440008', 'AC Repair', 'Apt 10, Begumpet, Hyderabad', now() - interval '4 days', 'completed', '550e8400-e29b-41d4-a716-446655440005', 1100.00),
('660e8400-e29b-41d4-a716-446655440009', '770e8400-e29b-41d4-a716-446655440009', 'Plumbing', 'House 7, Tarnaka, Hyderabad', now() + interval '6 days', 'pending', null, 550.00);

-- Payments
insert into payments (id, booking_id, amount, status, payment_method) values
('880e8400-e29b-41d4-a716-446655440002', '660e8400-e29b-41d4-a716-446655440002', 1200.00, 'paid', 'Credit Card'),
('880e8400-e29b-41d4-a716-446655440004', '660e8400-e29b-41d4-a716-446655440004', 800.00, 'pending', 'UPI'),
('880e8400-e29b-41d4-a716-446655440006', '660e8400-e29b-41d4-a716-446655440006', 450.00, 'paid', 'Cash'),
('880e8400-e29b-41d4-a716-446655440008', '660e8400-e29b-41d4-a716-446655440008', 1100.00, 'paid', 'Credit Card');
