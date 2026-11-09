-- Procedures for Sunrise Yoga
-- CRUD and business logic

-- INSTRUCTORS
create or replace function fn_instructors_create(p_name text, p_bio text, p_specialty text, p_created_by uuid)
returns setof instructors as $$
begin
    return query insert into instructors (name, bio, specialty, created_by)
    values (p_name, p_bio, p_specialty, p_created_by)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_instructors_get(p_id uuid)
returns setof instructors as $$
begin
    return query select * from instructors where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

create or replace function fn_instructors_list(p_limit int, p_offset int)
returns setof instructors as $$
begin
    return query select * from instructors where deleted_at is null order by name limit p_limit offset p_offset;
end;
$$ language plpgsql;

create or replace function fn_instructors_update(p_id uuid, p_name text, p_bio text, p_specialty text, p_updated_by uuid)
returns setof instructors as $$
begin
    if not exists (select 1 from instructors where id = p_id and deleted_at is null) then
        raise exception 'INSTRUCTOR_NOT_FOUND' using errcode = 'P0001';
    end if;
    return query update instructors set name = p_name, bio = p_bio, specialty = p_specialty, updated_at = now(), updated_by = p_updated_by
    where id = p_id returning *;
end;
$$ language plpgsql;

create or replace function fn_instructors_delete(p_id uuid, p_deleted_by uuid)
returns void as $$
begin
    if exists (select 1 from classes where instructor_id = p_id and deleted_at is null) then
        raise exception 'INSTRUCTOR_HAS_CLASSES' using errcode = 'P0002';
    end if;
    update instructors set deleted_at = now(), updated_by = p_deleted_by where id = p_id;
end;
$$ language plpgsql;

-- CLASSES
create or replace function fn_classes_create(p_name text, p_description text, p_level text, p_duration int, p_price numeric, p_currency char(3), p_instructor_id uuid, p_created_by uuid)
returns setof classes as $$
begin
    return query insert into classes (name, description, level, duration_minutes, base_price, currency, instructor_id, created_by)
    values (p_name, p_description, p_level, p_duration, p_price, p_currency, p_instructor_id, p_created_by)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_classes_get(p_id uuid)
returns setof classes as $$
begin
    return query select * from classes where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

create or replace function fn_classes_list(p_limit int, p_offset int)
returns setof classes as $$
begin
    return query select * from classes where deleted_at is null order by name limit p_limit offset p_offset;
end;
$$ language plpgsql;

create or replace function fn_classes_update(p_id uuid, p_name text, p_description text, p_level text, p_duration int, p_price numeric, p_updated_by uuid)
returns setof classes as $$
begin
    return query update classes set name = p_name, description = p_description, level = p_level, duration_minutes = p_duration, base_price = p_price, updated_at = now(), updated_by = p_updated_by
    where id = p_id and deleted_at is null returning *;
end;
$$ language plpgsql;

create or replace function fn_classes_delete(p_id uuid, p_deleted_by uuid)
returns void as $$
begin
    update classes set deleted_at = now(), updated_by = p_deleted_by where id = p_id;
end;
$$ language plpgsql;

-- SCHEDULES
create or replace function fn_schedules_create(p_class_id uuid, p_start timestamptz, p_end timestamptz, p_room text, p_created_by uuid)
returns setof schedules as $$
begin
    if p_end <= p_start then
        raise exception 'INVALID_TIME_RANGE' using errcode = 'P0003';
    end if;
    return query insert into schedules (class_id, start_time, end_time, room_number, created_by)
    values (p_class_id, p_start, p_end, p_room, p_created_by)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_schedules_list(p_start_date timestamptz, p_end_date timestamptz)
returns setof schedules as $$
begin
    return query select * from schedules where start_time >= p_start_date and start_time <= p_end_date order by start_time;
end;
$$ language plpgsql;

create or replace function fn_schedules_delete(p_id uuid)
returns void as $$
begin
    delete from schedules where id = p_id;
end;
$$ language plpgsql;
