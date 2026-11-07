-- Fleet Tracker Schema
-- Tables: vans, drivers, maintenance

create table vans (
    id uuid primary key default gen_random_uuid(),
    plate text not null unique,
    -- Status: 'available', 'in_maintenance', 'in_transit', 'retired'
    status text not null check (status in ('available', 'in_maintenance', 'in_transit', 'retired')),
    last_maintenance_date timestamptz not null default now(),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);

create index idx_vans_status on vans(status) where deleted_at is null;

create table drivers (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    license_expiry timestamptz not null,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);

create table maintenance (
    id uuid primary key default gen_random_uuid(),
    van_id uuid not null references vans(id) on delete restrict,
    cost numeric(18,2) not null check (cost >= 0),
    currency char(3) not null default 'AED',
    description text not null,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);

create index idx_maintenance_van_id on maintenance(van_id);
create index idx_maintenance_created_at on maintenance(created_at);

comment on table vans is 'Stores fleet vehicles';
comment on column vans.status is 'Allowed values: available, in_maintenance, in_transit, retired';
comment on table maintenance is 'Stores service history for vans';
