-- Seed Data
insert into locations (id, name, address) values 
('550e8400-e29b-41d4-a716-446655440000', 'Jumeirah Beach', 'Jumeirah St, Dubai'),
('550e8400-e29b-41d4-a716-446655440001', 'Downtown Dubai', 'Burj Khalifa Blvd, Dubai');

insert into products (id, name, category, price, stock_quantity) values 
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Sourdough Country Loaf', 'Bakery', 28.00, 50),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Pistachio Croissant', 'Pastry', 22.00, 30),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Flat White', 'Coffee', 18.00, 100),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Cold Brew', 'Coffee', 24.00, 40),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Avocado Toast', 'Food', 45.00, 20),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'Espresso', 'Coffee', 12.00, 200),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'Almond Latte', 'Coffee', 22.00, 60),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'Blueberry Muffin', 'Pastry', 16.00, 25),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'Shakshuka', 'Food', 55.00, 15),
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'Matcha Latte', 'Coffee', 26.00, 40);

insert into customers (id, name, email, loyalty_points) values 
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a01', 'Aisha Al Mansoori', 'aisha@example.com', 150),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a02', 'Omar Haddad', 'omar@example.com', 85),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a03', 'Fatima Al Zarooni', 'fatima@example.com', 210),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a04', 'Mohammed Saeed', 'mohammed@example.com', 40),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a05', 'Layla Ibrahim', 'layla@example.com', 300),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a06', 'Ahmed Hassan', 'ahmed@example.com', 120),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a07', 'Sara Al Mheiri', 'sara@example.com', 95),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a08', 'Khalid Rashid', 'khalid@example.com', 60),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a09', 'Noura Al Suwaidi', 'noura@example.com', 175),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a10', 'Hamad Jassim', 'hamad@example.com', 30);

insert into orders (id, customer_id, location_id, total_amount, payment_method, status) values
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a01', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a01', '550e8400-e29b-41d4-a716-446655440000', 50.00, 'card', 'completed'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a02', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a02', '550e8400-e29b-41d4-a716-446655440001', 34.00, 'cash', 'completed'),
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a03', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a03', '550e8400-e29b-41d4-a716-446655440000', 80.00, 'wallet', 'completed');
