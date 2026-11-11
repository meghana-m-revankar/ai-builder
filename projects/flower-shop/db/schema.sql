-- Schema for Flower Shop Database
-- PostgreSQL

-- Categories lookup
create table categories (
    id uuid primary key default gen_random_uuid(),
    name text not null unique,
    description text,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid
);

-- Products catalog
create table products (
    id uuid primary key default gen_random_uuid(),
    category_id uuid not null references categories(id) on delete restrict,
    name text not null,
    description text,
    price numeric(18,2) not null check (price >= 0),
    currency char(3) not null default 'AED',
    stock_quantity int not null default 0 check (stock_quantity >= 0),
    image_url text,
    is_featured boolean not null default false,
    deleted_at timestamptz null,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid
);

-- Contact messages/inquiries
create table inquiries (
    id uuid primary key default gen_random_uuid(),
    full_name text not null,
    email text not null,
    phone text,
    message text not null,
    status text not null default 'new' check (status in ('new', 'read', 'replied')),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);

-- Indexes
create index idx_products_category_id on products(category_id);
create index idx_products_deleted_at on products(deleted_at) where deleted_at is null;
create index idx_inquiries_status on inquiries(status);

comment on table categories is 'Categories for floral products';
comment on table products is 'Flower shop inventory';
comment on table inquiries is 'Customer contact form submissions';
