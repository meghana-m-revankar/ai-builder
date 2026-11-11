-- CRUD and Business Procedures for Meghana Portfolio

-- 1. CREATE: Add a new contact submission
create or replace function fn_contacts_create(
    p_full_name text,
    p_email text,
    p_message text
) returns setof contacts as $$
begin
    -- Validation
    if p_full_name is null or trim(p_full_name) = '' then
        raise exception 'FULL_NAME_REQUIRED' using errcode = 'P0001';
    end if;
    if p_email !~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$' then
        raise exception 'INVALID_EMAIL_FORMAT' using errcode = 'P0002';
    end if;
    if p_message is null or length(trim(p_message)) < 10 then
        raise exception 'MESSAGE_TOO_SHORT' using errcode = 'P0003';
    end if;

    return query
    insert into contacts (full_name, email, message)
    values (p_full_name, p_email, p_message)
    returning *;
end;
$$ language plpgsql;

-- 2. GET BY ID: Fetch a specific contact message
create or replace function fn_contacts_get_by_id(p_id uuid)
returns setof contacts as $$
begin
    return query
    select * from contacts where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

-- 3. LIST: List submissions with basic pagination
create or replace function fn_contacts_list(
    p_limit int default 20,
    p_offset int default 0
) returns setof contacts as $$
begin
    return query
    select * from contacts
    where deleted_at is null
    order by created_at desc
    limit p_limit offset p_offset;
end;
$$ language plpgsql;

-- 4. UPDATE: Mark a message as read
create or replace function fn_contacts_mark_read(
    p_id uuid
) returns setof contacts as $$
begin
    return query
    update contacts
    set is_read = true,
        updated_at = now()
    where id = p_id and deleted_at is null
    returning *;
end;
$$ language plpgsql;

-- 5. SOFT DELETE: Remove a message
create or replace function fn_contacts_delete(p_id uuid)
returns void as $$
begin
    update contacts
    set deleted_at = now()
    where id = p_id;
    
    if not found then
        raise exception 'CONTACT_NOT_FOUND' using errcode = 'P0004';
    end if;
end;
$$ language plpgsql;
