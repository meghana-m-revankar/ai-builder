-- Procedures for Chai Corner Café

-- CRUD: menu_items
create or replace function fn_menu_item_create(p_name text, p_price numeric, p_category text, p_description text, p_created_by uuid)
returns setof menu_items as $$
begin
    return query insert into menu_items (name, price, category, description, created_by)
    values (p_name, p_price, p_category, p_description, p_created_by)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_menu_item_get(p_id uuid)
returns setof menu_items as $$
begin
    return query select * from menu_items where id = p_id;
end;
$$ language plpgsql;

create or replace function fn_menu_item_list()
returns setof menu_items as $$
begin
    return query select * from menu_items order by category, name;
end;
$$ language plpgsql;

create or replace function fn_menu_item_update(p_id uuid, p_name text, p_price numeric, p_category text, p_description text, p_updated_by uuid)
returns setof menu_items as $$
begin
    return query update menu_items
    set name = p_name, price = p_price, category = p_category, description = p_description, updated_by = p_updated_by, updated_at = now()
    where id = p_id
    returning *;
end;
$$ language plpgsql;

create or replace function fn_menu_item_delete(p_id uuid)
returns void as $$
begin
    delete from menu_items where id = p_id;
end;
$$ language plpgsql;

-- CRUD: offers
create or replace function fn_offer_create(p_title text, p_description text, p_discount_percent int, p_valid_until timestamptz, p_created_by uuid)
returns setof offers as $$
begin
    return query insert into offers (title, description, discount_percent, valid_until, created_by)
    values (p_title, p_description, p_discount_percent, p_valid_until, p_created_by)
    returning *;
end;
$$ language plpgsql;

create or replace function fn_offer_list_active()
returns setof offers as $$
begin
    return query select * from offers where valid_until >= now() order by valid_until asc;
end;
$$ language plpgsql;

-- CRUD: contact_inquiries
create or replace function fn_contact_inquiry_create(p_name text, p_email text, p_message text)
returns setof contact_inquiries as $$
begin
    return query insert into contact_inquiries (name, email, message)
    values (p_name, p_email, p_message)
    returning *;
end;
$$ language plpgsql;

-- Business Procedures
create or replace function sp_submit_inquiry(p_name text, p_email text, p_message text)
returns void as $$
begin
    if length(p_name) < 2 then raise exception 'INVALID_NAME' using errcode = 'P0001'; end if;
    if p_email not like '%@%.%' then raise exception 'INVALID_EMAIL' using errcode = 'P0002'; end if;
    
    insert into contact_inquiries (name, email, message) values (p_name, p_email, p_message);
end;
$$ language plpgsql;
