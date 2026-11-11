-- Procedures for Meghana Portfolio Database

-- =================================================================================
-- CONTACT SUBMISSIONS
-- =================================================================================

-- Create contact submission
create or replace function fn_contact_submission_create(
    p_full_name text,
    p_email text,
    p_subject text,
    p_message text
) returns setof contact_submissions language plpgsql as $$
begin
    if p_full_name is null or p_email is null or p_message is null then
        raise exception 'FIELDS_REQUIRED' using errcode = 'P0001';
    end if;

    return query
    insert into contact_submissions (full_name, email, subject, message)
    values (p_full_name, p_email, p_subject, p_message)
    returning *;
end;
$$;

-- Get contact submission by id
create or replace function fn_contact_submission_get(p_id uuid) returns setof contact_submissions language plpgsql as $$
begin
    return query select * from contact_submissions where id = p_id and deleted_at is null;
end;
$$;

-- List contact submissions with paging
create or replace function fn_contact_submission_list(p_limit int default 20, p_offset int default 0) returns setof contact_submissions language plpgsql as $$
begin
    return query select * from contact_submissions where deleted_at is null order by created_at desc limit p_limit offset p_offset;
end;
$$;

-- Update contact submission status
create or replace function fn_contact_submission_update_status(p_id uuid, p_status text) returns setof contact_submissions language plpgsql as $$
begin
    if p_status not in ('new', 'read', 'replied', 'archived') then
        raise exception 'INVALID_STATUS' using errcode = 'P0001';
    end if;

    return query
    update contact_submissions
    set status = p_status, updated_at = now()
    where id = p_id and deleted_at is null
    returning *;
end;
$$;

-- Soft delete contact submission
create or replace function fn_contact_submission_delete(p_id uuid) returns void language plpgsql as $$
begin
    update contact_submissions set deleted_at = now() where id = p_id;
end;
$$;

-- =================================================================================
-- PROJECTS
-- =================================================================================

-- Create project
create or replace function fn_project_create(
    p_title text,
    p_description text,
    p_technologies text[],
    p_project_url text default null,
    p_github_url text default null,
    p_image_url text default null,
    p_display_order int default 0
) returns setof projects language plpgsql as $$
begin
    return query
    insert into projects (title, description, technologies, project_url, github_url, image_url, display_order)
    values (p_title, p_description, p_technologies, p_project_url, p_github_url, p_image_url, p_display_order)
    returning *;
end;
$$;

-- Get project by id
create or replace function fn_project_get(p_id uuid) returns setof projects language plpgsql as $$
begin
    return query select * from projects where id = p_id and deleted_at is null;
end;
$$;

-- List projects
create or replace function fn_project_list() returns setof projects language plpgsql as $$
begin
    return query select * from projects where deleted_at is null order by display_order asc, created_at desc;
end;
$$;

-- Update project
create or replace function fn_project_update(
    p_id uuid,
    p_title text,
    p_description text,
    p_technologies text[],
    p_project_url text,
    p_github_url text,
    p_image_url text,
    p_display_order int
) returns setof projects language plpgsql as $$
begin
    return query
    update projects
    set title = p_title,
        description = p_description,
        technologies = p_technologies,
        project_url = p_project_url,
        github_url = p_github_url,
        image_url = p_image_url,
        display_order = p_display_order,
        updated_at = now()
    where id = p_id and deleted_at is null
    returning *;
end;
$$;

-- Soft delete project
create or replace function fn_project_delete(p_id uuid) returns void language plpgsql as $$
begin
    update projects set deleted_at = now() where id = p_id;
end;
$$;
