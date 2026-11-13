-- db/seed.sql
-- Realistic sample seed data for Dubai region (AED currency, local names & formatting)

-- 1. Tenant
insert into tenants (id, name, code, is_active) values
('11111111-1111-1111-1111-111111111111', 'Golden Crust Bakery LLC', 'GCB-DXB', true);

-- 2. Users
insert into users (id, tenant_id, email, full_name, role, is_active, password_hash) values
('22211111-1111-1111-1111-111111111111', '11111111-1111-1111-1111-111111111111', 'owner@example.com', 'Aisha Al Mansoori', 'Owner', true, 'AQAAAAIAAYagAAAAEO...hashed_password...'),
('22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'admin@example.com', 'Omar Haddad', 'Admin', true, 'AQAAAAIAAYagAAAAEO...hashed_password...');

-- 3. Categories
insert into categories (id, tenant_id, name, slug, description) values
('33333333-3333-3333-3333-333333333331', '11111111-1111-1111-1111-111111111111', 'Bread', 'bread', 'Freshly baked artisanal breads'),
('33333333-3333-3333-3333-333333333332', '11111111-1111-1111-1111-111111111112', 'Pastry', 'pastry', 'Flaky and buttery pastries'),
('33333333-3333-3333-3333-333333333333', '11111111-1111-1111-1111-111111111113', 'Cakes', 'cakes', 'Celebration and custom cakes'),
('33333333-3333-3333-3333-333333333334', '11111111-1111-1111-1111-111111111114', 'Beverages', 'beverages', 'Hot and cold gourmet drinks'),
('33333333-3333-3333-3333-333333333335', '11111111-1111-1111-1111-111111111115', 'Sandwiches', 'sandwiches', 'Fresh daily prepared gourmet sandwiches');

-- Fix category tenant ids to match main tenant
update categories set tenant_id = '11111111-1111-1111-1111-111111111111';

-- 4. Products (12 items)
insert into products (id, tenant_id, category_id, name, sku, price, currency, stock_quantity, rating, reviews_count, badge, image_url, icon) values
('44444444-4444-4444-4444-444444444401', '11111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333331', 'Sourdough Country Loaf', 'SKU-BRD-001', 28.00, 'AED', 45, 4.90, 214, 'Best seller', 'https://picsum.photos/seed/golden-crust-sourdough/800/600', 'bi-basket'),
('44444444-4444-4444-4444-444444444402', '11111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333332', 'Pistachio Croissant', 'SKU-PAS-002', 22.00, 'AED', 30, 4.80, 187, 'New', 'https://picsum.photos/seed/golden-crust-croissant/800/600', 'bi-star'),
('44444444-4444-4444-4444-444444444403', '11111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333331', 'Multigrain Seeded Loaf', 'SKU-BRD-003', 32.00, 'AED', 25, 4.70, 95, null, 'https://picsum.photos/seed/golden-crust-multigrain/800/600', 'bi-basket'),
('44444444-4444-4444-4444-444444444404', '11111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333332', 'Almond Pain au Chocolat', 'SKU-PAS-004', 24.00, 'AED', 18, 4.90, 112, 'Popular', 'https://picsum.photos/seed/golden-crust-almond/800/600', 'bi-star'),
('44444444-4444-4444-4444-444444444405', '11111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333333', 'Belgian Chocolate Truffle Cake', 'SKU-CHK-005', 180.00, 'AED', 5, 5.00, 64, 'Featured', 'https://picsum.photos/seed/golden-crust-cake/800/600', 'bi-cake'),
('44444444-4444-4444-4444-444444444406', '11111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333334', 'Spanish Latte (Iced)', 'SKU-BEV-006', 26.00, 'AED', 50, 4.85, 302, 'Best seller', 'https://picsum.photos/seed/golden-crust-latte/800/600', 'bi-cup-hot'),
('44444444-4444-4444-4444-444444444407', '11111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333335', 'Avocado & Halloumi Panini', 'SKU-SND-007', 35.00, 'AED', 15, 4.75, 88, null, 'https://picsum.photos/seed/golden-crust-panini/800/600', 'bi-shop'),
('44444444-4444-4444-4444-444444444408', '11111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333332', 'Butter Croissant', 'SKU-PAS-008', 18.00, 'AED', 40, 4.95, 410, 'Classic', 'https://picsum.photos/seed/golden-crust-butter-croissant/800/600', 'bi-star'),
('44444444-4444-4444-4444-444444444409', '11111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333333', 'Strawberry Vanilla Sponge', 'SKU-CHK-009', 150.00, 'AED', 8, 4.88, 53, null, 'https://picsum.photos/seed/golden-crust-strawberry/800/600', 'bi-cake'),
('44444444-4444-4444-4444-444444444410', '11111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333331', 'Brioche Burger Buns (4pk)', 'SKU-BRD-010', 20.00, 'AED', 22, 4.65, 40, null, 'https://picsum.photos/seed/golden-crust-brioche/800/600', 'bi-basket'),
('44444444-4444-4444-4444-444444444411', '11111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333334', 'Matcha Green Tea Latte', 'SKU-BEV-011', 28.00, 'AED', 35, 4.78, 126, 'New', 'https://picsum.photos/seed/golden-crust-matcha/800/600', 'bi-cup-hot'),
('44444444-4444-4444-4444-444444444412', '11111111-1111-1111-1111-111111111112', '33333333-3333-3333-3333-333333333335', 'Smoked Turkey & Swiss Baguette', 'SKU-SND-012', 38.00, 'AED', 12, 4.82, 79, null, 'https://picsum.photos/seed/golden-crust-baguette/800/600', 'bi-shop');

update products set tenant_id = '11111111-1111-1111-1111-111111111111';

-- 5. Customers (10 rows)
insert into customers (id, tenant_id, full_name, email, phone, address, city) values
('55555555-5555-5555-5555-555555555501', '11111111-1111-1111-1111-111111111111', 'Fatima Al Zaabi', 'fatima.alzaabi@example.com', '+971 50 123 4567', 'Villa 12, Al Wasl Road', 'Dubai'),
('55555555-5555-5555-5555-555555555502', '11111111-1111-1111-1111-111111111111', 'Rashid Al Maktoum', 'rashid.maktoum@example.com', '+971 55 987 6543', 'Apartment 402, Burj Vista, Downtown', 'Dubai'),
('55555555-5555-5555-5555-555555555503', '11111111-1111-1111-1111-111111111111', 'Zainab Al Hashimi', 'zainab.hashimi@example.com', '+971 52 345 6789', 'Townhouse 45, Jumeirah Village Circle', 'Dubai'),
('55555555-5555-5555-5555-555555555504', '11111111-1111-1111-1111-111111111111', 'Mohammed Al Shamsi', 'mohammed.shamsi@example.com', '+971 50 456 7890', 'Villa 88, Arabian Ranches 2', 'Dubai'),
('55555555-5555-5555-5555-555555555505', '11111111-1111-1111-1111-111111111111', 'Mariam Al Nuaimi', 'mariam.nuaimi@example.com', '+971 56 789 0123', 'Marina Crown, Tower B, Dubai Marina', 'Dubai'),
('55555555-5555-5555-5555-555555555506', '11111111-1111-1111-1111-111111111111', 'Saeed Al Suwaidi', 'saeed.suwaidi@example.com', '+971 54 234 5678', 'The Greens, Al Alka 3', 'Dubai'),
('55555555-5555-5555-5555-555555555507', '11111111-1111-1111-1111-111111111111', 'Noora Al Kaabi', 'noora.alkaabi@example.com', '+971 50 890 1234', 'Palm Jumeirah, Frond G', 'Dubai'),
('55555555-5555-5555-5555-555555555508', '11111111-1111-1111-1111-111111111111', 'Tariq Al Mazrouei', 'tariq.mazrouei@example.com', '+971 55 678 9012', 'Downtown Views II, Tower 1', 'Dubai'),
('55555555-5555-5555-5555-555555555509', '11111111-1111-1111-1111-111111111111', 'Alya Al Qassimi', 'alya.qassimi@example.com', '+971 52 112 2334', 'Mirdif Hills, Janayen Avenue', 'Dubai'),
('55555555-5555-5555-5555-555555555510', '11111111-1111-1111-1111-111111111111', 'Hamdan Al Falasi', 'hamdan.falasi@example.com', '+971 50 998 8776', 'Emirates Hills, Sector E', 'Dubai');

-- 6. Orders (10 rows)
insert into orders (id, tenant_id, customer_id, order_number, status, subtotal, tax, total_amount, currency) values
('66666666-6666-6666-6666-666666666601', '11111111-1111-1111-1111-111111111111', '55555555-5555-5555-5555-555555555501', 'ORD-2025-0001', 'Completed', 50.00, 2.50, 52.50, 'AED'),
('66666666-6666-6666-6666-666666666602', '11111111-1111-1111-1111-111111111111', '55555555-5555-5555-5555-555555555502', 'ORD-2025-0002', 'Processing', 180.00, 9.00, 189.00, 'AED'),
('66666666-6666-6666-6666-666666666603', '11111111-1111-1111-1111-111111111111', '55555555-5555-5555-5555-555555555503', 'ORD-2025-0003', 'Completed', 61.00, 3.05, 64.05, 'AED'),
('66666666-6666-6666-6666-666666666604', '11111111-1111-1111-1111-111111111114', '55555555-5555-5555-5555-555555555504', 'ORD-2025-0004', 'Pending', 35.00, 1.75, 36.75, 'AED'),
('66666666-6666-6666-6666-666666666605', '11111111-1111-1111-1111-111111111111', '55555555-5555-5555-5555-555555555505', 'ORD-2025-0005', 'Completed', 150.00, 7.50, 157.50, 'AED'),
('66666666-6666-6666-6666-666666666606', '11111111-1111-1111-1111-111111111111', '55555555-5555-5555-5555-555555555506', 'ORD-2025-0006', 'Cancelled', 56.00, 2.80, 58.80, 'AED'),
('66666666-6666-6666-6666-666666666607', '11111111-1111-1111-1111-111111111111', '55555555-5555-5555-5555-555555555507', 'ORD-2025-0007', 'Completed', 74.00, 3.70, 77.70, 'AED'),
('66666666-6666-6666-6666-666666666608', '11111111-1111-1111-1111-111111111111', '55555555-5555-5555-5555-555555555508', 'ORD-2025-0008', 'Processing', 38.00, 1.90, 39.90, 'AED'),
('66666666-6666-6666-6666-666666666609', '11111111-1111-1111-1111-111111111111', '55555555-5555-5555-5555-555555555509', 'ORD-2025-0009', 'Completed', 48.00, 2.40, 50.40, 'AED'),
('66666666-6666-6666-6666-666666666610', '11111111-1111-1111-1111-111111111111', '55555555-5555-5555-5555-555555555510', 'ORD-2025-0010', 'Pending', 56.00, 2.80, 58.80, 'AED');

update orders set tenant_id = '11111111-1111-1111-1111-111111111111';

-- 7. Order Items
insert into order_items (id, order_id, product_id, quantity, unit_price, total_price) values
('77777777-7777-7777-7777-777777777701', '66666666-6666-6666-6666-666666666601', '44444444-4444-4444-4444-444444444401', 1, 28.00, 28.00),
('77777777-7777-7777-7777-777777777702', '66666666-6666-6666-6666-666666666601', '44444444-4444-4444-4444-444444444402', 1, 22.00, 22.00),
('77777777-7777-7777-7777-777777777703', '66666666-6666-6666-6666-666666666602', '44444444-4444-4444-4444-444444444405', 1, 180.00, 180.00),
('77777777-7777-7777-7777-777777777704', '66666666-6666-6666-6666-666666666603', '44444444-4444-4444-4444-444444444403', 1, 32.00, 32.00),
('77777777-7777-7777-7777-777777777705', '66666666-6666-6666-6666-666666666603', '44444444-4444-4444-4444-444444444406', 1, 29.00, 29.00),
('77777777-7777-7777-7777-777777777706', '66666666-6666-6666-6666-666666666604', '44444444-4444-4444-4444-444444444407', 1, 35.00, 35.00),
('77777777-7777-7777-7777-777777777707', '66666666-6666-6666-6666-666666666605', '44444444-4444-4444-4444-444444444409', 1, 150.00, 150.00),
('77777777-7777-7777-7777-777777777708', '66666666-6666-6666-6666-666666666606', '44444444-4444-4444-4444-444444444408', 2, 28.00, 56.00),
('77777777-7777-7777-7777-777777777709', '66666666-6666-6666-6666-666666666607', '44444444-4444-4444-4444-444444444404', 1, 24.00, 24.00),
('77777777-7777-7777-7777-777777777710', '66666666-6666-6666-6666-666666666607', '44444444-4444-4444-4444-444444444406', 2, 25.00, 50.00);

-- 8. Testimonials (5 rows)
insert into testimonials (id, tenant_id, name, role, avatar_url, rating, text, is_featured) values
('88888888-8888-8888-8888-888888888801', '11111111-1111-1111-1111-111111111111', 'Aisha Al Mansoori', 'Regular customer, Jumeirah', 'https://i.pravatar.cc/80?u=aisha', 5, 'The sourdough is the best I have had outside Europe. Pre-ordering for Friday pickup is so easy.', true),
('88888888-8888-8888-8888-888888888802', '11111111-1111-1111-1111-111111111111', 'Omar Haddad', 'Food Blogger, Dubai', 'https://i.pravatar.cc/80?u=omar', 5, 'Golden Crust delivers exceptionally fresh pastries every morning. The pistachio croissant is phenomenal!', true),
('88888888-8888-8888-8888-888888888803', '11111111-1111-1111-1111-111111111111', 'Salma Al Hashimi', 'Resident, Downtown Dubai', 'https://i.pravatar.cc/80?u=salma', 5, 'Quick delivery and packaging keeps everything warm and crispy. Absolutely love their Spanish latte!', true),
('88888888-8888-8888-8888-888888888804', '11111111-1111-1111-1111-111111111111', 'Karim Benzema', 'Fitness Coach, Marina', 'https://i.pravatar.cc/80?u=karim', 4, 'Great multigrain bread options for my daily nutrition plan. Reliable and premium quality.', true),
('88888888-8888-8888-8888-888888888805', '11111111-1111-1111-1111-111111111111', 'Nour Al Din', 'Chef & Consultant', 'https://i.pravatar.cc/80?u=nour', 5, 'Authentic fermentation and crisp crusts. Truly world-class artisanal baking right here in Dubai.', true);
