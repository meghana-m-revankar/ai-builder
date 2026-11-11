-- Database Schema for Meghana Portfolio
-- PostgreSQL conventions: snake_case, uuid primary keys, standard audit columns

-- Projects Table
create table projects (
    id uuid primary key default gen_random_uuid(),
    title text not null,
    description text not null,
    tech_stack text[] not null,
    project_url text,
    image_url text,
    display_order int not null default 0,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);
create index idx_projects_deleted_at on projects (deleted_at) where deleted_at is null;

-- Skills Table
create table skills (
    id uuid primary key default gen_random_uuid(),
    name text not null unique,
    category text not null, -- 'Frontend', 'Backend', 'Tools', 'Design'
    proficiency_level int not null check (proficiency_level between 1 and 5),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid
);

-- Contact Messages Table
create table contact_messages (
    id uuid primary key default gen_random_uuid(),
    full_name text not null,
    email text not null,
    subject text,
    message text not null,
    status text not null default 'new' check (status in ('new', 'read', 'archived')),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);
create index idx_contact_messages_status on contact_messages (status);

comment on table projects is 'Portfolio projects gallery';
comment on table skills is 'Technical skills list';
comment on table contact_messages is 'Inquiries from the website contact form';
