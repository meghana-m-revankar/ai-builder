-- Portfolio Database Schema

-- Enable UUID extension
create extension if not exists "pgcrypto";

-- Projects table
create table projects (
    id uuid primary key default gen_random_uuid(),
    title text not null,
    description text not null,
    image_url text,
    project_url text,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz
);

create index idx_projects_deleted_at on projects(deleted_at) where deleted_at is null;

comment on table projects is 'Portfolio projects showcase';

-- Skills table
create table skills (
    id uuid primary key default gen_random_uuid(),
    name text not null unique,
    category text not null, -- e.g., 'Frontend', 'Backend', 'Tools'
    proficiency_level int check (proficiency_level >= 1 and proficiency_level <= 5),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz
);

create index idx_skills_category on skills(category);
create index idx_skills_deleted_at on skills(deleted_at) where deleted_at is null;

comment on table skills is 'Technical competencies';

-- Contact messages (simulating backend capture for the static site contact form)
create table contact_messages (
    id uuid primary key default gen_random_uuid(),
    name text not null,
    email text not null,
    subject text,
    message text not null,
    status text not null default 'new' check (status in ('new', 'read', 'archived')),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);

create index idx_contact_messages_created_at on contact_messages(created_at);
comment on table contact_messages is 'Stored messages from contact form submissions';
