-- CRUD Procedures for BrewPoint Cafe

-- Locations
create or replace function fn_location_create(p_name text, p_address text, p_opening_hours text, p_created_by uuid) returns setof locations language plpgsql as $$
begin
    if p_name is null or p_address is null then raise exception 'INVALID_INPUT' using errcode = 'P0001'; end if;
    return query insert into locations (name, address, opening_hours, created_by) values (p_name, p_address, p_opening_hours, p_created_by) returning *;
end; $$;

create or replace function fn_location_get(p_id uuid) returns setof locations language plpgsql as $$
begin return query select * from locations where id = p_id and deleted_at is null; end; $$;

create or replace function fn_location_list(p_limit int default 20, p_offset int default 0) returns setof locations language plpgsql as $$
begin return query select * from locations where deleted_at is null order by name limit p_limit offset p_offset; end; $$;

-- Products
create or replace function fn_product_create(p_name text, p_category text, p_price numeric, p_stock_quantity int, p_image_url text, p_created_by uuid) returns setof products language plpgsql as $$
begin
    return query insert into products (name, category, price, stock_quantity, image_url, created_by) values (p_name, p_category, p_price, p_stock_quantity, p_image_url, p_created_by) returning *;
end; $$;

create or replace function fn_product_update_stock(p_id uuid, p_change int) returns setof products language plpgsql as $$
begin
    update products set stock_quantity = stock_quantity + p_change, updated_at = now() where id = p_id and (stock_quantity + p_change) >= 0;
    if not found then raise exception 'INSUFFICIENT_STOCK_OR_INVALID_ID' using errcode = 'P0002'; end if;
    return query select * from products where id = p_id;
end; $$;

-- Orders
-- Transactional order creation
create or replace procedure sp_order_create(
    p_customer_id uuid, p_location_id uuid, p_payment_method text, p_items jsonb, p_created_by uuid
) language plpgsql as $$
declare
    v_order_id uuid;
    v_total numeric := 0;
    v_item record;
begin
    insert into orders (customer_id, location_id, total_amount, payment_method, status, created_by)
    values (p_customer_id, p_location_id, 0, p_payment_method, 'pending', p_created_by) returning id into v_order_id;
    
    for v_item in select * from jsonb_to_recordset(p_items) as x(product_id uuid, quantity int, unit_price numeric)
    loop
        insert into order_items (order_id, product_id, quantity, unit_price, created_by) values (v_order_id, v_item.product_id, v_item.quantity, v_item.unit_price, p_created_by);
        v_total := v_total + (v_item.quantity * v_item.unit_price);
        perform fn_product_update_stock(v_item.product_id, -v_item.quantity);
    end loop;
    
    update orders set total_amount = v_total where id = v_order_id;
end; $$;
