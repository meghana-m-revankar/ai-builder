-- Schema for Golden Crust Bakery
-- All times in UTC

create table products (
    id uuid primary key default gen_random_uuid(),
    name_en text not null,
    name_ar text not null,
    price_aed numeric(18, 2) not null check (price_aed >= 0),
    currency char(3) default 'AED',
    is_best_seller boolean not null default false,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz
);

create table orders (
    id uuid primary key default gen_random_uuid(),
    customer_name text not null,
    phone text not null,
    product_id uuid not null references products(id) on delete restrict,
    quantity int not null check (quantity > 0),
    pickup_date timestamptz not null,
    status text not null default 'Pending' check (status in ('Pending', 'Confirmed', 'Completed', 'Cancelled')),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz
);

create table testimonials (
    id uuid primary key default gen_random_uuid(),
    customer_name text not null,
    content text not null,
    rating int not null check (rating >= 1 and rating <= 5),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    deleted_at timestamptz
);

-- Indexes
create index idx_products_deleted_at on products(deleted_at) where deleted_at is null;
create index idx_orders_product_id on orders(product_id);
create index idx_orders_status on orders(status);
create index idx_orders_deleted_at on orders(deleted_at) where deleted_at is null;
create index idx_testimonials_deleted_at on testimonials(deleted_at) where deleted_at is null;

comment on table products is 'Bakery items menu';
comment on column products.status is 'Allowed: Pending, Confirmed, Completed, Cancelled';
