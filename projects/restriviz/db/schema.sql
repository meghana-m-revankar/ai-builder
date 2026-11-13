-- PostgreSQL Schema for Restriviz POS
-- Tables: categories, products, tables, orders, order_items, payments

create table categories (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);
create index idx_categories_deleted_at on categories(deleted_at) where deleted_at is null;

create table products (
    id uuid primary key default gen_random_uuid(),
    category_id uuid not null references categories(id) on delete restrict,
    name text not null,
    price numeric(18,2) not null check (price >= 0),
    currency char(3) not null default 'INR',
    is_veg boolean not null default true,
    is_available boolean not null default true,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);
create index idx_products_category_id on products(category_id);
create index idx_products_deleted_at on products(deleted_at) where deleted_at is null;

create table restaurant_tables (
    id uuid primary key default gen_random_uuid(),
    number int not null unique,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);
create index idx_tables_deleted_at on restaurant_tables(deleted_at) where deleted_at is null;

create table orders (
    id uuid primary key default gen_random_uuid(),
    table_id uuid references restaurant_tables(id) on delete restrict,
    order_type text not null check (order_type in ('Dine-in', 'Takeaway')),
    total_amount numeric(18,2) not null check (total_amount >= 0),
    discount numeric(18,2) not null default 0 check (discount >= 0),
    status text not null check (status in ('Pending', 'Preparing', 'Completed', 'Cancelled')),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);
create index idx_orders_table_id on orders(table_id);
create index idx_orders_deleted_at on orders(deleted_at) where deleted_at is null;

create table order_items (
    id uuid primary key default gen_random_uuid(),
    order_id uuid not null references orders(id) on delete restrict,
    product_id uuid not null references products(id) on delete restrict,
    quantity int not null check (quantity > 0),
    price numeric(18,2) not null check (price >= 0),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);
create index idx_order_items_order_id on order_items(order_id);
create index idx_order_items_product_id on order_items(product_id);

create table payments (
    id uuid primary key default gen_random_uuid(),
    order_id uuid not null references orders(id) on delete restrict,
    payment_type text not null check (payment_type in ('Cash', 'Card', 'UPI')),
    amount numeric(18,2) not null check (amount >= 0),
    currency char(3) not null default 'INR',
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);
create index idx_payments_order_id on payments(order_id);
