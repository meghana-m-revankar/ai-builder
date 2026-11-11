-- Seed Data for PrintCraft

-- Products
insert into products (id, name, category, base_price, description, stock) values
('f47ac10b-58cc-4372-a567-0e02b2c3d479', 'Business Cards - Premium', 'Stationery', 25.00, 'Standard 350gsm silk finish', 500),
('a1b2c3d4-e5f6-4a5b-8c9d-0e1f2a3b4c5d', 'A4 Flyer - Gloss', 'Marketing', 15.00, 'Double-sided full color', 1000),
('b2c3d4e5-f6a7-4b8c-9d0e-1f2a3b4c5d6e', 'T-Shirt - Custom Print', 'Apparel', 19.99, '100% Cotton, DTG print', 200),
('c3d4e5f6-a7b8-4c9d-0e1f-2a3b4c5d6e7f', 'Sticker Sheet', 'Accessories', 5.50, 'A5 sheet, kiss-cut', 300),
('d4e5f6a7-b8c9-4d0e-1f2a-3b4c5d6e7f8a', 'Banner - Vinyl', 'Marketing', 45.00, 'Outdoor UV resistant', 50),
('e5f6a7b8-c9d0-4e1f-2a3b-4c5d6e7f8a9b', 'Poster - Large Format', 'Marketing', 12.00, 'A1 Size, 200gsm', 150),
('f6a7b8c9-d0e1-4f2a-3b4c-5d6e7f8a9b0c', 'Notebook - Spiral', 'Stationery', 8.50, 'A5, lined pages', 100),
('0a1b2c3d-4e5f-46a7-b8c9-0d1e2f3a4b5c', 'Mug - Ceramic', 'Accessories', 14.00, '11oz, sublimation print', 75),
('1b2c3d4e-5f6a-47b8-c9d0-1e2f3a4b5c6d', 'Envelopes - DL', 'Stationery', 10.00, 'Windowed, gummed', 2000),
('2c3d4e5f-6a7b-48c9-d0e1-2f3a4b5c6d7e', 'Canvas Print - Small', 'Home Decor', 30.00, 'Wooden frame, 8x10', 40);

-- Orders
insert into orders (id, customer_id, customer_details, total_amount, status) values
('550e8400-e29b-41d4-a716-446655440000', '99a1b2c3-d4e5-46f7-890a-1b2c3d4e5f6g', '{"name": "Aisha Al Mansoori", "email": "aisha@example.com"}', 50.00, 'completed'),
('660e8400-e29b-41d4-a716-446655440001', '88a1b2c3-d4e5-46f7-890a-1b2c3d4e5f6h', '{"name": "Omar Haddad", "email": "omar@example.com"}', 19.99, 'pending');

-- Order Items
insert into order_items (order_id, product_id, quantity, unit_price, customization_json) values
('550e8400-e29b-41d4-a716-446655440000', 'f47ac10b-58cc-4372-a567-0e02b2c3d479', 2, 25.00, '{"text": "PrintCraft Ltd"}'),
('660e8400-e29b-41d4-a716-446655440001', 'b2c3d4e5-f6a7-4b8c-9d0e-1f2a3b4c5d6e', 1, 19.99, '{"color": "navy", "size": "L"}');
