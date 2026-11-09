-- schema.sql
create table class_types (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    intensity text not null check (intensity in ('Low', 'Medium', 'High')),
    duration_minutes int not null check (duration_minutes > 0),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz,
    unique (name)
);
create index idx_class_types_deleted_at on class_types (deleted_at) where deleted_at is null;

create table trainers (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    specialty text not null,
    photo_url text,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz
);
create index idx_trainers_deleted_at on trainers (deleted_at) where deleted_at is null;

create table class_schedules (
    id uuid primary key default gen_random_uuid(),
    class_type_id uuid not null references class_types(id) on delete restrict,
    trainer_id uuid not null references trainers(id) on delete restrict,
    start_time timestamptz not null,
    end_time timestamptz not null,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz,
    constraint check_times check (end_time > start_time)
);
create index idx_class_schedules_fk on class_schedules (class_type_id, trainer_id);
create index idx_class_schedules_times on class_schedules (start_time, end_time);
create index idx_class_schedules_deleted_at on class_schedules (deleted_at) where deleted_at is null;

create table bookings (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    phone text not null,
    email text not null,
    class_schedule_id uuid not null references class_schedules(id) on delete restrict,
    status text not null check (status in ('Pending', 'Confirmed', 'Cancelled')),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz
);
create index idx_bookings_schedule on bookings (class_schedule_id);
create index idx_bookings_email on bookings (email);
create index idx_bookings_deleted_at on bookings (deleted_at) where deleted_at is null;

create table memberships (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    price_aed numeric(18,2) not null check (price_aed >= 0),
    currency char(3) default 'AED',
    description text,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz
);
create index idx_memberships_deleted_at on memberships (deleted_at) where deleted_at is null;

comment on table class_types is 'Definitions of fitness class categories';
comment on table class_schedules is 'Actual occurrences of classes with trainer assignment';
comment on table bookings is 'User trial class bookings';
