-- db/procedures.sql

-- Projects CRUD
create or replace function fn_project_create(p_title text, p_description text, p_image_url text, p_project_url text)
returns setof projects as $$
begin
    if p_title is null or p_description is null then
        raise exception 'TITLE_AND_DESCRIPTION_REQUIRED' using errcode = 'P0001';
    end if;
    return query insert into projects (title, description, image_url, project_url)
    values (p_title, p_description, p_image_url, p_project_url)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_project_get(p_id uuid)
returns setof projects as $$
begin
    return query select * from projects where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

create or replace function fn_project_list()
returns setof projects as $$
begin
    return query select * from projects where deleted_at is null order by created_at desc;
end;
$$ language plpgsql;

create or replace function fn_project_update(p_id uuid, p_title text, p_description text, p_image_url text, p_project_url text)
returns setof projects as $$
begin
    return query update projects set title = p_title, description = p_description, image_url = p_image_url, project_url = p_project_url, updated_at = now()
    where id = p_id and deleted_at is null
    returning *;
end;
$$ language plpgsql;

create or replace function fn_project_delete(p_id uuid)
returns void as $$
begin
    update projects set deleted_at = now() where id = p_id;
end;
$$ language plpgsql;

-- Skills CRUD
create or replace function fn_skill_create(p_name text, p_category text, p_proficiency_level int)
returns setof skills as $$
begin
    if p_proficiency_level < 1 or p_proficiency_level > 5 then
        raise exception 'INVALID_PROFICIENCY_LEVEL' using errcode = 'P0002';
    end if;
    return query insert into skills (name, category, proficiency_level)
    values (p_name, p_category, p_proficiency_level)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_skill_get(p_id uuid)
returns setof skills as $$
begin
    return query select * from skills where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

create or replace function fn_skill_list()
returns setof skills as $$
begin
    return query select * from skills where deleted_at is null order by category, name;
end;
$$ language plpgsql;

create or replace function fn_skill_update(p_id uuid, p_name text, p_category text, p_proficiency_level int)
returns setof skills as $$
begin
    if p_proficiency_level < 1 or p_proficiency_level > 5 then
        raise exception 'INVALID_PROFICIENCY_LEVEL' using errcode = 'P0002';
    end if;
    return query update skills set name = p_name, category = p_category, proficiency_level = p_proficiency_level, updated_at = now()
    where id = p_id and deleted_at is null
    returning *;
end;
$$ language plpgsql;

create or replace function fn_skill_delete(p_id uuid)
returns void as $$
begin
    update skills set deleted_at = now() where id = p_id;
end;
$$ language plpgsql;

-- Contact Messages CRUD
create or replace function fn_contact_message_create(p_name text, p_email text, p_subject text, p_message text)
returns setof contact_messages as $$
begin
    if p_name is null or p_email is null or p_message is null then
        raise exception 'REQUIRED_FIELDS_MISSING' using errcode = 'P0003';
    end if;
    return query insert into contact_messages (name, email, subject, message)
    values (p_name, p_email, p_subject, p_message)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_contact_message_get(p_id uuid)
returns setof contact_messages as $$
begin
    return query select * from contact_messages where id = p_id;
end;
$$ language plpgsql;

create or replace function fn_contact_message_list()
returns setof contact_messages as $$
begin
    return query select * from contact_messages order by created_at desc;
end;
$$ language plpgsql;

create or replace function fn_contact_message_update_status(p_id uuid, p_status text)
returns setof contact_messages as $$
begin
    if p_status not in ('new', 'read', 'archived') then
        raise exception 'INVALID_STATUS' using errcode = 'P0004';
    end if;
    return query update contact_messages set status = p_status, updated_at = now()
    where id = p_id
    returning *;
end;
$$ language plpgsql;
