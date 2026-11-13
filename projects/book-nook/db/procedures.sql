-- db/procedures.sql

-- Helper to handle common logic
-- Note: CRUD procedures follow the requirement to return the row/set.
-- Soft delete logic: updates deleted_at field.

-- Tenants
create or replace function fn_tenant_create(p_name text, p_code text)
returns setof tenants as $$
begin
    if exists (select 1 from tenants where code = p_code) then
        raise exception 'TENANT_CODE_EXISTS' using errcode = 'P0001';
    end if;
    return query insert into tenants (name, code) values (p_name, p_code) returning *;
end;
$$ language plpgsql;

create or replace function fn_tenant_get(p_id uuid)
returns setof tenants as $$
begin
    return query select * from tenants where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

create or replace function sp_tenant_delete(p_id uuid, p_user_id uuid)
returns void as $$
begin
    update tenants set deleted_at = now(), updated_by = p_user_id where id = p_id;
end;
$$ language plpgsql;

-- Products
create or replace function fn_product_create(
    p_tenant_id uuid, p_category_id uuid, p_name text, p_sku text, 
    p_price numeric, p_stock_quantity int, p_image_url text, p_icon text
) returns setof products as $$
begin
    return query insert into products (tenant_id, category_id, name, sku, price, stock_quantity, image_url, icon)
    values (p_tenant_id, p_category_id, p_name, p_sku, p_price, p_stock_quantity, p_image_url, p_icon)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_product_list(p_tenant_id uuid, p_limit int, p_offset int)
returns setof products as $$
begin
    return query select * from products where tenant_id = p_tenant_id and deleted_at is null 
    order by created_at desc limit p_limit offset p_offset;
end;
$$ language plpgsql;

-- Orders
create or replace function fn_order_create(
    p_tenant_id uuid, p_customer_id uuid, p_order_number text, 
    p_subtotal numeric, p_tax numeric, p_total_amount numeric
) returns setof orders as $$
begin
    if exists (select 1 from orders where order_number = p_order_number) then
        raise exception 'ORDER_NUMBER_EXISTS' using errcode = 'P0001';
    end if;
    return query insert into orders (tenant_id, customer_id, order_number, status, subtotal, tax, total_amount)
    values (p_tenant_id, p_customer_id, p_order_number, 'Pending', p_subtotal, p_tax, p_total_amount)
    returning *;
end;
$$ language plpgsql;

-- Order Items
create or replace function fn_order_item_create(
    p_order_id uuid, p_product_id uuid, p_quantity int, p_unit_price numeric
) returns setof order_items as $$
declare
    v_total numeric;
begin
    v_total := p_quantity * p_unit_price;
    return query insert into order_items (order_id, product_id, quantity, unit_price, total_price)
    values (p_order_id, p_product_id, p_quantity, p_unit_price, v_total)
    returning *;
end;
$$ language plpgsql;

-- Customers
create or replace function fn_customer_create(
    p_tenant_id uuid, p_full_name text, p_email text, p_phone text, p_address text, p_city text
) returns setof customers as $$
begin
    return query insert into customers (tenant_id, full_name, email, phone, address, city)
    values (p_tenant_id, p_full_name, p_email, p_phone, p_address, p_city)
    returning *;
end;
$$ language plpgsql;

-- Generic soft delete
create or replace function sp_soft_delete(p_table_name text, p_id uuid, p_user_id uuid)
returns void as $$
begin
    execute format('update %I set deleted_at = now(), updated_by = %L where id = %L', p_table_name, p_user_id, p_id);
end;
$$ language plpgsql;
