-- Seed data for Golden Crust Bakery
-- Products
insert into products (id, name_en, name_ar, description, price, is_bestseller) values
('f47ac10b-58cc-4372-a567-0e02b2c3d479', 'Sourdough Country Loaf', 'خبز العجين المخمر', 'Classic artisan sourdough.', 28.00, true),
('a1b2c3d4-e5f6-4789-8012-34567890abcd', 'Pistachio Croissant', 'كرواسون بالفستق', 'Flaky pastry filled with pistachio cream.', 22.00, true),
('b2c3d4e5-f6a7-4890-9123-4567890abcde', 'Zaatar Manakish', 'مناقيش زعتر', 'Traditional bread with zaatar.', 12.00, false),
('c3d4e5f6-a7b8-4901-a234-567890abcdef', 'Chocolate Eclair', 'إكلير بالشوكولاتة', 'Creamy chocolate delight.', 18.00, false),
('d4e5f6a7-b8c9-4012-b345-67890abcdef1', 'Bagel with Cream Cheese', 'بيغل مع جبنة كريمية', 'Freshly baked NYC style bagel.', 15.00, false),
('e5f6a7b8-c9d0-4123-c456-7890abcdef12', 'Berry Tart', 'تارت التوت', 'Fresh berries on custard.', 20.00, false),
('f6a7b8c9-d0e1-4234-d567-890abcdef123', 'Olive Focaccia', 'فوكاشيا بالزيتون', 'Soft bread topped with olives.', 14.00, false),
('07b8c9d0-e1f2-4345-e678-90abcdef1234', 'Cinnamon Roll', 'لفائف القرفة', 'Sweet and spiced.', 16.00, true),
('18c9d0e1-f2a3-4456-f789-0abcdef12345', 'Multigrain Loaf', 'خبز متعدد الحبوب', 'Healthy fiber-rich bread.', 25.00, false),
('29d0e1f2-a3b4-4567-0890-abcdef123456', 'Almond Croissant', 'كرواسون باللوز', 'Buttery almond goodness.', 22.00, false);

-- PreOrders
insert into pre_orders (product_id, customer_name, phone, quantity, pickup_date, status) values
('f47ac10b-58cc-4372-a567-0e02b2c3d479', 'Aisha Al Mansoori', '+971 50 123 4567', 1, now() + interval '1 day', 'confirmed'),
('a1b2c3d4-e5f6-4789-8012-34567890abcd', 'Omar Haddad', '+971 50 987 6543', 2, now() + interval '2 days', 'pending'),
('b2c3d4e5-f6a7-4890-9123-4567890abcde', 'Fatima Saeed', '+971 50 111 2233', 5, now() + interval '3 days', 'pending'),
('f6a7b8c9-d0e1-4234-d567-890abcdef123', 'Ahmed Rashid', '+971 50 444 5566', 3, now() + interval '4 days', 'completed'),
('07b8c9d0-e1f2-4345-e678-90abcdef1234', 'Layla Ibrahim', '+971 50 777 8899', 1, now() + interval '5 days', 'cancelled');
