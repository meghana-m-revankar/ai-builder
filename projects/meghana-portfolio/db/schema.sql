-- Schema for Meghana Portfolio Contact Submissions
-- Database: PostgreSQL

-- Enable UUID extension
create extension if not exists "pgcrypto";

-- Table: contacts
-- Stores messages submitted via the contact form.
create table contacts (
    id uuid primary key default gen_random_uuid(),
    full_name text not null,
    email text not null,
    message text not null,
    is_read boolean not null default false,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);

comment on table contacts is 'User messages submitted through the portfolio contact form.';
comment on column contacts.is_read is 'Tracking if the message has been viewed by the portfolio owner.';

-- Index for performance
create index idx_contacts_created_at on contacts(created_at) where deleted_at is null;
create index idx_contacts_email on contacts(email) where deleted_at is null;
