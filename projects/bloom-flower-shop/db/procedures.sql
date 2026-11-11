-- Procedures for Bloom Flower Shop
-- PostgreSQL 16+

-- =============================================
-- Bouquets
-- =============================================

-- Create or update bouquet
create or replace function fn_bouquet_upsert(
    p_id uuid,
    p_name text,
    p_description text,
    p_price numeric(18, 2),
    p_image_url text,
    p_is_active boolean,
    p_user_id uuid
) returns setof bouquets as $$
begin
    if p_id is null then
        return query
        insert into bouquets (name, description, price, image_url, is_active, created_by)
        values (p_name, p_description, p_price, p_image_url, p_is_active, p_user_id)
        returning *;
    else
        return query
        update bouquets
        set name = p_name,
            description = p_description,
            price = p_price,
            image_url = p_image_url,
            is_active = p_is_active,
            updated_at = now(),
            updated_by = p_user_id
        where id = p_id
        returning *;
    end if;
end;
$$ language plpgsql;

-- Get bouquet by ID
create or replace function fn_bouquet_get(p_id uuid) returns setof bouquets as $$
begin
    return query select * from bouquets where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

-- List bouquets
create or replace function fn_bouquet_list(p_limit int, p_offset int) returns setof bouquets as $$
begin
    return query select * from bouquets where deleted_at is null order by created_at desc limit p_limit offset p_offset;
end;
$$ language plpgsql;

-- Soft delete bouquet
create or replace procedure sp_bouquet_delete(p_id uuid, p_user_id uuid) as $$
begin
    update bouquets set deleted_at = now(), updated_by = p_user_id where id = p_id;
    if not found then raise exception 'BOUQUET_NOT_FOUND' using errcode = 'P0002'; end if;
end;
$$ language plpgsql;

-- =============================================
-- Orders
-- =============================================

-- Create order
create or replace function fn_order_create(
    p_customer_name text,
    p_customer_phone text,
    p_delivery_date timestamptz,
    p_gift_message text,
    p_user_id uuid
) returns setof orders as $$
begin
    -- Basic validation
    if p_delivery_date < now() then
        raise exception 'INVALID_DELIVERY_DATE' using errcode = 'P0001';
    end if;

    return query
    insert into orders (customer_name, customer_phone, delivery_date, gift_message, status, created_by)
    values (p_customer_name, p_customer_phone, p_delivery_date, p_gift_message, 'New', p_user_id)
    returning *;
end;
$$ language plpgsql;

-- Update order status
create or replace function fn_order_update_status(
    p_id uuid,
    p_status text,
    p_user_id uuid
) returns setof orders as $$
begin
    if p_status not in ('New', 'Confirmed', 'Delivered', 'Cancelled') then
        raise exception 'INVALID_STATUS' using errcode = 'P0001';
    end if;

    return query
    update orders
    set status = p_status,
        updated_at = now(),
        updated_by = p_user_id
    where id = p_id and deleted_at is null
    returning *;

    if not found then raise exception 'ORDER_NOT_FOUND' using errcode = 'P0002'; end if;
end;
$$ language plpgsql;

-- List orders
create or replace function fn_order_list(p_limit int, p_offset int) returns setof orders as $$
begin
    return query select * from orders where deleted_at is null order by created_at desc limit p_limit offset p_offset;
end;
$$ language plpgsql;
