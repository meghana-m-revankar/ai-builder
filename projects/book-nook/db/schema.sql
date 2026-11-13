-- db/schema.sql
-- PostgreSQL production-quality schema for .NET 8 + Blazor application

create extension if not exists "uuid-ossp";
create extension if not exists "pgcrypto";

-- Tenants table for multi-tenancy
create table if not exists tenants (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    code text not null unique,
    is_active boolean not null default true,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid null,
    updated_by uuid null,
    deleted_at timestamptz null
);

comment on table tenants is 'Multi-tenant organizations or clients';
create index if not exists idx_tenants_code on tenants(code);
create index if not exists idx_tenants_active on tenants(deleted_at) where deleted_at is null;

-- Users table
create table if not exists users (
    id uuid primary key default gen_random_uuid(),
    tenant_id uuid not null references tenants(id) on delete restrict,
    email text not null unique,
    full_name text not null,
    role text not null check (role in ('Owner', 'Admin', 'Manager', 'User')),
    is_active boolean not null default true,
    password_hash text not null,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid null,
    updated_by uuid null,
    deleted_at timestamptz null
);

comment on table users is 'Application users with role-based access control';
create index if not exists idx_users_tenant_id on users(tenant_id);
create index if not exists idx_users_email on users(email);
create index if not exists idx_users_active on users(deleted_at) where deleted_at is null;

-- Categories lookup table
create table if not exists categories (
    id uuid primary key default gen_random_uuid(),
    tenant_id uuid not null references tenants(id) on delete restrict,
    name text not null,
    slug text not null,
    description text null,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid null,
    updated_by uuid null,
    deleted_at timestamptz null,
    constraint uk_categories_tenant_slug unique (tenant_id, slug)
);

comment on table categories is 'Product or item categories';
create index if not exists idx_categories_tenant_id on categories(tenant_id);
create index if not exists idx_categories_active on categories(deleted_at) where deleted_at is null;

-- Products table
create table if not exists products (
    id uuid primary key default gen_random_uuid(),
    tenant_id uuid not null references tenants(id) on delete restrict,
    category_id uuid not null references categories(id) on delete restrict,
    name text not null,
    sku text not null,
    price numeric(18,2) not null check (price >= 0),
    currency char(3) not null default 'AED',
    stock_quantity int not null default 0 check (stock_quantity >= 0),
    rating numeric(3,2) not null default 5.0 check (rating >= 0 and rating <= 5),
    reviews_count int not null default 0 check (reviews_count >= 0),
    badge text null,
    image_url text not null,
    icon text not null,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid null,
    updated_by uuid null,
    deleted_at timestamptz null,
    constraint uk_products_tenant_sku unique (tenant_id, sku)
);

comment on table products is 'Inventory items, goods or services available for order';
create index if not exists idx_products_tenant_id on products(tenant_id);
create index if not exists idx_products_category_id on products(category_id);
create index if not exists idx_products_sku on products(sku);
create index if not exists idx_products_active on products(deleted_at) where deleted_at is null;

-- Customers table
create table if not exists customers (
    id uuid primary key default gen_random_uuid(),
    tenant_id uuid not null references tenants(id) on delete restrict,
    full_name text not null,
    email text not null,
    phone text not null,
    address text not null,
    city text not null,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid null,
    updated_by uuid null,
    deleted_at timestamptz null,
    constraint uk_customers_tenant_email unique (tenant_id, email)
);

comment on table customers is 'Client customers placing orders';
create index if not exists idx_customers_tenant_id on customers(tenant_id);
create index if not exists idx_customers_email on customers(email);
create index if not exists idx_customers_active on customers(deleted_at) where deleted_at is null;

-- Orders table
create table if not exists orders (
    id uuid primary key default gen_random_uuid(),
    tenant_id uuid not null references tenants(id) on delete restrict,
    customer_id uuid not null references customers(id) on delete restrict,
    order_number text not null unique,
    status text not null check (status in ('Pending', 'Processing', 'Completed', 'Cancelled')),
    subtotal numeric(18,2) not null check (subtotal >= 0),
    tax numeric(18,2) not null check (tax >= 0),
    total_amount numeric(18,2) not null check (total_amount >= 0),
    currency char(3) not null default 'AED',
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid null,
    updated_by uuid null,
    deleted_at timestamptz null
);

comment on table orders is 'Sales orders placed by customers';
create index if not exists idx_orders_tenant_id on orders(tenant_id);
create index if not exists idx_orders_customer_id on orders(customer_id);
create index if not exists idx_orders_order_number on orders(order_number);
create index if not exists idx_orders_active on orders(deleted_at) where deleted_at is null;

-- Order items table
create table if not exists order_items (
    id uuid primary key default gen_random_uuid(),
    order_id uuid not null references orders(id) on delete restrict,
    product_id uuid not null references products(id) on delete restrict,
    quantity int not null check (quantity > 0),
    unit_price numeric(18,2) not null check (unit_price >= 0),
    total_price numeric(18,2) not null check (total_price >= 0),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid null,
    updated_by uuid null,
    deleted_at timestamptz null
);

comment on table order_items is 'Line items associated with specific sales orders';
create index if not exists idx_order_items_order_id on order_items(order_id);
create index if not exists idx_order_items_product_id on order_items(product_id);
create index if not exists idx_order_items_active on order_items(deleted_at) where deleted_at is null;

-- Testimonials table
create table if not exists testimonials (
    id uuid primary key default gen_random_uuid(),
    tenant_id uuid not null references tenants(id) on delete restrict,
    name text not null,
    role text not null,
    avatar_url text not null,
    rating int not null check (rating >= 1 and rating <= 5),
    text text not null,
    is_featured boolean not null default true,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid null,
    updated_by uuid null,
    deleted_at timestamptz null
);

comment on table testimonials is 'Customer testimonials and reviews for display';
create index if not exists idx_testimonials_tenant_id on testimonials(tenant_id);
create index if not exists idx_testimonials_active on testimonials(deleted_at) where deleted_at is null;

-- Audit logs table (insert-only, immutable)
create table if not exists audit_logs (
    id uuid primary key default gen_random_uuid(),
    tenant_id uuid null references tenants(id) on delete set null,
    user_id uuid null references users(id) on delete set null,
    action text not null,
    entity_name text not null,
    entity_id uuid null,
    details text null,
    ip_address text null,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid null,
    updated_by uuid null
);

comment on table audit_logs is 'Audit log for system access, changes, and exports';
create index if not exists idx_audit_logs_tenant_id on audit_logs(tenant_id);
create index if not exists idx_audit_logs_user_id on audit_logs(user_id);
create index if not exists idx_audit_logs_created_at on audit_logs(created_at);
