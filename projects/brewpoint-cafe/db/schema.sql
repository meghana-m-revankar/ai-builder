-- BrewPoint Cafe Schema

create table locations (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    address text not null,
    opening_hours text,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);
create index idx_locations_deleted_at on locations(deleted_at) where deleted_at is null;

create table products (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    category text not null,
    price numeric(18,2) not null check (price >= 0),
    currency char(3) not null default 'AED',
    stock_quantity int not null default 0 check (stock_quantity >= 0),
    image_url text,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);
create index idx_products_deleted_at on products(deleted_at) where deleted_at is null;

create table customers (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    email text not null unique,
    loyalty_points int not null default 0,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);
create index idx_customers_deleted_at on customers(deleted_at) where deleted_at is null;

create table orders (
    id uuid primary key default gen_random_uuid(),
    customer_id uuid references customers(id) on delete restrict,
    location_id uuid references locations(id) on delete restrict,
    total_amount numeric(18,2) not null check (total_amount >= 0),
    currency char(3) not null default 'AED',
    payment_method text not null check (payment_method in ('card', 'cash', 'wallet')),
    status text not null check (status in ('pending', 'completed', 'cancelled')),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);
create index idx_orders_customer_id on orders(customer_id);
create index idx_orders_location_id on orders(location_id);
create index idx_orders_deleted_at on orders(deleted_at) where deleted_at is null;

create table order_items (
    id uuid primary key default gen_random_uuid(),
    order_id uuid not null references orders(id) on delete cascade,
    product_id uuid not null references products(id) on delete restrict,
    quantity int not null check (quantity > 0),
    unit_price numeric(18,2) not null check (unit_price >= 0),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid
);
create index idx_order_items_order_id on order_items(order_id);
create index idx_order_items_product_id on order_items(product_id);
