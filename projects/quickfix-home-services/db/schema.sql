-- Schema for QuickFix Home Services
-- Tables: technicians, bookings, payments

create table technicians (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    specialty text not null,
    phone text not null,
    is_available boolean not null default true,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);

create table bookings (
    id uuid primary key default gen_random_uuid(),
    customer_id uuid not null,
    service_type text not null,
    address text not null,
    scheduled_at timestamptz not null,
    status text not null check (status in ('pending', 'assigned', 'in_progress', 'completed', 'cancelled')),
    technician_id uuid references technicians(id),
    total_price numeric(18,2) not null,
    currency char(3) not null default 'INR',
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);

create table payments (
    id uuid primary key default gen_random_uuid(),
    booking_id uuid not null references bookings(id),
    amount numeric(18,2) not null,
    status text not null check (status in ('pending', 'paid', 'failed', 'refunded')),
    payment_method text not null,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid
);

-- Indexes
create index idx_bookings_customer_id on bookings(customer_id);
create index idx_bookings_technician_id on bookings(technician_id);
create index idx_bookings_status on bookings(status) where deleted_at is null;
create index idx_payments_booking_id on payments(booking_id);

comment on table technicians is 'List of professional tradespeople';
comment on table bookings is 'Service requests from homeowners';
comment on table payments is 'Financial transactions for bookings';
