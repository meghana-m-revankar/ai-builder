-- Seed data for Chai Corner Café

insert into menu_items (id, name, price, category, description) values
('550e8400-e29b-41d4-a716-446655440001', 'Masala Chai', 60.00, 'Beverage', 'Classic spiced tea'),
('550e8400-e29b-41d4-a716-446655440002', 'Adrak Chai', 50.00, 'Beverage', 'Ginger infused tea'),
('550e8400-e29b-41d4-a716-446655440003', 'Filter Coffee', 70.00, 'Beverage', 'South Indian style coffee'),
('550e8400-e29b-41d4-a716-446655440004', 'Bun Maska', 40.00, 'Snack', 'Soft bun with butter'),
('550e8400-e29b-41d4-a716-446655440005', 'Samosa', 30.00, 'Snack', 'Crispy potato pastry'),
('550e8400-e29b-41d4-a716-446655440006', 'Paneer Puff', 55.00, 'Snack', 'Spiced paneer filling'),
('550e8400-e29b-41d4-a716-446655440007', 'Veg Sandwich', 90.00, 'Snack', 'Grilled vegetable sandwich'),
('550e8400-e29b-41d4-a716-446655440008', 'Chocolate Cake', 120.00, 'Dessert', 'Rich cocoa slice'),
('550e8400-e29b-41d4-a716-446655440009', 'Brownie', 100.00, 'Dessert', 'Fudgy walnut brownie'),
('550e8400-e29b-41d4-a716-446655440010', 'Lemonade', 50.00, 'Beverage', 'Fresh lime cooler');

insert into offers (id, title, description, discount_percent, valid_until) values
('660e8400-e29b-41d4-a716-446655440001', 'Morning Special', '20% off on all Chai before 11 AM', 20, now() + interval '30 days'),
('660e8400-e29b-41d4-a716-446655440002', 'Weekend Combo', 'Buy any snack and get 10% off', 10, now() + interval '7 days');

insert into contact_inquiries (id, name, email, message, created_at) values
('770e8400-e29b-41d4-a716-446655440001', 'Arjun Reddy', 'arjun@example.com', 'Great place for evening tea!', now() - interval '2 days'),
('770e8400-e29b-41d4-a716-446655440002', 'Priya Sharma', 'priya@example.com', 'Do you have vegan options?', now() - interval '1 day');
