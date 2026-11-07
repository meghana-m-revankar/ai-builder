-- PostgreSQL Schema
CREATE TABLE products (
  id uuid primary key default gen_random_uuid(),
  name_en text not null,
  name_ar text not null,
  price numeric(18,2) not null,
  category text not null
);

CREATE TABLE orders (
  id uuid primary key default gen_random_uuid(),
  customer_name text not null,
  phone text not null,
  product_id uuid references products(id),
  quantity int not null check (quantity > 0),
  pickup_date timestamptz not null,
  status text not null default 'Pending'
);
