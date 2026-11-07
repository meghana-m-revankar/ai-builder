-- db/procedures.sql
-- Fleet Tracker Database Procedures
-- Version: 1.0.0

-- -------------------------------------------------------------
-- VAN PROCEDURES
-- -------------------------------------------------------------

create or replace procedure sp_van_create(
    p_plate_number text,
    p_model text,
    p_status text,
    inout p_id uuid default null
) language plpgsql as $$
begin
    if exists (select 1 from vans where plate_number = p_plate_number) then
        raise exception 'PLATE_NUMBER_EXISTS' using errcode = 'P0001';
    end if;

    insert into vans (plate_number, model, status)
    values (p_plate_number, p_model, p_status)
    returning id into p_id;
end;
$$;

create or replace function fn_van_get_by_id(p_id uuid)
returns setof vans language sql stable as $$
    select * from vans where id = p_id;
$$;

create or replace function fn_van_list(p_status text default null, p_limit int default 20, p_offset int default 0)
returns setof vans language sql stable as $$
    select * from vans
    where (p_status is null or status = p_status)
    order by created_at desc
    limit p_limit offset p_offset;
$$;

create or replace procedure sp_van_update(
    p_id uuid,
    p_plate_number text,
    p_model text,
    p_status text
) language plpgsql as $$
begin
    update vans set
        plate_number = p_plate_number,
        model = p_model,
        status = p_status,
        updated_at = now()
    where id = p_id;
    
    if not found then raise exception 'VAN_NOT_FOUND' using errcode = 'P0002'; end if;
end;
$$;

-- -------------------------------------------------------------
-- MAINTENANCE LOG PROCEDURES
-- -------------------------------------------------------------

create or replace procedure sp_maintenance_log_create(
    p_van_id uuid,
    p_description text,
    p_cost numeric,
    inout p_id uuid default null
) language plpgsql as $$
begin
    insert into maintenance_logs (van_id, description, cost)
    values (p_van_id, p_description, p_cost)
    returning id into p_id;

    -- Update the last_maintenance_date on the van
    update vans set last_maintenance_date = now() where id = p_van_id;
end;
$$;

create or replace function fn_maintenance_log_list(p_van_id uuid, p_limit int default 20, p_offset int default 0)
returns setof maintenance_logs language sql stable as $$
    select * from maintenance_logs
    where van_id = p_van_id
    order by log_date desc
    limit p_limit offset p_offset;
$$;

create or replace procedure sp_maintenance_log_delete(p_id uuid)
language plpgsql as $$
begin
    delete from maintenance_logs where id = p_id;
    if not found then raise exception 'LOG_NOT_FOUND' using errcode = 'P0002'; end if;
end;
$$;

-- -------------------------------------------------------------
-- DRIVER PROCEDURES
-- -------------------------------------------------------------

create or replace procedure sp_driver_create(
    p_name text,
    p_license_number text,
    p_license_expiry_date date,
    inout p_id uuid default null
) language plpgsql as $$
begin
    insert into drivers (name, license_number, license_expiry_date)
    values (p_name, p_license_number, p_license_expiry_date)
    returning id into p_id;
end;
$$;

-- -------------------------------------------------------------
-- REPORTING PROCEDURES
-- -------------------------------------------------------------

create or replace function fn_report_fuel_monthly()
returns table (year int, month int, total_fuel_cost numeric) 
language sql stable as $$
    select 
        extract(year from created_at)::int,
        extract(month from created_at)::int,
        sum(fuel_cost)
    from deliveries
    where status = 'Completed'
    group by 1, 2
    order by 1 desc, 2 desc;
$$;
