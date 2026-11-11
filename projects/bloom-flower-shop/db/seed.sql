-- Seed Data for Bloom Flower Shop

-- Insert Bouquets
insert into bouquets (id, name, description, price, image_url, is_active) values
('f47ac10b-58cc-4372-a567-0e02b2c3d479', 'Royal Rose Bouquet', 'Classic deep red roses wrapped in premium gold paper.', 250.00, 'https://picsum.photos/seed/rose/800/600', true),
('a1b2c3d4-e5f6-4a5b-8c9d-0e1f2a3b4c5d', 'Spring Daisy Delight', 'Bright cheerful daisies for any occasion.', 120.00, 'https://picsum.photos/seed/daisy/800/600', true),
('b2c3d4e5-f6a7-4b8c-9d0e-1f2a3b4c5d6e', 'Lavender Dream', 'Soothing lavender and purple lisianthus.', 180.00, 'https://picsum.photos/seed/lavender/800/600', true),
('c3d4e5f6-a7b8-4c9d-0e1f-2a3b4c5d6e7f', 'Sun-Kissed Sunflowers', 'Large, radiant sunflowers to brighten the day.', 150.00, 'https://picsum.photos/seed/sunflower/800/600', true),
('d4e5f6a7-b8c9-4d0e-1f2a-3b4c5d6e7f8a', 'Pure White Lily', 'Elegant white lilies in a minimalist arrangement.', 210.00, 'https://picsum.photos/seed/lily/800/600', true),
('e5f6a7b8-c9d0-4e1f-2a3b-4c5d6e7f8a9b', 'Orchid Elegance', 'Exotic purple orchids for a sophisticated touch.', 300.00, 'https://picsum.photos/seed/orchid/800/600', true),
('f6a7b8c9-d0e1-4f2a-3b4c-5d6e7f8a9b0c', 'Tulip Festival', 'A vibrant mix of seasonal Dutch tulips.', 190.00, 'https://picsum.photos/seed/tulip/800/600', true),
('0a1b2c3d-4e5f-6a7b-8c9d-0e1f2a3b4c5d', 'Carnation Charm', 'Sweet pastel carnations for a delicate look.', 110.00, 'https://picsum.photos/seed/carnation/800/600', true),
('1b2c3d4e-5f6a-7b8c-9d0e-1f2a3b4c5d6e', 'Midnight Peonies', 'Deep pink luxurious peonies.', 280.00, 'https://picsum.photos/seed/peony/800/600', true),
('2c3d4e5f-6a7b-8c9d-0e1f-2a3b4c5d6e7f', 'Boutique Hydrangea', 'Full, fluffy blue hydrangeas.', 220.00, 'https://picsum.photos/seed/hydrangea/800/600', true);

-- Insert Orders
insert into orders (id, customer_name, customer_phone, delivery_date, gift_message, status) values
('10000000-0000-0000-0000-000000000001', 'Aisha Al Mansoori', '+971 50 123 4567', now() + interval '1 day', 'Happy Birthday!', 'New'),
('10000000-0000-0000-0000-000000000002', 'Omar Haddad', '+971 56 765 4321', now() + interval '2 days', 'Congratulations on the new job!', 'Confirmed'),
('10000000-0000-0000-0000-000000000003', 'Fatima Saeed', '+971 55 987 6543', now() + interval '3 days', 'Get well soon.', 'New'),
('10000000-0000-0000-0000-000000000004', 'Ahmed Al Maktoum', '+971 50 555 1212', now() - interval '2 days', 'Love you always.', 'Delivered'),
('10000000-0000-0000-0000-000000000005', 'Sara Ibrahim', '+971 52 444 8888', now() + interval '5 days', 'Thinking of you.', 'New'),
('10000000-0000-0000-0000-000000000006', 'Khalid Al Farsi', '+971 54 333 7777', now() + interval '7 days', 'Happy anniversary!', 'New'),
('10000000-0000-0000-0000-000000000007', 'Mariam Yusuf', '+971 58 111 9999', now() - interval '5 days', 'You are the best.', 'Delivered'),
('10000000-0000-0000-0000-000000000008', 'Jassim Al Ali', '+971 59 222 6666', now() + interval '10 days', 'Good luck with exams!', 'New'),
('10000000-0000-0000-0000-000000000009', 'Noura Ahmed', '+971 50 666 3333', now() - interval '1 day', 'Thank you for everything.', 'Confirmed'),
('10000000-0000-0000-0000-000000000010', 'Zayed Sultan', '+971 56 777 4444', now() + interval '12 days', 'Welcome to the world!', 'New');
