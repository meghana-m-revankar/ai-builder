-- Sample data for Golden Crust Bakery
-- Products
insert into products (name_en, name_ar, description_en, description_ar, price_aed, category) values
('Sourdough Loaf', 'خبز العجين المخمر', 'Classic artisan sourdough bread.', 'خبز عجين مخمر كلاسيكي.', 25.00, 'Bread'),
('Croissant', 'كرواسون', 'Buttery, flaky French croissant.', 'كرواسون فرنسي هش بالزبدة.', 12.00, 'Pastry'),
('Chocolate Eclair', 'إكلير الشوكولاتة', 'Cream-filled eclair with dark chocolate.', 'إكلير محشو بالكريمة وشوكولاتة داكنة.', 15.00, 'Pastry'),
('Baguette', 'باغيت', 'Traditional French baguette.', 'باغيت فرنسي تقليدي.', 8.00, 'Bread'),
('Cinnamon Roll', 'لفائف القرفة', 'Sweet dough with cinnamon glaze.', 'عجينة حلوة مع صقيع القرفة.', 14.00, 'Pastry'),
('Multigrain Bread', 'خبز الحبوب المتعددة', 'Healthy bread with various seeds.', 'خبز صحي مع بذور متنوعة.', 22.00, 'Bread'),
('Danish Pastry', 'دانيش', 'Fruit-topped danish pastry.', 'دانيش مغطى بالفواكه.', 16.00, 'Pastry'),
('Brioche Bun', 'بريوش', 'Soft and rich egg bread.', 'خبز بيض غني وناعم.', 10.00, 'Bread'),
('Blueberry Muffin', 'مافن التوت', 'Freshly baked blueberry muffin.', 'مافن التوت المخبوز طازجاً.', 13.00, 'Pastry'),
('Pretzel', 'بريتزل', 'Classic salty twist bread.', 'خبز مالح تقليدي.', 9.00, 'Bread');

-- Orders
insert into orders (customer_name, phone, product_id, quantity, pickup_date, status)
select 'Ahmed Ali', '+971501234567', id, 2, now() + interval '1 day', 'pending'
from products where name_en = 'Sourdough Loaf' limit 1;

insert into orders (customer_name, phone, product_id, quantity, pickup_date, status)
select 'Sarah Johnson', '+971507654321', id, 5, now() + interval '2 days', 'ready'
from products where name_en = 'Croissant' limit 1;
