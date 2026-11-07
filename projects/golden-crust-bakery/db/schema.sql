-- Schema for Golden Crust Bakery
-- Tables: products, orders, reviews

-- Enable UUID extension
create extension if not exists "pgcrypto";

-- Products Table
create table products (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    description text,
    price numeric(18,2) not null check (price >= 0),
    currency char(3) not null default 'AED',
    image_url text,
    is_special boolean not null default false,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);
create index idx_products_deleted_at on products(deleted_at) where deleted_at is null;

comment on table products is 'Artisan bakery products catalog';
comment on column products.status is 'Soft deleted records excluded via index';

-- Orders Table
-- Status values: 'new', 'baking', 'ready', 'collected', 'cancelled'
create table orders (
    id uuid primary key default gen_random_uuid(),
    customer_name text not null,
    phone text not null,
    product_id uuid not null references products(id) on delete restrict,
    quantity integer not null check (quantity > 0),
    pickup_date timestamptz not null,
    status text not null default 'new' check (status in ('new', 'baking', 'ready', 'collected', 'cancelled')),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);
create index idx_orders_product_id on orders(product_id);
create index idx_orders_status on orders(status);
create index idx_orders_deleted_at on orders(deleted_at) where deleted_at is null;

comment on table orders is 'Customer pre-orders for bakery items';

-- Reviews Table
create table reviews (
    id uuid primary key default gen_random_uuid(),
    customer_name text not null,
    rating integer not null check (rating >= 1 and rating <= 5),
    comment text,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);
create index idx_reviews_deleted_at on reviews(deleted_at) where deleted_at is null;

comment on table reviews is 'Customer feedback for bakery';
