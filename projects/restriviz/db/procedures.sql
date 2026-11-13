-- Procedures for CRUD and Business Operations

-- Categories
create or replace function fn_categories_create(p_name text, p_user_id uuid) returns setof categories as $$
begin
    if exists (select 1 from categories where name = p_name and deleted_at is null) then
        raise exception 'CATEGORY_EXISTS' using errcode = 'P0001';
    end if;
    return query insert into categories (name, created_by, updated_by) values (p_name, p_user_id, p_user_id) returning *;
end;
$$ language plpgsql;

create or replace function fn_categories_get(p_id uuid) returns setof categories as $$
begin
    return query select * from categories where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

create or replace function fn_categories_list(p_limit int default 50, p_offset int default 0) returns setof categories as $$
begin
    return query select * from categories where deleted_at is null order by name limit p_limit offset p_offset;
end;
$$ language plpgsql;

create or replace function fn_categories_delete(p_id uuid, p_user_id uuid) returns void as $$
begin
    update categories set deleted_at = now(), updated_by = p_user_id where id = p_id;
end;
$$ language plpgsql;

-- Products
create or replace function fn_products_create(p_category_id uuid, p_name text, p_price numeric, p_is_veg boolean, p_user_id uuid) returns setof products as $$
begin
    return query insert into products (category_id, name, price, is_veg, created_by, updated_by) 
                 values (p_category_id, p_name, p_price, p_is_veg, p_user_id, p_user_id) returning *;
end;
$$ language plpgsql;

create or replace function fn_products_list(p_category_id uuid default null, p_limit int default 50, p_offset int default 0) returns setof products as $$
begin
    return query select * from products where (p_category_id is null or category_id = p_category_id) and deleted_at is null order by name limit p_limit offset p_offset;
end;
$$ language plpgsql;

-- Tables
create or replace function fn_tables_create(p_name text, p_user_id uuid) returns setof tables as $$
begin
    return query insert into tables (name, created_by, updated_by) values (p_name, p_user_id, p_user_id) returning *;
end;
$$ language plpgsql;

create or replace function fn_tables_list() returns setof tables as $$
begin
    return query select * from tables where deleted_at is null order by name;
end;
$$ language plpgsql;

-- Orders (Business Logic: Checkout)
-- Purpose: Creates an order with items in a single transaction
create or replace function fn_order_checkout(p_table_id uuid, p_type text, p_items jsonb, p_user_id uuid) returns setof orders as $$
declare
    v_order_id uuid;
    v_total numeric := 0;
    v_item record;
    v_price numeric;
begin
    -- Validate type
    if p_type not in ('dine-in', 'takeaway') then
        raise exception 'INVALID_ORDER_TYPE' using errcode = 'P0001';
    end if;

    insert into orders (table_id, type, status, payment_status, created_by, updated_by)
    values (p_table_id, p_type, 'pending', 'unpaid', p_user_id, p_user_id)
    returning id into v_order_id;

    for v_item in select * from jsonb_to_recordset(p_items) as x(product_id uuid, quantity int, notes text)
    loop
        select price into v_price from products where id = v_item.product_id;
        if not found then raise exception 'INVALID_PRODUCT' using errcode = 'P0001'; end if;
        
        insert into order_items (order_id, product_id, quantity, price_at_order, notes, created_by, updated_by)
        values (v_order_id, v_item.product_id, v_item.quantity, v_price, v_item.notes, p_user_id, p_user_id);
        
        v_total := v_total + (v_price * v_item.quantity);
    end loop;

    update orders set total_amount = v_total where id = v_order_id;
    
    if p_table_id is not null then
        update tables set is_occupied = true where id = p_table_id;
    end if;

    return query select * from orders where id = v_order_id;
end;
$$ language plpgsql;
