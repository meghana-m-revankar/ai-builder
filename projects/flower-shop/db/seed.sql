-- Seed Data for Flower Shop

insert into categories (id, name, description) values
('f47ac10b-58cc-4372-a567-0e02b2c3d479', 'Occasions', 'Flowers for birthdays, anniversaries, and celebrations'),
('c568f12a-79bb-4481-b678-1f13c3d4e580', 'Plants', 'Indoor and outdoor potted plants'),
('d679a23b-80cc-4592-c789-2g24d4e5f691', 'Bouquets', 'Hand-tied floral arrangements');

insert into products (id, category_id, name, description, price, currency, stock_quantity, image_url, is_featured) values
('e580b34c-91dd-4603-d890-3h35e5f6g702', 'f47ac10b-58cc-4372-a567-0e02b2c3d479', 'Birthday Joy', 'Bright sunflowers and roses', 150.00, 'AED', 20, 'https://picsum.photos/seed/flower1/800/600', true),
('f691c45d-02ee-4714-e901-4i46f6g7h813', 'd679a23b-80cc-4592-c789-2g24d4e5f691', 'Classic Red Roses', '12 premium long-stemmed red roses', 250.00, 'AED', 15, 'https://picsum.photos/seed/flower2/800/600', true),
('g702d56e-13ff-4825-f012-5j57g7h8i924', 'c568f12a-79bb-4481-b678-1f13c3d4e580', 'Jade Pothos', 'Easy care trailing indoor plant', 85.00, 'AED', 10, 'https://picsum.photos/seed/flower3/800/600', false),
('h813e67f-2400-4936-g123-6k68h8i9j035', 'd679a23b-80cc-4592-c789-2g24d4e5f691', 'Lily Elegance', 'White lilies with green fillers', 180.00, 'AED', 8, 'https://picsum.photos/seed/flower4/800/600', true),
('i924f78g-3511-4047-h234-7l79i9j0k146', 'c568f12a-79bb-4481-b678-1f13c3d4e580', 'Snake Plant', 'Air purifying hardy plant', 120.00, 'AED', 12, 'https://picsum.photos/seed/flower5/800/600', false),
('j035g89h-4622-4158-i345-8m80j0k1l257', 'f47ac10b-58cc-4372-a567-0e02b2c3d479', 'Anniversary Romance', 'Mixed seasonal pink and white blooms', 300.00, 'AED', 5, 'https://picsum.photos/seed/flower6/800/600', true),
('k146h90i-5733-4269-j456-9n91k1l2m368', 'd679a23b-80cc-4592-c789-2g24d4e5f691', 'Spring Mix', 'Seasonal tulips and hyacinths', 210.00, 'AED', 7, 'https://picsum.photos/seed/flower7/800/600', false),
('l257i01j-6844-4370-k567-0o02l2m3n479', 'c568f12a-79bb-4481-b678-1f13c3d4e580', 'Succulent Garden', 'Assorted succulents in ceramic pot', 95.00, 'AED', 14, 'https://picsum.photos/seed/flower8/800/600', false),
('m368j12k-7955-4481-l678-1p13m3n4o580', 'f47ac10b-58cc-4372-a567-0e02b2c3d479', 'Get Well Soon', 'Vibrant daisy arrangement', 130.00, 'AED', 9, 'https://picsum.photos/seed/flower9/800/600', false),
('n479k23l-8066-4592-m789-2q24n4o5p691', 'd679a23b-80cc-4592-c789-2g24d4e5f691', 'Purple Majesty', 'Deep purple orchids and filler', 275.00, 'AED', 4, 'https://picsum.photos/seed/flower10/800/600', true);

insert into inquiries (full_name, email, phone, message, status) values
('Aisha Al Mansoori', 'aisha@example.com', '+971 50 123 4567', 'Do you deliver to Jumeirah?', 'new'),
('Omar Haddad', 'omar@example.com', '+971 50 234 5678', 'Can I customize the Anniversary bouquet?', 'new');
