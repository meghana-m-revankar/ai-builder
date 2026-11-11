-- Procedures for Flower Shop Management

-- =============================================
-- CATEGORIES
-- =============================================

create or replace function fn_category_create(p_name text, p_description text, p_user_id uuid)
returns setof categories as $$
begin
    if p_name is null or trim(p_name) = '' then
        raise exception 'CATEGORY_NAME_REQUIRED' using errcode = 'P0001';
    end if;
    return query insert into categories (name, description, created_by, updated_by)
    values (p_name, p_description, p_user_id, p_user_id)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_category_get(p_id uuid)
returns setof categories as $$
begin
    return query select * from categories where id = p_id;
end;
$$ language plpgsql;

create or replace function fn_category_list()
returns setof categories as $$
begin
    return query select * from categories order by name;
end;
$$ language plpgsql;

create or replace function fn_category_update(p_id uuid, p_name text, p_description text, p_user_id uuid)
returns setof categories as $$
begin
    return query update categories set name = p_name, description = p_description, updated_at = now(), updated_by = p_user_id
    where id = p_id
    returning *;
end;
$$ language plpgsql;

-- =============================================
-- PRODUCTS
-- =============================================

create or replace function fn_product_create(p_category_id uuid, p_name text, p_description text, p_price numeric, p_currency char(3), p_stock_quantity int, p_image_url text, p_is_featured boolean, p_user_id uuid)
returns setof products as $$
begin
    if p_price < 0 then raise exception 'INVALID_PRICE' using errcode = 'P0001'; end if;
    return query insert into products (category_id, name, description, price, currency, stock_quantity, image_url, is_featured, created_by, updated_by)
    values (p_category_id, p_name, p_description, p_price, p_currency, p_stock_quantity, p_image_url, p_is_featured, p_user_id, p_user_id)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_product_get(p_id uuid)
returns setof products as $$
begin
    return query select * from products where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

create or replace function fn_product_list(p_category_id uuid default null, p_limit int default 20, p_offset int default 0)
returns setof products as $$
begin
    return query select * from products 
    where (p_category_id is null or category_id = p_category_id)
    and deleted_at is null
    order by created_at desc
    limit p_limit offset p_offset;
end;
$$ language plpgsql;

create or replace function fn_product_update(p_id uuid, p_name text, p_description text, p_price numeric, p_stock_quantity int, p_is_featured boolean, p_user_id uuid)
returns setof products as $$
begin
    return query update products set name = p_name, description = p_description, price = p_price, stock_quantity = p_stock_quantity, is_featured = p_is_featured, updated_at = now(), updated_by = p_user_id
    where id = p_id
    returning *;
end;
$$ language plpgsql;

create or replace function fn_product_delete(p_id uuid, p_user_id uuid)
returns setof products as $$
begin
    return query update products set deleted_at = now(), updated_by = p_user_id
    where id = p_id
    returning *;
end;
$$ language plpgsql;

-- =============================================
-- INQUIRIES
-- =============================================

create or replace function fn_inquiry_create(p_full_name text, p_email text, p_phone text, p_message text)
returns setof inquiries as $$
begin
    if p_email !~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$' then
        raise exception 'INVALID_EMAIL' using errcode = 'P0001';
    end if;
    return query insert into inquiries (full_name, email, phone, message)
    values (p_full_name, p_email, p_phone, p_message)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_inquiry_list(p_status text default null)
returns setof inquiries as $$
begin
    return query select * from inquiries
    where (p_status is null or status = p_status)
    order by created_at desc;
end;
$$ language plpgsql;

create or replace function fn_inquiry_update_status(p_id uuid, p_status text)
returns setof inquiries as $$
begin
    if p_status not in ('new', 'read', 'replied') then
        raise exception 'INVALID_STATUS' using errcode = 'P0001';
    end if;
    return query update inquiries set status = p_status, updated_at = now()
    where id = p_id
    returning *;
end;
$$ language plpgsql;
