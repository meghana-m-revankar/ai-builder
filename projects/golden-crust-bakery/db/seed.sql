-- Seed Data for Golden Crust Bakery

-- Categories
insert into categories (id, name_en, name_ar) values 
('c0000000-0000-0000-0000-000000000001', 'Bread', 'خبز'),
('c0000000-0000-0000-0000-000000000002', 'Pastry', 'معجنات');

-- Products
insert into products (id, category_id, name_en, name_ar, price, image_url) values
('p0000000-0000-0000-0000-000000000001', 'c0000000-0000-0000-0000-000000000001', 'Sourdough Country Loaf', 'خبز العجين المخمر', 28.00, 'https://picsum.photos/seed/sourdough/800/600'),
('p0000000-0000-0000-0000-000000000002', 'c0000000-0000-0000-0000-000000000002', 'Pistachio Croissant', 'كرواسون بالفستق', 22.00, 'https://picsum.photos/seed/croissant/800/600');

-- Orders (10 sample orders)
insert into orders (id, customer_name, phone, pickup_date, status, total_amount) values
('o0000000-0000-0000-0000-000000000001', 'Aisha Al Mansoori', '+971 50 123 4567', now() + interval '1 day', 'Pending', 50.00),
('o0000000-0000-0000-0000-000000000002', 'Omar Haddad', '+971 50 234 5678', now() + interval '1 day', 'Ready', 28.00),
('o0000000-0000-0000-0000-000000000003', 'Sara Ibrahim', '+971 50 345 6789', now() + interval '2 days', 'Completed', 22.00),
('o0000000-0000-0000-0000-000000000004', 'Khalid Al Maktoum', '+971 50 456 7890', now() + interval '2 days', 'Pending', 78.00),
('o0000000-0000-0000-0000-000000000005', 'Layla Noor', '+971 50 567 8901', now() + interval '3 days', 'Pending', 22.00),
('o0000000-0000-0000-0000-000000000006', 'Ahmed Hassan', '+971 50 678 9012', now() + interval '3 days', 'Cancelled', 28.00),
('o0000000-0000-0000-0000-000000000007', 'Fatima Zaid', '+971 50 789 0123', now() + interval '4 days', 'Pending', 50.00),
('o0000000-0000-0000-0000-000000000008', 'Yousef Ali', '+971 50 890 1234', now() + interval '4 days', 'Completed', 28.00),
('o0000000-0000-0000-0000-000000000009', 'Noura Saeed', '+971 50 901 2345', now() + interval '5 days', 'Ready', 22.00),
('o0000000-0000-0000-0000-000000000010', 'Mohammed Bin Zayed', '+971 50 012 3456', now() + interval '5 days', 'Pending', 22.00);

-- Order Items
insert into order_items (order_id, product_id, quantity, price_at_purchase) values
('o0000000-0000-0000-0000-000000000001', 'p0000000-0000-0000-0000-000000000001', 1, 28.00),
('o0000000-0000-0000-0000-000000000001', 'p0000000-0000-0000-0000-000000000002', 1, 22.00),
('o0000000-0000-0000-0000-000000000002', 'p0000000-0000-0000-0000-000000000001', 1, 28.00);
