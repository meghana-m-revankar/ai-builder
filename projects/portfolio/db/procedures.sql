-- Procedures for Projects table

create or replace function fn_project_create(
    p_title text,
    p_description text,
    p_technologies text[],
    p_project_url text default null,
    p_image_url text default null
) returns setof projects as $$
begin
    return query
    insert into projects (title, description, technologies, project_url, image_url)
    values (p_title, p_description, p_technologies, p_project_url, p_image_url)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_project_get(p_id uuid) returns setof projects as $$
begin
    return query select * from projects where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

create or replace function fn_project_list(p_limit int default 10, p_offset int default 0) returns setof projects as $$
begin
    return query select * from projects where deleted_at is null order by created_at desc limit p_limit offset p_offset;
end;
$$ language plpgsql;

create or replace function fn_project_update(
    p_id uuid,
    p_title text,
    p_description text,
    p_technologies text[],
    p_project_url text default null,
    p_image_url text default null
) returns setof projects as $$
begin
    update projects
    set title = p_title, description = p_description, technologies = p_technologies,
        project_url = p_project_url, image_url = p_image_url,
        updated_at = now()
    where id = p_id and deleted_at is null;
    
    if not found then raise exception 'PROJECT_NOT_FOUND' using errcode = 'P0001'; end if;
    return query select * from projects where id = p_id;
end;
$$ language plpgsql;

create or replace function fn_project_delete(p_id uuid) returns void as $$
begin
    update projects set deleted_at = now() where id = p_id and deleted_at is null;
    if not found then raise exception 'PROJECT_NOT_FOUND' using errcode = 'P0001'; end if;
end;
$$ language plpgsql;

-- Procedures for Skills table

create or replace function fn_skill_create(p_name text, p_category text, p_proficiency_level int) returns setof skills as $$
begin
    if p_proficiency_level < 1 or p_proficiency_level > 5 then raise exception 'INVALID_PROFICIENCY' using errcode = 'P0002'; end if;
    return query insert into skills (name, category, proficiency_level) values (p_name, p_category, p_proficiency_level) returning *;
end;
$$ language plpgsql;

create or replace function fn_skill_list() returns setof skills as $$
begin
    return query select * from skills order by category, proficiency_level desc;
end;
$$ language plpgsql;

-- Procedures for Contact Inquiries

create or replace function fn_contact_inquiry_create(p_name text, p_email text, p_message text) returns setof contact_inquiries as $$
begin
    return query insert into contact_inquiries (full_name, email, message) values (p_name, p_email, p_message) returning *;
end;
$$ language plpgsql;

create or replace function fn_contact_inquiry_update_status(p_id uuid, p_status text) returns setof contact_inquiries as $$
begin
    if p_status not in ('new', 'read', 'archived') then raise exception 'INVALID_STATUS' using errcode = 'P0003'; end if;
    update contact_inquiries set status = p_status, updated_at = now() where id = p_id;
    return query select * from contact_inquiries where id = p_id;
end;
$$ language plpgsql;
