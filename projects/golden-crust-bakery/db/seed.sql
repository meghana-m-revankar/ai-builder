-- Seed data for Golden Crust Bakery
-- Products, Orders, Reviews

-- Seed Products
insert into products (id, name, description, price, is_special) values
('f47ac10b-58cc-4372-a567-0e02b2c3d479', 'Sourdough Country Loaf', 'Traditional slow-fermented sourdough', 28.00, true),
('a1b2c3d4-e5f6-4789-a012-b3c4d5e6f7a8', 'Pistachio Croissant', 'Buttery pastry filled with pistachio cream', 22.00, false),
('b2c3d4e5-f6a7-4890-b123-c4d5e6f7a8b9', 'Zaatar Focaccia', 'Levantine herb infused flatbread', 18.00, false),
('c3d4e5f6-a7b8-4901-c234-d5e6f7a8b9c0', 'Chocolate Babka', 'Sweet braided bread with dark chocolate', 35.00, true),
('d4e5f6a7-b8c9-4012-d345-e6f7a8b9c0d1', 'Date & Walnut Scone', 'Local twist on classic tea scone', 15.00, false),
('e5f6a7b8-c9d0-4123-e456-f7a8b9c0d1e2', 'Turkish Simit', 'Sesame-crusted bread ring', 12.00, false),
('f6a7b8c9-d0e1-4234-f567-08b9c0d1e2f3', 'Cardamom Bun', 'Spiced Scandinavian-inspired bun', 16.00, false),
('07b8c9d0-e1f2-4345-0678-19c0d1e2f3a4', 'Rye Bread', 'Dark and dense artisan rye', 25.00, false),
('18c9d0e1-f2a3-4456-1789-2ad1e2f3a4b5', 'Rosewater Muffin', 'Infused with local rosewater essence', 14.00, false),
('29d0e1f2-a3b4-4567-2890-3be2f3a4b5c6', 'Olive & Thyme Baguette', 'Savory baguette with Kalamata olives', 20.00, false);

-- Seed Orders
insert into orders (customer_name, phone, product_id, quantity, pickup_date, status) values
('Aisha Al Mansoori', '+971 50 123 4567', 'f47ac10b-58cc-4372-a567-0e02b2c3d479', 1, now() + interval '1 day', 'new'),
('Omar Haddad', '+971 50 234 5678', 'a1b2c3d4-e5f6-4789-a012-b3c4d5e6f7a8', 2, now() + interval '2 days', 'baking'),
('Layla Juma', '+971 50 345 6789', 'b2c3d4e5-f6a7-4890-b123-c4d5e6f7a8b9', 1, now() + interval '1 day', 'ready'),
('Ahmed Al Farsi', '+971 50 456 7890', 'c3d4e5f6-a7b8-4901-c234-d5e6f7a8b9c0', 3, now() + interval '3 days', 'new'),
('Sara Ibrahim', '+971 50 567 8901', 'd4e5f6a7-b8c9-4012-d345-e6f7a8b9c0d1', 1, now() + interval '1 day', 'collected'),
('Khalid Said', '+971 50 678 9012', 'e5f6a7b8-c9d0-4123-e456-f7a8b9c0d1e2', 5, now() + interval '4 days', 'new'),
('Fatima Noor', '+971 50 789 0123', 'f6a7b8c9-d0e1-4234-f567-08b9c0d1e2f3', 2, now() + interval '1 day', 'cancelled'),
('Hassan Ali', '+971 50 890 1234', '07b8c9d0-e1f2-4345-0678-19c0d1e2f3a4', 1, now() + interval '5 days', 'new'),
('Mariam Saleh', '+971 50 901 2345', '18c9d0e1-f2a3-4456-1789-2ad1e2f3a4b5', 2, now() + interval '2 days', 'baking'),
('Yousef M.', '+971 50 012 3456', '29d0e1f2-a3b4-4567-2890-3be2f3a4b5c6', 1, now() + interval '1 day', 'ready');

-- Seed Reviews
insert into reviews (customer_name, rating, comment) values
('Aisha Al Mansoori', 5, 'The sourdough is authentic and fresh!'),
('Omar Haddad', 4, 'Great croissants, will order again.'),
('Layla Juma', 5, 'Love the Zaatar Focaccia.'),
('Ahmed Al Farsi', 3, 'Good bread, but could be slightly saltier.'),
('Sara Ibrahim', 5, 'Perfect texture on the babka.'),
('Khalid Said', 4, 'Very friendly staff.'),
('Fatima Noor', 2, 'Order was delayed, but the bread was good.'),
('Hassan Ali', 5, 'Best artisan bakery in Dubai.'),
('Mariam Saleh', 4, 'Nice variety of options.'),
('Yousef M.', 5, 'The cardamom buns are a game changer.');
