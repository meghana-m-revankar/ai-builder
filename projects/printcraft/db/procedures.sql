-- Procedures for PrintCraft E-commerce Platform

-- Products Procedures

create or replace function fn_product_create(
    p_name text, p_category text, p_base_price numeric, p_currency char, p_description text, p_stock int, p_image_url text, p_user_id uuid
) returns setof products as $$
begin
    if p_base_price < 0 then raise exception 'INVALID_PRICE' using errcode = 'P0001'; end if;
    return query insert into products (name, category, base_price, currency, description, stock, image_url, created_by, updated_by)
    values (p_name, p_category, p_base_price, p_currency, p_description, p_stock, p_image_url, p_user_id, p_user_id)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_product_get(p_id uuid) returns setof products as $$
begin
    return query select * from products where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

create or replace function fn_product_list(p_limit int, p_offset int) returns setof products as $$
begin
    return query select * from products where deleted_at is null order by created_at desc limit p_limit offset p_offset;
end;
$$ language plpgsql;

create or replace function fn_product_update(
    p_id uuid, p_name text, p_base_price numeric, p_stock int, p_user_id uuid
) returns setof products as $$
begin
    if not exists (select 1 from products where id = p_id and deleted_at is null) then raise exception 'PRODUCT_NOT_FOUND' using errcode = 'P0002'; end if;
    return query update products set name = p_name, base_price = p_base_price, stock = p_stock, updated_at = now(), updated_by = p_user_id
    where id = p_id returning *;
end;
$$ language plpgsql;

create or replace procedure sp_product_delete(p_id uuid, p_user_id uuid) as $$
begin
    update products set deleted_at = now(), updated_by = p_user_id where id = p_id;
end;
$$ language plpgsql;

-- Orders Procedures

create or replace function fn_order_create(
    p_customer_id uuid, p_customer_details jsonb, p_total_amount numeric, p_currency char, p_user_id uuid
) returns setof orders as $$
begin
    return query insert into orders (customer_id, customer_details, total_amount, currency, status, created_by, updated_by)
    values (p_customer_id, p_customer_details, p_total_amount, p_currency, 'pending', p_user_id, p_user_id)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_order_get(p_id uuid) returns setof orders as $$
begin
    return query select * from orders where id = p_id;
end;
$$ language plpgsql;

create or replace function fn_order_update_status(p_id uuid, p_status text, p_user_id uuid) returns setof orders as $$
begin
    if p_status not in ('pending', 'processing', 'completed', 'cancelled') then raise exception 'INVALID_STATUS' using errcode = 'P0003'; end if;
    return query update orders set status = p_status, updated_at = now(), updated_by = p_user_id where id = p_id returning *;
end;
$$ language plpgsql;

-- Order Items Procedures

create or replace function fn_order_item_create(
    p_order_id uuid, p_product_id uuid, p_quantity int, p_unit_price numeric, p_currency char, p_customization jsonb
) returns setof order_items as $$
begin
    if p_quantity <= 0 then raise exception 'INVALID_QUANTITY' using errcode = 'P0004'; end if;
    return query insert into order_items (order_id, product_id, quantity, unit_price, currency, customization_json)
    values (p_order_id, p_product_id, p_quantity, p_unit_price, p_currency, p_customization)
    returning *;
end;
$$ language plpgsql;
