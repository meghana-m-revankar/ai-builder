-- Seed Data for Golden Crust Bakery

insert into products (id, name_en, name_ar, price_aed, is_best_seller) values
('550e8400-e29b-41d4-a716-446655440000', 'Sourdough Country Loaf', 'خبز العجين المخمر', 28.00, true),
('550e8400-e29b-41d4-a716-446655440001', 'Pistachio Croissant', 'كرواسون بالفستق', 22.00, true),
('550e8400-e29b-41d4-a716-446655440002', 'Zaatar Flatbread', 'مناقيش زعتر', 15.00, false),
('550e8400-e29b-41d4-a716-446655440003', 'Chocolate Babka', 'بابكا الشوكولاتة', 35.00, false),
('550e8400-e29b-41d4-a716-446655440004', 'Baguette', 'خبز فرنسي', 12.00, false),
('550e8400-e29b-41d4-a716-446655440005', 'Almond Tart', 'تارت اللوز', 25.00, false),
('550e8400-e29b-41d4-a716-446655440006', 'Focaccia', 'فوكاتشيا', 18.00, false),
('550e8400-e29b-41d4-a716-446655440007', 'Honey Cake', 'كيكة العسل', 40.00, true),
('550e8400-e29b-41d4-a716-446655440008', 'Cinnamon Roll', 'لفائف القرفة', 18.00, false),
('550e8400-e29b-41d4-a716-446655440009', 'Rye Bread', 'خبز الجاودار', 20.00, false);

insert into orders (customer_name, phone, product_id, quantity, pickup_date, status) values
('Aisha Al Mansoori', '+971 50 123 4567', '550e8400-e29b-41d4-a716-446655440000', 1, now() + interval '1 day', 'Confirmed'),
('Omar Haddad', '+971 50 987 6543', '550e8400-e29b-41d4-a716-446655440001', 2, now() + interval '2 days', 'Pending'),
('Fatima Al Shamsi', '+971 55 555 0101', '550e8400-e29b-41d4-a716-446655440007', 1, now() + interval '3 days', 'Pending'),
('John Smith', '+971 56 111 2233', '550e8400-e29b-41d4-a716-446655440003', 3, now() + interval '4 days', 'Completed'),
('Sara Ibrahim', '+971 50 444 8899', '550e8400-e29b-41d4-a716-446655440000', 2, now() + interval '5 days', 'Cancelled'),
('Ahmed Hassan', '+971 52 777 3344', '550e8400-e29b-41d4-a716-446655440002', 5, now() + interval '6 days', 'Confirmed'),
('Layla Noor', '+971 50 222 0011', '550e8400-e29b-41d4-a716-446655440005', 1, now() + interval '7 days', 'Pending'),
('Khalid Saeed', '+971 55 999 8877', '550e8400-e29b-41d4-a716-446655440006', 2, now() + interval '8 days', 'Pending'),
('Mariam Ali', '+971 56 333 4455', '550e8400-e29b-41d4-a716-446655440008', 4, now() + interval '9 days', 'Pending'),
('Yousef Bakri', '+971 54 123 7890', '550e8400-e29b-41d4-a716-446655440009', 1, now() + interval '10 days', 'Confirmed');

insert into testimonials (customer_name, content, rating) values
('Aisha Al Mansoori', 'The sourdough is the best I have had outside Europe. Pre-ordering is easy.', 5),
('Omar Haddad', 'Authentic taste, great quality.', 4),
('Fatima Al Shamsi', 'Fresh and delicious, especially the Honey Cake!', 5),
('John Smith', 'Love the croissants, very flaky.', 5),
('Sara Ibrahim', 'Great service, will order again.', 4);
