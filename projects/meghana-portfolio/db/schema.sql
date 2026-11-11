-- Schema for Meghana Portfolio Analytics/Contact Logs
-- Note: While the frontend is static, this schema supports a backend if requirements evolve.

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

create index idx_contact_submissions_status on contact_submissions(status) where deleted_at is null;
create index idx_contact_submissions_created_at on contact_submissions(created_at);

comment on table contact_submissions is 'Stores contact form submissions from the portfolio site.';
comment on column contact_submissions.status is 'Allowed values: new, read, replied, archived.';

create table project_stats (
    id uuid primary key default gen_random_uuid(),
    project_slug text not null unique,
    view_count integer not null default 0,
    click_count integer not null default 0,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);

create index idx_project_stats_slug on project_stats(project_slug);

comment on table project_stats is 'Tracks engagement metrics for portfolio projects.';
