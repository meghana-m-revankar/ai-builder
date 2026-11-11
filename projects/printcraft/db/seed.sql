-- Seed data for PrintCraft
-- Products
insert into products (id, name, base_price, category, options, is_active) values
('f47ac10b-58cc-4372-a567-0e02b2c3d479', 'Standard Business Card', 500.00, 'Stationery', '{"size": "3.5x2", "paper": "300gsm Matte"}', true),
('a1b2c3d4-e5f6-4a5b-8c9d-0e1f2a3b4c5d', 'Premium Glossy Flyer', 1200.00, 'Marketing', '{"size": "A5", "paper": "150gsm Gloss"}', true),
('b2c3d4e5-f6a7-4b8c-9d0e-1f2a3b4c5d6e', 'Cotton T-Shirt Print', 450.00, 'Apparel', '{"material": "100% Cotton", "print": "DTG"}', true),
('c3d4e5f6-a7b8-4c9d-0e1f-2a3b4c5d6e7f', 'Large Vinyl Banner', 2500.00, 'Signage', '{"material": "Vinyl", "finish": "Matte"}', true),
('d4e5f6a7-b8c9-4d0e-1f2a-3b4c5d6e7f8a', 'Custom Letterhead', 800.00, 'Stationery', '{"size": "A4", "paper": "100gsm Bond"}', true),
('e5f6a7b8-c9d0-4e1f-2a3b-4c5d6e7f8a9b', 'Promotional Notebook', 1500.00, 'Stationery', '{"pages": 100, "binding": "Spiral"}', true),
('f6a7b8c9-d0e1-4f2a-3b4c-5d6e7f8a9b0c', 'Polyester Polo Shirt', 600.00, 'Apparel', '{"material": "Polyester", "print": "Embroidery"}', true),
('a7b8c9d0-e1f2-4a3b-4c5d-6e7f8a9b0c1d', 'Brochure Tri-Fold', 2000.00, 'Marketing', '{"size": "A4", "fold": "Tri-fold"}', true),
('b8c9d0e1-f2a3-4b4c-5d6e-7f8a9b0c1d2e', 'Greeting Card', 300.00, 'Stationery', '{"size": "5x7", "finish": "Spot UV"}', true),
('c9d0e1f2-a3b4-4c5d-6e7f-8a9b0c1d2e3f', 'Poster A2', 400.00, 'Marketing', '{"size": "A2", "paper": "Gloss"}', true);

-- Orders
insert into orders (id, customer_id, total_amount, gst_amount, status, shipping_address) values
('10000000-0000-0000-0000-000000000001', 'e29783f9-6745-4204-944a-115042456001', 1700.00, 306.00, 'Delivered', '{"line1": "Indiranagar", "city": "Bangalore", "zip": "560038"}'),
('20000000-0000-0000-0000-000000000002', 'e29783f9-6745-4204-944a-115042456002', 4500.00, 810.00, 'Shipped', '{"line1": "Whitefield", "city": "Bangalore", "zip": "560066"}');

-- Order Items
insert into order_items (order_id, product_id, quantity, unit_price, file_url) values
('10000000-0000-0000-0000-000000000001', 'f47ac10b-58cc-4372-a567-0e02b2c3d479', 1, 500.00, 'https://storage.example.com/orders/o1/cards.pdf'),
('10000000-0000-0000-0000-000000000001', 'a1b2c3d4-e5f6-4a5b-8c9d-0e1f2a3b4c5d', 1, 1200.00, 'https://storage.example.com/orders/o1/flyer.pdf'),
('20000000-0000-0000-0000-000000000002', 'b2c3d4e5-f6a7-4b8c-9d0e-1f2a3b4c5d6e', 10, 450.00, 'https://storage.example.com/orders/o2/shirts.zip');
