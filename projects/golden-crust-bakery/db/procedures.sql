-- CRUD and Business Procedures for Golden Crust Bakery
-- Version: 1.0

-- 1. Product CRUD Procedures

/**
 * Creates a new product.
 */
create or replace procedure sp_product_create(
    p_name_en text,
    p_name_ar text,
    p_description_en text,
    p_description_ar text,
    p_price_aed numeric,
    p_category text,
    out p_id uuid
)
language plpgsql
as $$
begin
    if p_name_en is null or p_price_aed < 0 then
        raise exception 'INVALID_PRODUCT_DATA' using errcode = 'P0001';
    end if;

    insert into products (name_en, name_ar, description_en, description_ar, price_aed, category)
    values (p_name_en, p_name_ar, p_description_en, p_description_ar, p_price_aed, p_category)
    returning id into p_id;
end;
$$;

/**
 * Gets a product by ID.
 */
create or replace function fn_product_get_by_id(p_id uuid)
returns setof products
language plpgsql
as $$
begin
    return query select * from products where id = p_id;
end;
$$;

/**
 * Lists products with basic pagination.
 */
create or replace function fn_product_list(p_limit int, p_offset int)
returns setof products
language plpgsql
as $$
begin
    return query select * from products order by created_at desc limit p_limit offset p_offset;
end;
$$;

/**
 * Updates a product.
 */
create or replace procedure sp_product_update(
    p_id uuid,
    p_name_en text,
    p_price_aed numeric,
    p_is_available boolean
)
language plpgsql
as $$
begin
    update products
    set name_en = p_name_en,
        price_aed = p_price_aed,
        is_available = p_is_available,
        updated_at = now()
    where id = p_id;

    if not found then
        raise exception 'PRODUCT_NOT_FOUND' using errcode = 'P0002';
    end if;
end;
$$;

-- 2. Order CRUD & Business Procedures

/**
 * Creates a new order.
 */
create or replace procedure sp_order_create(
    p_customer_name text,
    p_phone text,
    p_product_id uuid,
    p_quantity int,
    p_pickup_date timestamptz,
    out p_id uuid
)
language plpgsql
as $$
declare
    v_is_available boolean;
begin
    select is_available into v_is_available from products where id = p_product_id;
    if not v_is_available then
        raise exception 'PRODUCT_UNAVAILABLE' using errcode = 'P0003';
    end if;

    insert into orders (customer_name, phone, product_id, quantity, pickup_date)
    values (p_customer_name, p_phone, p_product_id, p_quantity, p_pickup_date)
    returning id into p_id;
end;
$$;

/**
 * Updates order status (Admin only).
 */
create or replace procedure sp_order_update_status(
    p_id uuid,
    p_status text
)
language plpgsql
as $$
begin
    if p_status not in ('pending', 'ready', 'completed') then
        raise exception 'INVALID_STATUS' using errcode = 'P0004';
    end if;

    update orders
    set status = p_status,
        updated_at = now()
    where id = p_id;

    if not found then
        raise exception 'ORDER_NOT_FOUND' using errcode = 'P0005';
    end if;
end;
$$;

/**
 * Lists orders for admin dashboard.
 */
create or replace function fn_order_list(p_limit int, p_offset int)
returns setof orders
language plpgsql
as $$
begin
    return query select * from orders order by pickup_date asc limit p_limit offset p_offset;
end;
$$;
