-- Schema for PrintCraft E-commerce Platform

-- Products Table
create table products (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    category text not null,
    base_price numeric(18,2) not null check (base_price >= 0),
    currency char(3) not null default 'USD',
    description text,
    stock int not null default 0 check (stock >= 0),
    image_url text,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);
create index idx_products_category on products(category) where deleted_at is null;

-- Orders Table
create table orders (
    id uuid primary key default gen_random_uuid(),
    customer_id uuid not null, -- Links to OIDC user
    customer_details jsonb not null, -- Stores name, email, address
    total_amount numeric(18,2) not null check (total_amount >= 0),
    currency char(3) not null default 'USD',
    status text not null check (status in ('pending', 'processing', 'completed', 'cancelled')),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);
create index idx_orders_customer_id on orders(customer_id) where deleted_at is null;
create index idx_orders_status on orders(status) where deleted_at is null;

-- Order Items Table
create table order_items (
    id uuid primary key default gen_random_uuid(),
    order_id uuid not null references orders(id) on delete restrict,
    product_id uuid not null references products(id) on delete restrict,
    quantity int not null check (quantity > 0),
    unit_price numeric(18,2) not null check (unit_price >= 0),
    currency char(3) not null default 'USD',
    customization_json jsonb,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);
create index idx_order_items_order_id on order_items(order_id);
create index idx_order_items_product_id on order_items(product_id);

comment on table products is 'Catalog of custom printing products.';
comment on table orders is 'Customer orders for print services.';
comment on table order_items is 'Line items for orders.';
