-- schema.sql: Database schema for Meghana Portfolio contact and project data

-- Projects Table
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
    deleted_at timestamptz null
);

create index idx_projects_deleted_at on projects(deleted_at) where deleted_at is null;

-- Contact Messages Table
create table contact_messages (
    id uuid primary key default gen_random_uuid(),
    full_name text not null,
    email text not null,
    subject text not null,
    message text not null,
    status text not null default 'new' check (status in ('new', 'read', 'archived')),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);

create index idx_contact_messages_status on contact_messages(status) where deleted_at is null;
create index idx_contact_messages_deleted_at on contact_messages(deleted_at) where deleted_at is null;

comment on table projects is 'Portfolio project showcase items';
comment on table contact_messages is 'Client inquiry forms';
comment on column contact_messages.status is 'Status values: new (default), read, archived';
