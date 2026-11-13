-- CRUD Procedures for Restriviz

-- Categories
create or replace function fn_category_create(p_name text, p_user_id uuid) returns setof categories language plpgsql as $$
begin
    if p_name is null or trim(p_name) = '' then raise exception 'INVALID_NAME' using errcode = 'P0001'; end if;
    return query insert into categories (name, created_by, updated_by) values (p_name, p_user_id, p_user_id) returning *;
end; $$;

create or replace function fn_category_get(p_id uuid) returns setof categories language plpgsql as $$
begin return query select * from categories where id = p_id and deleted_at is null; end; $$;

create or replace function fn_category_list(p_limit int default 10, p_offset int default 0) returns setof categories language plpgsql as $$
begin return query select * from categories where deleted_at is null order by name limit p_limit offset p_offset; end; $$;

-- Products
create or replace function fn_product_create(p_category_id uuid, p_name text, p_price numeric, p_user_id uuid) returns setof products language plpgsql as $$
begin
    if p_price < 0 then raise exception 'INVALID_PRICE' using errcode = 'P0001'; end if;
    return query insert into products (category_id, name, price, created_by, updated_by) values (p_category_id, p_name, p_price, p_user_id, p_user_id) returning *;
end; $$;

-- Order Logic
create or replace procedure sp_order_process_payment(p_order_id uuid, p_amount numeric, p_type text, p_user_id uuid) language plpgsql as $$
declare
    v_order_status text;
begin
    select status into v_order_status from orders where id = p_order_id;
    if v_order_status in ('Cancelled', 'Completed') then raise exception 'ORDER_NOT_PAYABLE' using errcode = 'P0001'; end if;
    
    insert into payments (order_id, payment_type, amount) values (p_order_id, p_type, p_amount);
    update orders set status = 'Completed', updated_at = now(), updated_by = p_user_id where id = p_order_id;
end; $$;

-- Generic Soft Delete
create or replace function fn_table_soft_delete(p_table_name text, p_id uuid, p_user_id uuid) returns void language plpgsql as $$
begin
    execute format('update %I set deleted_at = now(), updated_by = %L where id = %L', p_table_name, p_user_id, p_id);
end; $$;
