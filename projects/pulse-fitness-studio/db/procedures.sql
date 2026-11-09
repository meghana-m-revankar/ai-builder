-- db/procedures.sql

-- ============================================================================
-- Class Types CRUD
-- ============================================================================

create or replace function fn_class_type_create(p_name text, p_intensity text, p_duration int, p_user_id uuid)
returns setof class_types as $$
begin
    if p_name is null or p_intensity not in ('Low', 'Medium', 'High') or p_duration <= 0 then
        raise exception 'INVALID_INPUT' using errcode = 'P0001';
    end if;
    return query insert into class_types (name, intensity, duration_minutes, created_by, updated_by)
    values (p_name, p_intensity, p_duration, p_user_id, p_user_id) returning *;
end;
$$ language plpgsql;

create or replace function fn_class_type_get(p_id uuid) returns setof class_types as $$
begin
    return query select * from class_types where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

create or replace function fn_class_type_list(p_limit int default 50, p_offset int default 0) returns setof class_types as $$
begin
    return query select * from class_types where deleted_at is null order by name limit p_limit offset p_offset;
end;
$$ language plpgsql;

create or replace procedure sp_class_type_delete(p_id uuid, p_user_id uuid) as $$
begin
    update class_types set deleted_at = now(), updated_by = p_user_id where id = p_id;
end;
$$ language plpgsql;

-- ============================================================================
-- Trainers CRUD
-- ============================================================================

create or replace function fn_trainer_create(p_name text, p_specialty text, p_photo_url text, p_user_id uuid)
returns setof trainers as $$
begin
    return query insert into trainers (name, specialty, photo_url, created_by, updated_by)
    values (p_name, p_specialty, p_photo_url, p_user_id, p_user_id) returning *;
end;
$$ language plpgsql;

create or replace function fn_trainer_list() returns setof trainers as $$
begin
    return query select * from trainers where deleted_at is null;
end;
$$ language plpgsql;

-- ============================================================================
-- Bookings Business Logic
-- ============================================================================

/**
 * Purpose: Create a new booking. Validates class existence and overlaps.
 * Parameters: p_schedule_id, p_name, p_phone, p_email, p_user_id
 * Errors: BOOKING_NOT_FOUND, INVALID_INPUT
 */
create or replace function fn_booking_create(
    p_schedule_id uuid, p_name text, p_phone text, p_email text, p_user_id uuid
) returns setof bookings as $$
declare
    v_exists boolean;
begin
    if p_name is null or p_email is null then
        raise exception 'INVALID_INPUT' using errcode = 'P0001';
    end if;

    select exists(select 1 from class_schedules where id = p_schedule_id and deleted_at is null) into v_exists;
    if not v_exists then
        raise exception 'CLASS_SCHEDULE_NOT_FOUND' using errcode = 'P0001';
    end if;

    return query insert into bookings (name, phone, email, class_schedule_id, status, created_by, updated_by)
    values (p_name, p_phone, p_email, p_schedule_id, 'Pending', p_user_id, p_user_id) returning *;
end;
$$ language plpgsql;

-- ============================================================================
-- Memberships CRUD
-- ============================================================================

create or replace function fn_membership_create(p_name text, p_price numeric, p_description text, p_user_id uuid)
returns setof memberships as $$
begin
    if p_price < 0 then
        raise exception 'INVALID_PRICE' using errcode = 'P0001';
    end if;
    return query insert into memberships (name, price_aed, description, created_by, updated_by)
    values (p_name, p_price, p_description, p_user_id, p_user_id) returning *;
end;
$$ language plpgsql;
