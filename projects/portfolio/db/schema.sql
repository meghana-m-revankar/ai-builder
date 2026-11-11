-- Portfolio Database Schema

-- Enable UUID extension
create extension if not exists "pgcrypto";

-- Projects Table
create table projects (
    id uuid primary key default gen_random_uuid(),
    title text not null,
    description text not null,
    technologies text[] not null,
    project_url text,
    image_url text,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);
create index idx_projects_deleted_at on projects(deleted_at) where deleted_at is null;

-- Skills Table
create table skills (
    id uuid primary key default gen_random_uuid(),
    name text not null unique,
    category text not null, -- e.g., 'Frontend', 'Design', 'Tools'
    proficiency_level int not null check (proficiency_level between 1 and 5),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);

-- Contact Inquiries Table
create table contact_inquiries (
    id uuid primary key default gen_random_uuid(),
    full_name text not null,
    email text not null,
    message text not null,
    status text not null default 'new' check (status in ('new', 'read', 'archived')),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);
create index idx_contact_inquiries_status on contact_inquiries(status);

comment on table projects is 'Portfolio projects showcase';
comment on table skills is 'Technical skills list for Meghana';
comment on table contact_inquiries is 'Storage for contact form submissions';
