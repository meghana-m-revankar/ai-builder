-- Procedures for Golden Crust Bakery
-- All operations run in transactions and include basic parameter validation.

-- 1. Product CRUD
create or replace function fn_product_create(
    p_name_en text, p_name_ar text, p_description text, p_price numeric(18,2), 
    p_is_daily_special boolean, p_is_bestseller boolean, p_user_id uuid
) returns setof products language plpgsql as $$
begin
    if p_price < 0 then raise exception 'INVALID_PRICE' using errcode = 'P0001'; end if;
    return query insert into products (name_en, name_ar, description, price, is_daily_special, is_bestseller, created_by, updated_by)
    values (p_name_en, p_name_ar, p_description, p_price, p_is_daily_special, p_is_bestseller, p_user_id, p_user_id)
    returning *;
end;
$$;

create or replace function fn_product_get(p_id uuid) returns setof products language plpgsql as $$
begin
    return query select * from products where id = p_id and deleted_at is null;
end;
$$;

create or replace function fn_product_list(p_limit int default 20, p_offset int default 0) returns setof products language plpgsql as $$
begin
    return query select * from products where deleted_at is null order by created_at desc limit p_limit offset p_offset;
end;
$$;

create or replace function fn_product_update(
    p_id uuid, p_name_en text, p_price numeric(18,2), p_user_id uuid
) returns setof products language plpgsql as $$
begin
    if not exists (select 1 from products where id = p_id) then raise exception 'PRODUCT_NOT_FOUND' using errcode = 'P0002'; end if;
    return query update products set name_en = p_name_en, price = p_price, updated_at = now(), updated_by = p_user_id
    where id = p_id returning *;
end;
$$;

create or replace function fn_product_delete(p_id uuid, p_user_id uuid) returns void language plpgsql as $$
begin
    update products set deleted_at = now(), updated_by = p_user_id where id = p_id;
end;
$$;

-- 2. PreOrder CRUD
create or replace function fn_pre_order_create(
    p_product_id uuid, p_customer_name text, p_phone text, p_quantity int, p_pickup_date timestamptz, p_user_id uuid
) returns setof pre_orders language plpgsql as $$
begin
    if p_quantity <= 0 then raise exception 'INVALID_QUANTITY' using errcode = 'P0001'; end if;
    if p_pickup_date < now() then raise exception 'INVALID_DATE' using errcode = 'P0001'; end if;
    return query insert into pre_orders (product_id, customer_name, phone, quantity, pickup_date, created_by, updated_by)
    values (p_product_id, p_customer_name, p_phone, p_quantity, p_pickup_date, p_user_id, p_user_id)
    returning *;
end;
$$;

create or replace function fn_pre_order_list(p_limit int default 20, p_offset int default 0) returns setof pre_orders language plpgsql as $$
begin
    return query select * from pre_orders where deleted_at is null order by created_at desc limit p_limit offset p_offset;
end;
$$;

create or replace function fn_pre_order_update_status(
    p_id uuid, p_status text, p_user_id uuid
) returns setof pre_orders language plpgsql as $$
begin
    if p_status not in ('pending', 'confirmed', 'cancelled', 'completed') then 
        raise exception 'INVALID_STATUS' using errcode = 'P0001'; 
    end if;
    return query update pre_orders set status = p_status, updated_at = now(), updated_by = p_user_id
    where id = p_id returning *;
end;
$$;

-- 3. Audit Log
create or replace procedure sp_audit_log_insert(
    p_entity_name text, p_entity_id uuid, p_action text, p_user_id uuid
) language plpgsql as $$
begin
    insert into audit_logs (entity_name, entity_id, action, changed_by)
    values (p_entity_name, p_entity_id, p_action, p_user_id);
end;
$$;
