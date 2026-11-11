-- Core Schema for Smart Retail POS
-- Note: PostgreSQL convention snake_case, UUID PKs, audit columns, RLS placeholders.

create table categories (
    id uuid primary key default gen_random_uuid(),
    name text not null unique,
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
    sku text not null unique,
    name text not null,
    price numeric(18,2) not null check (price >= 0),
    currency char(3) not null default 'USD',
    stock_quantity int not null default 0 check (stock_quantity >= 0),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);
create index idx_products_category_id on products(category_id);
create index idx_products_sku on products(sku);
create index idx_products_deleted_at on products(deleted_at) where deleted_at is null;

create table orders (
    id uuid primary key default gen_random_uuid(),
    order_number text not null unique,
    total_amount numeric(18,2) not null check (total_amount >= 0),
    tax numeric(18,2) not null default 0,
    discount numeric(18,2) not null default 0,
    payment_method text not null check (payment_method in ('cash', 'card', 'transfer')),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid
);
create index idx_orders_created_at on orders(created_at);

create table order_items (
    id uuid primary key default gen_random_uuid(),
    order_id uuid not null references orders(id) on delete cascade,
    product_id uuid not null references products(id) on delete restrict,
    quantity int not null check (quantity > 0),
    price_at_purchase numeric(18,2) not null check (price_at_purchase >= 0),
    created_at timestamptz not null default now()
);
create index idx_order_items_order_id on order_items(order_id);
create index idx_order_items_product_id on order_items(product_id);

comment on table products is 'Core inventory storage';
comment on table orders is 'Sales transactions';
