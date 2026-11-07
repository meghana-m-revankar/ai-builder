-- CRUD Procedures for Fleet Tracker

-- =============================================
-- Van Procedures
-- =============================================

create or replace function fn_van_create(
    p_plate text,
    p_status text,
    p_last_maintenance_date timestamptz,
    p_created_by uuid
) returns setof vans as $$
begin
    if not (p_status in ('available', 'in_maintenance', 'in_transit', 'retired')) then
        raise exception 'INVALID_STATUS' using errcode = 'P0001';
    end if;

    return query
    insert into vans (plate, status, last_maintenance_date, created_by)
    values (p_plate, p_status, p_last_maintenance_date, p_created_by)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_van_get_by_id(p_id uuid) returns setof vans as $$
begin
    return query select * from vans where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

create or replace function fn_van_list(p_limit int default 20, p_offset int default 0) returns setof vans as $$
begin
    return query select * from vans where deleted_at is null order by created_at desc limit p_limit offset p_offset;
end;
$$ language plpgsql;

create or replace function fn_van_update(
    p_id uuid,
    p_plate text,
    p_status text,
    p_last_maintenance_date timestamptz,
    p_updated_by uuid
) returns setof vans as $$
begin
    if not exists (select 1 from vans where id = p_id and deleted_at is null) then
        raise exception 'VAN_NOT_FOUND' using errcode = 'P0002';
    end if;

    return query
    update vans set
        plate = p_plate,
        status = p_status,
        last_maintenance_date = p_last_maintenance_date,
        updated_by = p_updated_by,
        updated_at = now()
    where id = p_id
    returning *;
end;
$$ language plpgsql;

create or replace function fn_van_delete(p_id uuid, p_deleted_by uuid) returns void as $$
begin
    update vans set deleted_at = now(), updated_by = p_deleted_by where id = p_id;
end;
$$ language plpgsql;

-- =============================================
-- Driver Procedures
-- =============================================

create or replace function fn_driver_create(p_name text, p_license_expiry timestamptz, p_created_by uuid) returns setof drivers as $$
begin
    return query
    insert into drivers (name, license_expiry, created_by)
    values (p_name, p_license_expiry, p_created_by)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_driver_get_by_id(p_id uuid) returns setof drivers as $$
begin
    return query select * from drivers where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

create or replace function fn_driver_list(p_limit int default 20, p_offset int default 0) returns setof drivers as $$
begin
    return query select * from drivers where deleted_at is null order by name asc limit p_limit offset p_offset;
end;
$$ language plpgsql;

create or replace function fn_driver_update(p_id uuid, p_name text, p_license_expiry timestamptz, p_updated_by uuid) returns setof drivers as $$
begin
    return query
    update drivers set name = p_name, license_expiry = p_license_expiry, updated_by = p_updated_by, updated_at = now()
    where id = p_id and deleted_at is null
    returning *;
end;
$$ language plpgsql;

create or replace function fn_driver_delete(p_id uuid, p_deleted_by uuid) returns void as $$
begin
    update drivers set deleted_at = now(), updated_by = p_deleted_by where id = p_id;
end;
$$ language plpgsql;

-- =============================================
-- Maintenance Procedures
-- =============================================

create or replace function fn_maintenance_create(
    p_van_id uuid,
    p_cost numeric(18,2),
    p_description text,
    p_created_by uuid
) returns setof maintenance as $$
begin
    if p_cost < 0 then
        raise exception 'INVALID_COST' using errcode = 'P0003';
    end if;

    return query
    insert into maintenance (van_id, cost, description, created_by)
    values (p_van_id, p_cost, p_description, p_created_by)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_maintenance_get_by_id(p_id uuid) returns setof maintenance as $$
begin
    return query select * from maintenance where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

create or replace function fn_maintenance_list_by_van(p_van_id uuid, p_limit int default 20, p_offset int default 0) returns setof maintenance as $$
begin
    return query select * from maintenance where van_id = p_van_id and deleted_at is null order by created_at desc limit p_limit offset p_offset;
end;
$$ language plpgsql;

create or replace function fn_maintenance_delete(p_id uuid, p_deleted_by uuid) returns void as $$
begin
    update maintenance set deleted_at = now(), updated_by = p_deleted_by where id = p_id;
end;
$$ language plpgsql;

-- =============================================
-- Business Procedures
-- =============================================

-- sp_maintenance_record: Atomic operation to update van status and create maintenance record
create or replace procedure sp_maintenance_record(
    p_van_id uuid,
    p_cost numeric(18,2),
    p_description text,
    p_user_id uuid
)
language plpgsql
as $$
begin
    -- Update van status to maintenance
    update vans set 
        status = 'in_maintenance', 
        last_maintenance_date = now(),
        updated_by = p_user_id,
        updated_at = now()
    where id = p_van_id;

    -- Create maintenance record
    insert into maintenance (van_id, cost, description, created_by)
    values (p_van_id, p_cost, p_description, p_user_id);
end;
$$;
