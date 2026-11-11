-- Schema for Meghana Portfolio Contact Submissions
-- Note: Even though the frontend is static, this database schema supports a backend
-- implementation (e.g. for contact form persistence, site analytics, or CMS features).

create extension if not exists "uuid-ossp";

-- Contact submissions table
create table contact_submissions (
    id uuid primary key default gen_random_uuid(),
    full_name text not null,
    email text not null,
    subject text not null,
    message text not null,
    status text not null default 'new' check (status in ('new', 'read', 'replied', 'archived')),
    
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);

comment on table contact_submissions is 'Stores incoming contact form messages from the portfolio.';
comment on column contact_submissions.status is 'Allowed values: new, read, replied, archived';

create index idx_contact_submissions_status on contact_submissions(status) where deleted_at is null;
create index idx_contact_submissions_created_at on contact_submissions(created_at) where deleted_at is null;

-- Projects table
create table projects (
    id uuid primary key default gen_random_uuid(),
    title text not null,
    description text not null,
    technologies text[] not null,
    project_url text,
    github_url text,
    image_url text,
    display_order int not null default 0,
    
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);

comment on table projects is 'Portfolio projects for display.';

create index idx_projects_display_order on projects(display_order) where deleted_at is null;
