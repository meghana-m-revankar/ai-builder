-- PrintCraft Database Schema
-- Location: Bangalore, India
-- Currency: INR (Indian Rupee)

create table products (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    base_price numeric(18, 2) not null check (base_price >= 0),
    currency char(3) not null default 'INR',
    category text not null,
    options jsonb, -- Stores custom configuration like paper quality, size, color
    is_active boolean not null default true,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);

create index idx_products_category on products(category) where deleted_at is null;

comment on table products is 'Core print products available for order';

create table orders (
    id uuid primary key default gen_random_uuid(),
    customer_id uuid not null,
    total_amount numeric(18, 2) not null check (total_amount >= 0),
    gst_amount numeric(18, 2) not null check (gst_amount >= 0),
    currency char(3) not null default 'INR',
    status text not null check (status in ('Pending', 'Processing', 'Printed', 'Shipped', 'Delivered', 'Cancelled')),
    shipping_address jsonb not null,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);

create index idx_orders_customer_id on orders(customer_id) where deleted_at is null;
create index idx_orders_status on orders(status) where deleted_at is null;

comment on table orders is 'Customer order headers';

create table order_items (
    id uuid primary key default gen_random_uuid(),
    order_id uuid not null references orders(id) on delete restrict,
    product_id uuid not null references products(id) on delete restrict,
    quantity int not null check (quantity > 0),
    unit_price numeric(18, 2) not null check (unit_price >= 0),
    file_url text not null,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);

create index idx_order_items_order_id on order_items(order_id);
create index idx_order_items_product_id on order_items(product_id);

comment on table order_items is 'Line items for orders';
