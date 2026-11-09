-- Procedures for QuickFix Home Services

-- CRUD: Technicians
create or replace function fn_technician_create(p_name text, p_specialty text, p_phone text)
returns setof technicians as $$
begin
    return query insert into technicians (name, specialty, phone)
    values (p_name, p_specialty, p_phone)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_technician_get(p_id uuid)
returns setof technicians as $$
begin
    return query select * from technicians where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

create or replace function fn_technician_list()
returns setof technicians as $$
begin
    return query select * from technicians where deleted_at is null;
end;
$$ language plpgsql;

create or replace function fn_technician_update(p_id uuid, p_name text, p_specialty text, p_phone text, p_is_available boolean)
returns setof technicians as $$
begin
    return query update technicians
    set name = p_name, specialty = p_specialty, phone = p_phone, is_available = p_is_available, updated_at = now()
    where id = p_id and deleted_at is null
    returning *;
end;
$$ language plpgsql;

create or replace function fn_technician_delete(p_id uuid)
returns void as $$
begin
    update technicians set deleted_at = now() where id = p_id;
end;
$$ language plpgsql;

-- CRUD: Bookings
create or replace function fn_booking_create(p_customer_id uuid, p_service_type text, p_address text, p_scheduled_at timestamptz, p_total_price numeric)
returns setof bookings as $$
begin
    return query insert into bookings (customer_id, service_type, address, scheduled_at, status, total_price)
    values (p_customer_id, p_service_type, p_address, p_scheduled_at, 'pending', p_total_price)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_booking_get(p_id uuid)
returns setof bookings as $$
begin
    return query select * from bookings where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

create or replace function fn_booking_list()
returns setof bookings as $$
begin
    return query select * from bookings where deleted_at is null;
end;
$$ language plpgsql;

-- Business Procedures
create or replace function sp_booking_assign_technician(p_booking_id uuid, p_technician_id uuid)
returns setof bookings as $$
begin
    if not exists (select 1 from technicians where id = p_technician_id and is_available = true) then
        raise exception 'TECHNICIAN_UNAVAILABLE' using errcode = 'P0001';
    end if;

    return query update bookings
    set technician_id = p_technician_id, status = 'assigned', updated_at = now()
    where id = p_booking_id and deleted_at is null
    returning *;
end;
$$ language plpgsql;

create or replace function sp_booking_update_status(p_booking_id uuid, p_status text)
returns setof bookings as $$
begin
    if p_status not in ('pending', 'assigned', 'in_progress', 'completed', 'cancelled') then
        raise exception 'INVALID_STATUS' using errcode = 'P0002';
    end if;

    return query update bookings
    set status = p_status, updated_at = now()
    where id = p_booking_id and deleted_at is null
    returning *;
end;
$$ language plpgsql;

-- CRUD: Payments
create or replace function fn_payment_create(p_booking_id uuid, p_amount numeric, p_payment_method text)
returns setof payments as $$
begin
    return query insert into payments (booking_id, amount, status, payment_method)
    values (p_booking_id, p_amount, 'pending', p_payment_method)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_payment_get(p_id uuid)
returns setof payments as $$
begin
    return query select * from payments where id = p_id;
end;
$$ language plpgsql;
