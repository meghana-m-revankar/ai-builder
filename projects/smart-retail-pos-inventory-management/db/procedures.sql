-- CRUD Procedures for Smart Retail POS

-- Categories
create or replace procedure sp_categories_create(p_name text, p_created_by uuid, inout p_id uuid) as $$
begin
    if p_name is null or p_name = '' then raise exception 'INVALID_NAME'; end if;
    insert into categories (name, created_by) values (p_name, p_created_by) returning id into p_id;
end;
$$ language plpgsql;

create or replace function fn_categories_get_by_id(p_id uuid) returns setof categories as $$
begin return query select * from categories where id = p_id; end;
$$ language plpgsql;

create or replace function fn_categories_list(p_limit int, p_offset int) returns setof categories as $$
begin return query select * from categories where deleted_at is null order by name limit p_limit offset p_offset; end;
$$ language plpgsql;

create or replace procedure sp_categories_update(p_id uuid, p_name text, p_updated_by uuid) as $$
begin
    update categories set name = p_name, updated_at = now(), updated_by = p_updated_by where id = p_id;
end;
$$ language plpgsql;

create or replace procedure sp_categories_delete(p_id uuid, p_deleted_by uuid) as $$
begin
    update categories set deleted_at = now(), updated_by = p_deleted_by where id = p_id;
end;
$$ language plpgsql;

-- Products
create or replace procedure sp_products_create(p_category_id uuid, p_sku text, p_name text, p_price numeric, p_stock int, p_created_by uuid, inout p_id uuid) as $$
begin
    insert into products (category_id, sku, name, price, stock_quantity, created_by) 
    values (p_category_id, p_sku, p_name, p_price, p_stock, p_created_by) returning id into p_id;
end;
$$ language plpgsql;

create or replace function fn_products_list(p_category_id uuid, p_limit int, p_offset int) returns setof products as $$
begin return query select * from products where (p_category_id is null or category_id = p_category_id) and deleted_at is null order by name limit p_limit offset p_offset; end;
$$ language plpgsql;

-- Orders
-- Business logic: Atomic order creation with inventory decrement
create or replace procedure sp_orders_create_transactional(
    p_order_number text, p_total numeric, p_tax numeric, p_discount numeric, p_payment_method text, p_items jsonb, p_created_by uuid, inout p_order_id uuid
) as $$
declare
    v_item jsonb;
    v_product_id uuid;
    v_qty int;
    v_price numeric;
begin
    -- 1. Create Order
    insert into orders (order_number, total_amount, tax, discount, payment_method, created_by)
    values (p_order_number, p_total, p_tax, p_discount, p_payment_method, p_created_by)
    returning id into p_order_id;
    
    -- 2. Process Items and update inventory
    for v_item in select * from jsonb_array_elements(p_items)
    loop
        v_product_id := (v_item->>'product_id')::uuid;
        v_qty := (v_item->>'quantity')::int;
        v_price := (v_item->>'price')::numeric;
        
        -- Check and decrement stock
        update products set stock_quantity = stock_quantity - v_qty where id = v_product_id and stock_quantity >= v_qty;
        if not found then raise exception 'INSUFFICIENT_STOCK' using errcode = 'P0001'; end if;
        
        insert into order_items (order_id, product_id, quantity, price_at_purchase)
        values (p_order_id, v_product_id, v_qty, v_price);
    end loop;
end;
$$ language plpgsql;
