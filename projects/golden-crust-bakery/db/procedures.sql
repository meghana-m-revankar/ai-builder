-- CRUD and Business Procedures for Golden Crust Bakery
-- Schema version: 1.0.0

-- Categories
create or replace procedure sp_category_create(p_name_en text, p_name_ar text, inout p_id uuid)
language plpgsql as $$
begin
    if exists(select 1 from categories where name_en = p_name_en or name_ar = p_name_ar) then
        raise exception 'CATEGORY_EXISTS' using errcode = 'P0001';
    end if;
    insert into categories(name_en, name_ar) values (p_name_en, p_name_ar) returning id into p_id;
end;
$$;

create or replace function fn_category_get(p_id uuid) returns setof categories
language plpgsql as $$
begin
    return query select * from categories where id = p_id;
end;
$$;

-- Products
create or replace procedure sp_product_create(p_category_id uuid, p_name_en text, p_name_ar text, p_price numeric, p_image_url text, inout p_id uuid)
language plpgsql as $$
begin
    if p_price < 0 then raise exception 'INVALID_PRICE' using errcode = 'P0002'; end if;
    insert into products(category_id, name_en, name_ar, price, image_url) 
    values (p_category_id, p_name_en, p_name_ar, p_price, p_image_url) returning id into p_id;
end;
$$;

create or replace function fn_product_list(p_page int, p_limit int) returns setof products
language plpgsql as $$
begin
    return query select * from products order by created_at desc limit p_limit offset (p_page - 1) * p_limit;
end;
$$;

-- Orders
-- Business Logic: Create order and line items in one transaction
create or replace procedure sp_order_create(
    p_customer_name text, 
    p_phone text, 
    p_pickup_date timestamptz, 
    p_total_amount numeric, 
    inout p_id uuid
)
language plpgsql as $$
begin
    if p_pickup_date < now() then raise exception 'INVALID_PICKUP_DATE' using errcode = 'P0003'; end if;
    insert into orders(customer_name, phone, pickup_date, total_amount) 
    values (p_customer_name, p_phone, p_pickup_date, p_total_amount) returning id into p_id;
end;
$$;

create or replace procedure sp_order_item_create(p_order_id uuid, p_product_id uuid, p_quantity int, p_price numeric)
language plpgsql as $$
begin
    insert into order_items(order_id, product_id, quantity, price_at_purchase) 
    values (p_order_id, p_product_id, p_quantity, p_price);
end;
$$;

create or replace procedure sp_order_update_status(p_id uuid, p_status text)
language plpgsql as $$
begin
    if p_status not in ('Pending', 'Ready', 'Completed', 'Cancelled') then
        raise exception 'INVALID_STATUS' using errcode = 'P0004';
    end if;
    update orders set status = p_status, updated_at = now() where id = p_id;
    if not found then raise exception 'ORDER_NOT_FOUND' using errcode = 'P0005'; end if;
end;
$$;

create or replace function fn_order_list(p_status text, p_page int, p_limit int) returns setof orders
language plpgsql as $$
begin
    return query select * from orders 
    where (p_status is null or status = p_status)
    order by pickup_date asc limit p_limit offset (p_page - 1) * p_limit;
end;
$$;
