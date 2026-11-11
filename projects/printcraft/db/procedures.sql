-- CRUD procedures for PrintCraft

-- PRODUCTS
create or replace function fn_product_create(p_name text, p_base_price numeric(18,2), p_category text, p_options jsonb, p_created_by uuid)
returns setof products as $$
begin
    if p_name is null or p_base_price < 0 then
        raise exception 'INVALID_PRODUCT_INPUT' using errcode = 'P0001';
    end if;
    return query insert into products (name, base_price, category, options, created_by)
    values (p_name, p_base_price, p_category, p_options, p_created_by)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_product_get(p_id uuid) returns setof products as $$
begin
    return query select * from products where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

create or replace function fn_product_list(p_limit int default 20, p_offset int default 0) returns setof products as $$
begin
    return query select * from products where deleted_at is null order by created_at desc limit p_limit offset p_offset;
end;
$$ language plpgsql;

create or replace function fn_product_update(p_id uuid, p_name text, p_base_price numeric(18,2), p_is_active boolean, p_updated_by uuid)
returns setof products as $$
begin
    return query update products set name = p_name, base_price = p_base_price, is_active = p_is_active, updated_at = now(), updated_by = p_updated_by
    where id = p_id and deleted_at is null returning *;
end;
$$ language plpgsql;

create or replace function fn_product_delete(p_id uuid, p_deleted_by uuid) returns void as $$
begin
    update products set deleted_at = now(), updated_by = p_deleted_by where id = p_id;
end;
$$ language plpgsql;

-- ORDERS
create or replace function fn_order_create(p_customer_id uuid, p_total_amount numeric(18,2), p_gst_amount numeric(18,2), p_shipping_address jsonb, p_created_by uuid)
returns setof orders as $$
begin
    return query insert into orders (customer_id, total_amount, gst_amount, status, shipping_address, created_by)
    values (p_customer_id, p_total_amount, p_gst_amount, 'Pending', p_shipping_address, p_created_by)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_order_get(p_id uuid) returns setof orders as $$
begin
    return query select * from orders where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

create or replace procedure sp_order_update_status(p_id uuid, p_status text, p_updated_by uuid) as $$
begin
    if p_status not in ('Pending', 'Processing', 'Printed', 'Shipped', 'Delivered', 'Cancelled') then
        raise exception 'INVALID_ORDER_STATUS' using errcode = 'P0002';
    end if;
    update orders set status = p_status, updated_at = now(), updated_by = p_updated_by where id = p_id and deleted_at is null;
    if not found then raise exception 'ORDER_NOT_FOUND' using errcode = 'P0003'; end if;
end;
$$ language plpgsql;

-- ORDER ITEMS
create or replace function fn_order_item_create(p_order_id uuid, p_product_id uuid, p_quantity int, p_unit_price numeric(18,2), p_file_url text, p_created_by uuid)
returns setof order_items as $$
begin
    return query insert into order_items (order_id, product_id, quantity, unit_price, file_url, created_by)
    values (p_order_id, p_product_id, p_quantity, p_unit_price, p_file_url, p_created_by)
    returning *;
end;
$$ language plpgsql;
