-- Database Schema for Bloom Flower Shop
-- PostgreSQL 16+

-- Set client encoding
set client_encoding = 'UTF8';

-- Bouquets Table
create table bouquets (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    description text,
    price numeric(18, 2) not null check (price >= 0),
    currency char(3) not null default 'AED',
    image_url text,
    is_active boolean not null default true,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);

create index idx_bouquets_is_active on bouquets(is_active) where deleted_at is null;

comment on table bouquets is 'Catalog of flower bouquets available for purchase.';

-- Orders Table
create table orders (
    id uuid primary key default gen_random_uuid(),
    customer_name text not null,
    customer_phone text not null,
    delivery_date timestamptz not null,
    gift_message text,
    status text not null check (status in ('New', 'Confirmed', 'Delivered', 'Cancelled')),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);

create index idx_orders_status on orders(status) where deleted_at is null;
create index idx_orders_delivery_date on orders(delivery_date) where deleted_at is null;

comment on table orders is 'Customer orders for flower bouquets. Status: New, Confirmed, Delivered, Cancelled.';
