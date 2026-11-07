-- Schema definition for Golden Crust Bakery
-- Version: 1.0

-- Extensions
create extension if not exists "uuid-ossp";

-- Tables
create table products (
    id uuid primary key default gen_random_uuid(),
    name_en text not null,
    name_ar text not null,
    description_en text,
    description_ar text,
    price_aed numeric(18,2) not null check (price_aed >= 0),
    category text not null,
    is_available boolean not null default true,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);

create table orders (
    id uuid primary key default gen_random_uuid(),
    customer_name text not null,
    phone text not null,
    product_id uuid not null references products(id) on delete restrict,
    quantity integer not null check (quantity > 0),
    pickup_date timestamptz not null,
    status text not null default 'pending' check (status in ('pending', 'ready', 'completed')),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);

-- Indexes
create index idx_products_category on products(category);
create index idx_orders_product_id on orders(product_id);
create index idx_orders_status on orders(status);
create index idx_orders_pickup_date on orders(pickup_date);

-- Comments
comment on table products is 'Artisan bakery products catalog';
comment on table orders is 'Customer orders for pickup';
comment on column orders.status is 'Order status: pending, ready, completed';
