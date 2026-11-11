-- CRUD and Business Procedures for Meghana Portfolio

-- PROJECTS CRUD
create or replace function fn_project_create(
    p_title text, p_description text, p_tech_stack text[], p_project_url text, p_image_url text, p_display_order int
) returns setof projects as $$
begin
    if p_title is null or p_description is null then
        raise exception 'TITLE_AND_DESCRIPTION_REQUIRED' using errcode = 'P0001';
    end if;
    return query
    insert into projects (title, description, tech_stack, project_url, image_url, display_order)
    values (p_title, p_description, p_tech_stack, p_project_url, p_image_url, p_display_order)
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
    return query select * from projects where deleted_at is null order by display_order asc, created_at desc;
end;
$$ language plpgsql;

create or replace function fn_project_update(
    p_id uuid, p_title text, p_description text, p_tech_stack text[], p_project_url text, p_image_url text, p_display_order int
) returns setof projects as $$
begin
    update projects set
        title = coalesce(p_title, title),
        description = coalesce(p_description, description),
        tech_stack = coalesce(p_tech_stack, tech_stack),
        project_url = coalesce(p_project_url, project_url),
        image_url = coalesce(p_image_url, image_url),
        display_order = coalesce(p_display_order, display_order),
        updated_at = now()
    where id = p_id and deleted_at is null
    returning *;
end;
$$ language plpgsql;

create or replace procedure sp_project_delete(p_id uuid) as $$
begin
    update projects set deleted_at = now() where id = p_id;
    if not found then
        raise exception 'PROJECT_NOT_FOUND' using errcode = 'P0002';
    end if;
end;
$$ language plpgsql;

-- SKILLS CRUD
create or replace function fn_skill_create(
    p_name text, p_category text, p_proficiency_level int
) returns setof skills as $$
begin
    return query
    insert into skills (name, category, proficiency_level)
    values (p_name, p_category, p_proficiency_level)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_skill_list() returns setof skills as $$
begin
    return query select * from skills order by category, proficiency_level desc;
end;
$$ language plpgsql;

-- CONTACT MESSAGES CRUD
create or replace function fn_contact_message_create(
    p_full_name text, p_email text, p_subject text, p_message text
) returns setof contact_messages as $$
begin
    return query
    insert into contact_messages (full_name, email, subject, message)
    values (p_full_name, p_email, p_subject, p_message)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_contact_message_update_status(
    p_id uuid, p_status text
) returns setof contact_messages as $$
begin
    if p_status not in ('new', 'read', 'archived') then
        raise exception 'INVALID_STATUS' using errcode = 'P0003';
    end if;
    update contact_messages set status = p_status, updated_at = now()
    where id = p_id
    returning *;
end;
$$ language plpgsql;
