-- Schema for Restriviz POS
-- Tables: categories, products, tables, orders, order_items

create table categories (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz,
    unique(name)
);

create index idx_categories_deleted_at on categories(deleted_at) where deleted_at is null;

create table products (
    id uuid primary key default gen_random_uuid(),
    category_id uuid not null references categories(id) on delete restrict,
    name text not null,
    price numeric(18,2) not null check (price >= 0),
    currency char(3) not null default 'AED',
    is_veg boolean not null default false,
    is_available boolean not null default true,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz
);

create index idx_products_category_id on products(category_id);
create index idx_products_deleted_at on products(deleted_at) where deleted_at is null;

create table tables (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    is_occupied boolean not null default false,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz
);

create index idx_tables_deleted_at on tables(deleted_at) where deleted_at is null;

create table orders (
    id uuid primary key default gen_random_uuid(),
    table_id uuid references tables(id) on delete restrict,
    type text not null check (type in ('dine-in', 'takeaway')),
    status text not null check (status in ('pending', 'preparing', 'served', 'completed', 'cancelled')),
    payment_status text not null check (payment_status in ('unpaid', 'paid', 'refunded')),
    total_amount numeric(18,2) not null default 0 check (total_amount >= 0),
    currency char(3) not null default 'AED',
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz
);

create index idx_orders_table_id on orders(table_id);
create index idx_orders_status on orders(status);
create index idx_orders_deleted_at on orders(deleted_at) where deleted_at is null;

create table order_items (
    id uuid primary key default gen_random_uuid(),
    order_id uuid not null references orders(id) on delete restrict,
    product_id uuid not null references products(id) on delete restrict,
    quantity int not null check (quantity > 0),
    price_at_order numeric(18,2) not null check (price_at_order >= 0),
    notes text,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz
);

create index idx_order_items_order_id on order_items(order_id);
create index idx_order_items_product_id on order_items(product_id);
create index idx_order_items_deleted_at on order_items(deleted_at) where deleted_at is null;

comment on table orders is 'Main order record for cafe';
comment on column orders.type is 'Allowed values: dine-in, takeaway';
comment on column orders.status is 'Allowed values: pending, preparing, served, completed, cancelled';
