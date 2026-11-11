-- db/procedures.sql

-- 1. USERS CRUD
create or replace function fn_user_create(p_username text, p_display_name text, p_avatar_url text)
returns setof users as $$
begin
    if exists (select 1 from users where username = p_username) then
        raise exception 'USER_ALREADY_EXISTS' using errcode = 'P0001';
    end if;
    return query insert into users(username, display_name, avatar_url)
    values (p_username, p_display_name, p_avatar_url) returning *;
end;
$$ language plpgsql;

create or replace function fn_user_get(p_id uuid) returns setof users as $$
begin
    return query select * from users where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

create or replace function fn_user_list(p_limit int default 50, p_offset int default 0) returns setof users as $$
begin
    return query select * from users where deleted_at is null order by created_at desc limit p_limit offset p_offset;
end;
$$ language plpgsql;

create or replace function fn_user_update(p_id uuid, p_display_name text, p_avatar_url text) returns setof users as $$
begin
    return query update users set display_name = p_display_name, avatar_url = p_avatar_url, updated_at = now()
    where id = p_id and deleted_at is null returning *;
end;
$$ language plpgsql;

create or replace function fn_user_delete(p_id uuid) returns void as $$
begin
    update users set deleted_at = now() where id = p_id;
end;
$$ language plpgsql;

-- 2. CONVERSATIONS CRUD
create or replace function fn_conversation_create(p_is_group boolean) returns setof conversations as $$
begin
    return query insert into conversations(is_group) values (p_is_group) returning *;
end;
$$ language plpgsql;

create or replace function fn_conversation_get(p_id uuid) returns setof conversations as $$
begin
    return query select * from conversations where id = p_id and deleted_at is null;
end;
$$ language plpgsql;

create or replace function fn_conversation_list(p_limit int default 50, p_offset int default 0) returns setof conversations as $$
begin
    return query select * from conversations where deleted_at is null order by created_at desc limit p_limit offset p_offset;
end;
$$ language plpgsql;

create or replace function fn_conversation_delete(p_id uuid) returns void as $$
begin
    update conversations set deleted_at = now() where id = p_id;
end;
$$ language plpgsql;

-- 3. CONVERSATION MEMBERS CRUD
create or replace function fn_conversation_member_add(p_conversation_id uuid, p_user_id uuid) returns setof conversation_members as $$
begin
    return query insert into conversation_members(conversation_id, user_id)
    values (p_conversation_id, p_user_id) returning *;
end;
$$ language plpgsql;

create or replace function fn_conversation_member_list(p_conversation_id uuid) returns setof conversation_members as $$
begin
    return query select * from conversation_members where conversation_id = p_conversation_id;
end;
$$ language plpgsql;

-- 4. MESSAGES CRUD
create or replace function fn_message_create(p_conversation_id uuid, p_sender_id uuid, p_content text) returns setof messages as $$
begin
    if not exists (select 1 from conversation_members where conversation_id = p_conversation_id and user_id = p_sender_id) then
        raise exception 'USER_NOT_IN_CONVERSATION' using errcode = 'P0001';
    end if;
    return query insert into messages(conversation_id, sender_id, content)
    values (p_conversation_id, p_sender_id, p_content) returning *;
end;
$$ language plpgsql;

create or replace function fn_message_list(p_conversation_id uuid, p_limit int default 50, p_offset int default 0) returns setof messages as $$
begin
    return query select * from messages where conversation_id = p_conversation_id and deleted_at is null
    order by created_at desc limit p_limit offset p_offset;
end;
$$ language plpgsql;

create or replace function fn_message_update_status(p_id uuid, p_status text) returns setof messages as $$
begin
    if p_status not in ('sent', 'delivered', 'read') then
        raise exception 'INVALID_STATUS' using errcode = 'P0001';
    end if;
    return query update messages set status = p_status, updated_at = now() where id = p_id returning *;
end;
$$ language plpgsql;

create or replace function fn_message_delete(p_id uuid) returns void as $$
begin
    update messages set deleted_at = now() where id = p_id;
end;
$$ language plpgsql;
