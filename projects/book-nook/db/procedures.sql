-- db/procedures.sql: CRUD and business procedures for Book Nook
-- Target: PostgreSQL 15+

--------------------------------------------------------------------------------
-- 1. BOOKS PROCEDURES
--------------------------------------------------------------------------------

-- Create a book
create or replace function fn_book_create(
    p_title varchar, p_author varchar, p_category varchar, p_isbn varchar, p_total_copies int
) returns setof books language plpgsql as $$
begin
    return query
    insert into books (title, author, category, isbn, total_copies, available_copies)
    values (p_title, p_author, p_category, p_isbn, p_total_copies, p_total_copies)
    returning *;
end;
$$;

-- Get book by id
create or replace function fn_book_get(p_id uuid) returns setof books language plpgsql as $$
begin
    return query select * from books where id = p_id and deleted_at is null;
end;
$$;

-- List books with basic paging
create or replace function fn_book_list(p_limit int, p_offset int) returns setof books language plpgsql as $$
begin
    return query select * from books where deleted_at is null order by created_at desc limit p_limit offset p_offset;
end;
$$;

-- Update book
create or replace function fn_book_update(
    p_id uuid, p_title varchar, p_author varchar, p_category varchar, p_total_copies int
) returns setof books language plpgsql as $$
begin
    return query
    update books set title = p_title, author = p_author, category = p_category, 
                     total_copies = p_total_copies, updated_at = now()
    where id = p_id and deleted_at is null
    returning *;
end;
$$;

-- Soft delete book
create or replace function fn_book_delete(p_id uuid) returns void language plpgsql as $$
begin
    update books set deleted_at = now() where id = p_id;
end;
$$;

--------------------------------------------------------------------------------
-- 2. MEMBERS PROCEDURES
--------------------------------------------------------------------------------

create or replace function fn_member_create(
    p_name varchar, p_class varchar, p_phone varchar, p_email varchar
) returns setof members language plpgsql as $$
begin
    return query
    insert into members (name, class, phone, email)
    values (p_name, p_class, p_phone, p_email)
    returning *;
end;
$$;

create or replace function fn_member_get(p_id uuid) returns setof members language plpgsql as $$
begin
    return query select * from members where id = p_id and deleted_at is null;
end;
$$;

create or replace function fn_member_list(p_limit int, p_offset int) returns setof members language plpgsql as $$
begin
    return query select * from members where deleted_at is null order by name asc limit p_limit offset p_offset;
end;
$$;

create or replace function fn_member_update(
    p_id uuid, p_name varchar, p_class varchar, p_phone varchar
) returns setof members language plpgsql as $$
begin
    return query
    update members set name = p_name, class = p_class, phone = p_phone, updated_at = now()
    where id = p_id and deleted_at is null
    returning *;
end;
$$;

create or replace function fn_member_delete(p_id uuid) returns void language plpgsql as $$
begin
    update members set deleted_at = now() where id = p_id;
end;
$$;

--------------------------------------------------------------------------------
-- 3. LOAN PROCEDURES (Business Logic)
--------------------------------------------------------------------------------

-- Issued in schema.sql, keeping consistent interface here for completeness
-- Issue book
-- fn_loan_issue(p_book_id uuid, p_member_id uuid, p_due_date timestamptz)

-- Return book
-- fn_loan_return(p_loan_id uuid)

-- List overdue loans
create or replace function fn_loan_list_overdue() returns setof loans language plpgsql as $$
begin
    return query
    select * from loans 
    where return_date is null and due_date < now()
    order by due_date asc;
end;
$$;
