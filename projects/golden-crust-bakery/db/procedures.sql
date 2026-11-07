-- db/procedures.sql

-- PRODUCTS CRUD

create or replace function fn_product_create(
    p_name_en text, p_name_ar text, p_price_aed numeric, p_is_best_seller boolean, p_user_id uuid
) returns setof products as $$
begin
    if p_price_aed < 0 then raise exception 'INVALID_PRICE' using errcode = 'P0001'; end if;
    return query insert into products (name_en, name_ar, price_aed, is_best_seller, created_by, updated_by)
    values (p_name_en, p_name_ar, p_price_aed, p_is_best_seller, p_user_id, p_user_id)
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
    p_id uuid, p_name_en text, p_name_ar text, p_price_aed numeric, p_is_best_seller boolean, p_user_id uuid
) returns setof products as $$
begin
    if not exists (select 1 from products where id = p_id and deleted_at is null) then raise exception 'PRODUCT_NOT_FOUND' using errcode = 'P0002'; end if;
    return query update products set name_en = p_name_en, name_ar = p_name_ar, price_aed = p_price_aed, is_best_seller = p_is_best_seller, updated_at = now(), updated_by = p_user_id
    where id = p_id returning *;
end;
$$ language plpgsql;

create or replace procedure sp_product_delete(p_id uuid, p_user_id uuid) as $$
begin
    update products set deleted_at = now(), updated_by = p_user_id where id = p_id;
end;
$$ language plpgsql;

-- ORDERS CRUD

create or replace function fn_order_create(
    p_customer_name text, p_phone text, p_product_id uuid, p_quantity int, p_pickup_date timestamptz, p_user_id uuid
) returns setof orders as $$
begin
    if p_quantity <= 0 then raise exception 'INVALID_QUANTITY' using errcode = 'P0001'; end if;
    if not exists (select 1 from products where id = p_product_id and deleted_at is null) then raise exception 'INVALID_PRODUCT' using errcode = 'P0002'; end if;
    return query insert into orders (customer_name, phone, product_id, quantity, pickup_date, created_by, updated_by)
    values (p_customer_name, p_phone, p_product_id, p_quantity, p_pickup_date, p_user_id, p_user_id)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_order_get(p_id uuid) returns setof orders as $$
begin
    return query select * from orders where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

create or replace function fn_order_list(p_status text, p_limit int, p_offset int) returns setof orders as $$
begin
    return query select * from orders where (p_status is null or status = p_status) and deleted_at is null order by created_at desc limit p_limit offset p_offset;
end;
$$ language plpgsql;

create or replace procedure sp_order_update_status(p_id uuid, p_status text, p_user_id uuid) as $$
begin
    if p_status not in ('Pending', 'Confirmed', 'Completed', 'Cancelled') then raise exception 'INVALID_STATUS' using errcode = 'P0003'; end if;
    update orders set status = p_status, updated_at = now(), updated_by = p_user_id where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

-- TESTIMONIALS CRUD

create or replace function fn_testimonial_create(
    p_customer_name text, p_content text, p_rating int
) returns setof testimonials as $$
begin
    if p_rating < 1 or p_rating > 5 then raise exception 'INVALID_RATING' using errcode = 'P0001'; end if;
    return query insert into testimonials (customer_name, content, rating) values (p_customer_name, p_content, p_rating) returning *;
end;
$$ language plpgsql;

create or replace function fn_testimonial_list() returns setof testimonials as $$
begin
    return query select * from testimonials where deleted_at is null order by created_at desc;
end;
$$ language plpgsql;
