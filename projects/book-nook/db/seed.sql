-- seed.sql: Realistic sample data for Book Nook Library (Sunrise School, Pune)
-- Target: PostgreSQL 15+

--------------------------------------------------------------------------------
-- 1. SEED BOOKS (12 records)
--------------------------------------------------------------------------------
insert into books (id, title, author, category, isbn, total_copies, available_copies, created_at, updated_at) values
('b1000000-0000-0000-0000-000000000001', 'Wings of Fire', 'A.P.J. Abdul Kalam', 'Autobiography', '9788173711466', 5, 4, now() - interval '30 days', now()),
('b1000000-0000-0000-0000-000000000002', 'The Discovery of India', 'Jawaharlal Nehru', 'History', '9780195623596', 3, 2, now() - interval '30 days', now()),
('b1000000-0000-0000-0000-000000000003', 'R.K. Narayan Collection: Malgudi Days', 'R.K. Narayan', 'Fiction', '9780143039655', 4, 3, now() - interval '25 days', now()),
('b1000000-0000-0000-0000-000000000004', 'The God of Small Things', 'Arundhati Roy', 'Fiction', '9780143038566', 3, 3, now() - interval '25 days', now()),
('b1000000-0000-0000-0000-000000000005', 'The White Tiger', 'Aravind Adiga', 'Fiction', '9781416562603', 2, 1, now() - interval '20 days', now()),
('b1000000-0000-0000-0000-000000000006', 'A Suitable Boy', 'Vikram Seth', 'Fiction', '9780061148514', 2, 2, now() - interval '20 days', now()),
('b1000000-0000-0000-0000-000000000007', 'Concept of Physics Vol 1', 'H.C. Verma', 'Science', '9788177091878', 10, 7, now() - interval '15 days', now()),
('b1000000-0000-0000-0000-000000000008', 'Mathematics for Class 12', 'R.D. Sharma', 'Mathematics', '9789350392338', 8, 6, now() - interval '15 days', now()),
('b1000000-0000-0000-0000-000000000009', 'Indian Polity', 'M. Laxmikanth', 'Political Science', '9789352603633', 4, 3, now() - interval '10 days', now()),
('b1000000-0000-0000-0000-000000000010', 'Modern India History', 'Bipan Chandra', 'History', '9788125036845', 5, 5, now() - interval '10 days', now()),
('b1000000-0000-0000-0000-000000000011', 'The Argumentative Indian', 'Amartya Sen', 'Philosophy', '9780141031347', 3, 3, now() - interval '5 days', now()),
('b1000000-0000-0000-0000-000000000012', 'Immortals of Meluha', 'Amish Tripathi', 'Mythology', '9789380658742', 6, 4, now() - interval '5 days', now())
on conflict (isbn) do nothing;


--------------------------------------------------------------------------------
-- 2. SEED MEMBERS (12 records)
--------------------------------------------------------------------------------
insert into members (id, name, class, phone, email, joined_date, created_at, updated_at) values
('m2000000-0000-0000-0000-000000000001', 'Meena Joshi', 'Faculty', '+91 98220 12345', 'meena.joshi@sunriseschool.example.com', '2023-04-01', now() - interval '60 days', now()),
('m2000000-0000-0000-0000-000000000002', 'Rahul Deshmukh', '12-A', '+91 98501 23456', 'rahul.deshmukh@sunriseschool.example.com', '2023-06-15', now() - interval '50 days', now()),
('m2000000-0000-0000-0000-000000000003', 'Priya Kulkarni', '12-B', '+91 97654 32109', 'priya.kulkarni@sunriseschool.example.com', '2023-06-15', now() - interval '50 days', now()),
('m2000000-0000-0000-0000-000000000004', 'Amit Shinde', '11-A', '+91 94223 45678', 'amit.shinde@sunriseschool.example.com', '2023-07-01', now() - interval '45 days', now()),
('m2000000-0000-0000-0000-000000000005', 'Sneha Patil', '11-B', '+91 99234 56789', 'sneha.patil@sunriseschool.example.com', '2023-07-01', now() - interval '45 days', now()),
('m2000000-0000-0000-0000-000000000006', 'Rohan Gokhale', '10-A', '+91 93710 11223', 'rohan.gokhale@sunriseschool.example.com', '2023-07-10', now() - interval '40 days', now()),
('m2000000-0000-0000-0000-000000000007', 'Ananya Joshi', '10-A', '+91 98231 44556', 'ananya.joshi@sunriseschool.example.com', '2023-07-10', now() - interval '40 days', now()),
('m2000000-0000-0000-0000-000000000008', 'Vikramaditya Mane', '9-C', '+91 96570 78899', 'vikram.mane@sunriseschool.example.com', '2023-08-01', now() - interval '30 days', now()),
('m2000000-0000-0000-0000-000000000009', 'Tanvi Apte', '9-B', '+91 98811 22334', 'tanvi.apte@sunriseschool.example.com', '2023-08-01', now() - interval '30 days', now()),
('m2000000-0000-0000-0000-000000000010', 'Siddharth Pawar', '8-A', '+91 95450 99887', 'siddharth.pawar@sunriseschool.example.com', '2023-08-10', now() - interval '20 days', now()),
('m2000000-0000-0000-0000-000000000011', 'Neha Kadam', '8-B', '+91 97632 11002', 'neha.kadam@sunriseschool.example.com', '2023-08-10', now() - interval '20 days', now()),
('m2000000-0000-0000-0000-000000000012', 'Dr. Suresh Oak', 'Faculty', '+91 98221 55667', 'suresh.oak@sunriseschool.example.com', '2023-04-01', now() - interval '60 days', now())
on conflict (email) do nothing;


