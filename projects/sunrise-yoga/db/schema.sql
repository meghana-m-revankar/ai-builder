-- Schema for Sunrise Yoga
-- Database: PostgreSQL
-- Conventions: snake_case, UUID PK, audit columns, soft delete

-- Enable uuid-ossp extension
create extension if not exists "pgcrypto";

-- Table: instructors
create table instructors (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    bio text,
    specialty text,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz
);
create index idx_instructors_deleted_at on instructors (deleted_at) where deleted_at is null;

-- Table: classes
create table classes (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    description text,
    level text not null check (level in ('Beginner', 'Intermediate', 'Advanced')),
    duration_minutes int not null check (duration_minutes > 0),
    base_price numeric(18,2) not null check (base_price >= 0),
    currency char(3) not null default 'AED',
    instructor_id uuid not null references instructors(id) on delete restrict,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz
);
create index idx_classes_instructor_id on classes(instructor_id);
create index idx_classes_deleted_at on classes (deleted_at) where deleted_at is null;

-- Table: schedule
create table schedules (
    id uuid primary key default gen_random_uuid(),
    class_id uuid not null references classes(id) on delete restrict,
    start_time timestamptz not null,
    end_time timestamptz not null,
    room_number text,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    constraint ck_schedule_time_order check (end_time > start_time)
);
create index idx_schedules_class_id on schedules(class_id);
create index idx_schedules_start_time on schedules(start_time);
