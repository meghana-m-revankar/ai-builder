-- Fleet Tracker Schema
-- Version: 1.0.0

-- Extensions
create extension if not exists "uuid-ossp";

-- Tables
create table vans (
    id uuid primary key default gen_random_uuid(),
    plate_number text not null unique,
    model text not null,
    status text not null check (status in ('Active', 'InMaintenance', 'Retired')),
    last_maintenance_date timestamptz,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);
comment on table vans is 'Registry of all delivery vans in the fleet';

create table drivers (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    license_number text not null unique,
    license_expiry_date date not null,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);

create table maintenance_logs (
    id uuid primary key default gen_random_uuid(),
    van_id uuid not null references vans(id) on delete restrict,
    description text not null,
    cost numeric(18,2) not null check (cost >= 0),
    log_date timestamptz not null default now(),
    created_at timestamptz not null default now()
);
create index idx_maintenance_logs_van_id on maintenance_logs(van_id);

create table deliveries (
    id uuid primary key default gen_random_uuid(),
    van_id uuid not null references vans(id) on delete restrict,
    driver_id uuid not null references drivers(id) on delete restrict,
    status text not null check (status in ('Planned', 'InProgress', 'Completed', 'Cancelled')),
    completion_time timestamptz,
    fuel_cost numeric(18,2) default 0,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);
create index idx_deliveries_van_id on deliveries(van_id);
create index idx_deliveries_driver_id on deliveries(driver_id);

-- Audit / System Columns trigger
create or replace function fn_update_updated_at()
returns trigger as $$
begin
    new.updated_at = now();
    return new;
end;
$$ language plpgsql;

create trigger trg_vans_updated_at before update on vans for each row execute function fn_update_updated_at();
create trigger trg_drivers_updated_at before update on drivers for each row execute function fn_update_updated_at();
create trigger trg_deliveries_updated_at before update on deliveries for each row execute function fn_update_updated_at();
