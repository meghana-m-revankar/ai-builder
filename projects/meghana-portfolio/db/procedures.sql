-- Procedures for Meghana Portfolio Analytics/Contact Logs

-- CONTACT_SUBMISSIONS CRUD

create or replace function fn_contact_submission_create(
    p_full_name text,
    p_email text,
    p_subject text,
    p_message text
) returns setof contact_submissions language plpgsql as $$
begin
    -- Validation
    if p_full_name is null or trim(p_full_name) = '' then raise exception 'NAME_REQUIRED' using errcode = 'P0001'; end if;
    if p_email !~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$' then raise exception 'INVALID_EMAIL' using errcode = 'P0002'; end if;

    return query
    insert into contact_submissions (full_name, email, subject, message)
    values (p_full_name, p_email, p_subject, p_message)
    returning *;
end;
$$;

create or replace function fn_contact_submission_get(p_id uuid) returns setof contact_submissions language plpgsql as $$
begin
    return query select * from contact_submissions where id = p_id and deleted_at is null;
end;
$$;

create or replace function fn_contact_submission_list(p_limit int default 20, p_offset int default 0) returns setof contact_submissions language plpgsql as $$
begin
    return query select * from contact_submissions where deleted_at is null order by created_at desc limit p_limit offset p_offset;
end;
$$;

create or replace function fn_contact_submission_update_status(p_id uuid, p_status text) returns setof contact_submissions language plpgsql as $$
begin
    if p_status not in ('new', 'read', 'replied', 'archived') then raise exception 'INVALID_STATUS' using errcode = 'P0003'; end if;
    
    return query
    update contact_submissions 
    set status = p_status, updated_at = now() 
    where id = p_id and deleted_at is null
    returning *;
end;
$$;

create or replace function fn_contact_submission_delete(p_id uuid) returns void language plpgsql as $$
begin
    update contact_submissions set deleted_at = now() where id = p_id;
end;
$$;

-- PROJECT_STATS CRUD & BUSINESS LOGIC

create or replace function fn_project_stats_create(p_project_slug text) returns setof project_stats language plpgsql as $$
begin
    return query
    insert into project_stats (project_slug) values (p_project_slug)
    on conflict (project_slug) do update set updated_at = now()
    returning *;
end;
$$;

create or replace procedure sp_project_stats_increment(p_project_slug text, p_is_click boolean) language plpgsql as $$
begin
    if not exists (select 1 from project_stats where project_slug = p_project_slug) then
        insert into project_stats (project_slug, view_count, click_count) values (p_project_slug, 1, case when p_is_click then 1 else 0 end);
    else
        update project_stats 
        set view_count = view_count + 1, 
            click_count = click_count + case when p_is_click then 1 else 0 end,
            updated_at = now()
        where project_slug = p_project_slug;
    end if;
end;
$$;

create or replace function fn_project_stats_list() returns setof project_stats language plpgsql as $$
begin
    return query select * from project_stats order by view_count desc;
end;
$$;