--------------------------------------------------------------------------------
-- 3. SEED LOANS (12 records with varied active, returned, and overdue states)
--------------------------------------------------------------------------------
insert into loans (id, book_id, member_id, issue_date, due_date, return_date, fine, created_at, updated_at) values
-- Active regular loans
('l3000000-0000-0000-0000-000000000001', 'b1000000-0000-0000-0000-000000000001', 'b1000000-0000-0000-0000-000000000002', now() - interval '5 days', now() + interval '9 days', null, 0.00, now() - interval '5 days', now()),
('l3000000-0000-0000-0000-000000000002', 'b1000000-0000-0000-0000-000000000002', 'b1000000-0000-0000-0000-000000000003', now() - interval '3 days', now() + interval '11 days', null, 0.00, now() - interval '3 days', now()),
-- Active Overdue loans (due date in the past, return_date is null)
('l3000000-0000-0000-0000-000000000003', 'b1000000-0000-0000-0000-000000000005', 'b1000000-0000-0000-0000-000000000004', now() - interval '20 days', now() - interval '6 days', null, 0.00, now() - interval '20 days', now()),
('l3000000-0000-0000-0000-000000000004', 'b1000000-0000-0000-0000-000000000007', 'b1000000-0000-0000-0000-000000000006', now() - interval '18 days', now() - interval '4 days', null, 0.00, now() - interval '18 days', now()),
('l3000000-0000-0000-0000-000000000005', 'b1000000-0000-0000-0000-000000000008', 'b1000000-0000-0000-0000-000000000007', now() - interval '15 days', now() - interval '1 day', null, 0.00, now() - interval '15 days', now()),
-- Returned on time
('l3000000-0000-0000-0000-000000000006', 'b1000000-0000-0000-0000-000000000003', 'b1000000-0000-0000-0000-000000000008', now() - interval '25 days', now() - interval '11 days', now() - interval '12 days', 0.00, now() - interval '25 days', now() - interval '12 days'),
('l3000000-0000-0000-0000-000000000007', 'b1000000-0000-0000-0000-000000000009', 'b1000000-0000-0000-0000-000000000009', now() - interval '20 days', now() - interval '6 days', now() - interval '8 days', 0.00, now() - interval '20 days', now() - interval '8 days'),
-- Returned late with fine
('l3000000-0000-0000-0000-000000000008', 'b1000000-0000-0000-0000-000000000007', 'b1000000-0000-0000-0000-000000000010', now() - interval '30 days', now() - interval '16 days', now() - interval '10 days', 30.00, now() - interval '30 days', now() - interval '10 days'),
('l3000000-0000-0000-0000-000000000009', 'b1000000-0000-0000-0000-000000000012', 'b1000000-0000-0000-0000-000000000011', now() - interval '25 days', now() - interval '11 days', now() - interval '5 days', 35.00, now() - interval '25 days', now() - interval '5 days'),
('l3000000-0000-0000-0000-000000000010', 'b1000000-0000-0000-0000-000000000012', 'b1000000-0000-0000-0000-000000000002', now() - interval '22 days', now() - interval '8 days', now() - interval '7 days', 5.00, now() - interval '22 days', now() - interval '7 days'),
-- Additional active loans
('l3000000-0000-0000-0000-000000000011', 'b1000000-0000-0000-0000-000000000007', 'b1000000-0000-0000-0000-000000000003', now() - interval '2 days', now() + interval '12 days', null, 0.00, now() - interval '2 days', now()),
('l3000000-0000-0000-0000-000000000012', 'b1000000-0000-0000-0000-000000000007', 'b1000000-0000-0000-0000-000000000005', now() - interval '1 day', now() + interval '13 days', null, 0.00, now() - interval '1 day', now())
on conflict do nothing;
