-- Schema definition for Golden Crust Bakery
-- PostgreSQL 16+

-- Enable UUID extension
create extension if not exists "pgcrypto";

-- Products Table
create table products (
    id uuid primary key default gen_random_uuid(),
    name_en text not null,
    name_ar text not null,
    description text,
    price numeric(18,2) not null check (price >= 0),
    currency char(3) not null default 'AED',
    is_daily_special boolean not null default false,
    is_bestseller boolean not null default false,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz,
    constraint ck_currency_aed check (currency = 'AED')
);

comment on table products is 'Catalog of bakery items available for pre-order.';
create index idx_products_deleted_at on products(deleted_at) where deleted_at is null;

-- Orders Table
-- Status: pending, confirmed, cancelled, completed
create table pre_orders (
    id uuid primary key default gen_random_uuid(),
    product_id uuid not null references products(id) on delete restrict,
    customer_name text not null,
    phone text not null,
    quantity int not null check (quantity > 0),
    pickup_date timestamptz not null,
    status text not null default 'pending' check (status in ('pending', 'confirmed', 'cancelled', 'completed')),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz
);

comment on table pre_orders is 'Customer pre-order requests.';
create index idx_pre_orders_product_id on pre_orders(product_id);
create index idx_pre_orders_deleted_at on pre_orders(deleted_at) where deleted_at is null;

-- Audit / Log Table
create table audit_logs (
    id uuid primary key default gen_random_uuid(),
    entity_name text not null,
    entity_id uuid not null,
    action text not null,
    changed_by uuid,
    created_at timestamptz not null default now()
);
