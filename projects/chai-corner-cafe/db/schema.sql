-- Schema for Chai Corner Café
-- Tables: menu_items, offers, contact_inquiries

create table menu_items (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    price numeric(18,2) not null check (price >= 0),
    currency char(3) not null default 'INR',
    category text not null,
    description text,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid
);

create table offers (
    id uuid primary key default gen_random_uuid(),
    title text not null,
    description text,
    discount_percent int not null check (discount_percent > 0 and discount_percent <= 100),
    valid_until timestamptz not null,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid
);

create table contact_inquiries (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    email text not null,
    message text not null,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);

-- Indexes
create index idx_menu_items_category on menu_items(category);
create index idx_offers_valid_until on offers(valid_until);
create index idx_contact_inquiries_created_at on contact_inquiries(created_at);

comment on table menu_items is 'Café menu items';
comment on table offers is 'Active promotional offers';
comment on table contact_inquiries is 'Customer contact form submissions';
