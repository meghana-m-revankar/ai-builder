-- CRUD Procedures for Golden Crust Bakery

-- Products CRUD
create or replace function fn_product_create(
    p_name text, p_description text, p_price numeric, p_currency char(3), p_image_url text, p_is_special boolean, p_user_id uuid
) returns setof products as $$
begin
    if p_price < 0 then raise exception 'INVALID_PRICE' using errcode = 'P0001'; end if;
    return query insert into products(name, description, price, currency, image_url, is_special, created_by, updated_by)
    values (p_name, p_description, p_price, p_currency, p_image_url, p_is_special, p_user_id, p_user_id) returning *;
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
    p_id uuid, p_name text, p_description text, p_price numeric, p_is_special boolean, p_user_id uuid
) returns setof products as $$
begin
    update products set name = p_name, description = p_description, price = p_price, is_special = p_is_special, updated_at = now(), updated_by = p_user_id
    where id = p_id and deleted_at is null;
    return query select * from products where id = p_id;
end;
$$ language plpgsql;

create or replace function fn_product_delete(p_id uuid, p_user_id uuid) returns void as $$
begin
    update products set deleted_at = now(), updated_by = p_user_id where id = p_id;
end;
$$ language plpgsql;

-- Orders CRUD & Business Logic
create or replace function fn_order_create(
    p_customer_name text, p_phone text, p_product_id uuid, p_quantity int, p_pickup_date timestamptz, p_user_id uuid
) returns setof orders as $$
begin
    if not exists (select 1 from products where id = p_product_id and deleted_at is null) then
        raise exception 'PRODUCT_NOT_FOUND' using errcode = 'P0001';
    end if;
    return query insert into orders(customer_name, phone, product_id, quantity, pickup_date, created_by, updated_by)
    values (p_customer_name, p_phone, p_product_id, p_quantity, p_pickup_date, p_user_id, p_user_id) returning *;
end;
$$ language plpgsql;

create or replace function fn_order_update_status(p_id uuid, p_status text, p_user_id uuid) returns setof orders as $$
begin
    if p_status not in ('new', 'baking', 'ready', 'collected', 'cancelled') then
        raise exception 'INVALID_STATUS' using errcode = 'P0001';
    end if;
    update orders set status = p_status, updated_at = now(), updated_by = p_user_id where id = p_id and deleted_at is null;
    return query select * from orders where id = p_id;
end;
$$ language plpgsql;

create or replace function fn_order_list(p_limit int, p_offset int) returns setof orders as $$
begin
    return query select * from orders where deleted_at is null order by pickup_date asc limit p_limit offset p_offset;
end;
$$ language plpgsql;

-- Reviews CRUD
create or replace function fn_review_create(
    p_customer_name text, p_rating int, p_comment text, p_user_id uuid
) returns setof reviews as $$
begin
    if p_rating < 1 or p_rating > 5 then raise exception 'INVALID_RATING' using errcode = 'P0001'; end if;
    return query insert into reviews(customer_name, rating, comment, created_by, updated_by)
    values (p_customer_name, p_rating, p_comment, p_user_id, p_user_id) returning *;
end;
$$ language plpgsql;
