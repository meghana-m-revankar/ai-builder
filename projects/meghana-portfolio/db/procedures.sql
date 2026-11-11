-- db/procedures.sql

-- ============================================================================
-- Projects CRUD
-- ============================================================================

create or replace function fn_project_create(
    p_title text,
    p_description text,
    p_image_url text,
    p_project_url text
) returns setof projects as $$
begin
    if p_title is null or p_description is null then
        raise exception 'TITLE_AND_DESCRIPTION_REQUIRED' using errcode = 'P0001';
    end if;

    return query
    insert into projects (title, description, image_url, project_url)
    values (p_title, p_description, p_image_url, p_project_url)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_project_get(p_id uuid) returns setof projects as $$
begin
    return query select * from projects where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

create or replace function fn_project_list() returns setof projects as $$
begin
    return query select * from projects where deleted_at is null order by created_at desc;
end;
$$ language plpgsql;

create or replace function fn_project_update(
    p_id uuid,
    p_title text,
    p_description text,
    p_image_url text,
    p_project_url text
) returns setof projects as $$
begin
    update projects
    set title = p_title,
        description = p_description,
        image_url = p_image_url,
        project_url = p_project_url,
        updated_at = now()
    where id = p_id and deleted_at is null
    returning *;
end;
$$ language plpgsql;

create or replace function fn_project_delete(p_id uuid) returns void as $$
begin
    update projects set deleted_at = now() where id = p_id;
end;
$$ language plpgsql;

-- ============================================================================
-- Contact Messages CRUD
-- ============================================================================

create or replace function fn_contact_message_create(
    p_full_name text,
    p_email text,
    p_subject text,
    p_message text
) returns setof contact_messages as $$
begin
    if p_full_name is null or p_email is null or p_message is null then
        raise exception 'REQUIRED_FIELDS_MISSING' using errcode = 'P0001';
    end if;

    return query
    insert into contact_messages (full_name, email, subject, message)
    values (p_full_name, p_email, p_subject, p_message)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_contact_message_get(p_id uuid) returns setof contact_messages as $$
begin
    return query select * from contact_messages where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

create or replace function fn_contact_message_list(p_status text default null) returns setof contact_messages as $$
begin
    if p_status is not null then
        return query select * from contact_messages where status = p_status and deleted_at is null order by created_at desc;
    else
        return query select * from contact_messages where deleted_at is null order by created_at desc;
    end if;
end;
$$ language plpgsql;

create or replace function fn_contact_message_update_status(
    p_id uuid,
    p_status text
) returns setof contact_messages as $$
begin
    if p_status not in ('new', 'read', 'archived') then
        raise exception 'INVALID_STATUS' using errcode = 'P0001';
    end if;

    update contact_messages
    set status = p_status,
        updated_at = now()
    where id = p_id and deleted_at is null
    returning *;
end;
$$ language plpgsql;

create or replace function fn_contact_message_delete(p_id uuid) returns void as $$
begin
    update contact_messages set deleted_at = now() where id = p_id;
end;
$$ language plpgsql;
