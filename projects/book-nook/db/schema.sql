-- schema.sql: Database schema for Book Nook library management system
-- Target: PostgreSQL 15+

create extension if not exists "uuid-ossp";

--------------------------------------------------------------------------------
-- 1. BOOKS TABLE
--------------------------------------------------------------------------------
create table if not exists books (
    id uuid primary key default gen_random_uuid(),
    title varchar(255) not null,
    author varchar(255) not null,
    category varchar(100) not null,
    isbn varchar(20) not null unique,
    total_copies int not null check (total_copies >= 0),
    available_copies int not null check (available_copies >= 0 and available_copies <= total_copies),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    deleted_at timestamptz null
);

comment on table books is 'Library book inventory records';
comment on column books.id is 'Primary key UUID';
comment on column books.title is 'Book title';
comment on column books.author is 'Book author';
comment on column books.category is 'Genre or category of the book';
comment on column books.isbn is 'International Standard Book Number';
comment on column books.total_copies is 'Total physical copies owned by the library';
comment on column books.available_copies is 'Copies currently available for checkout';

create index idx_books_title on books(title) where deleted_at is null;
create index idx_books_author on books(author) where deleted_at is null;
create index idx_books_category on books(category) where deleted_at is null;
create index idx_books_deleted_at on books(deleted_at);


--------------------------------------------------------------------------------
-- 2. MEMBERS TABLE
--------------------------------------------------------------------------------
create table if not exists members (
    id uuid primary key default gen_random_uuid(),
    name varchar(255) not null,
    class varchar(50) not null,
    phone varchar(20) not null,
    email varchar(255) not null unique,
    joined_date date not null default current_date,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    deleted_at timestamptz null
);

comment on table members is 'Library members (students and faculty)';
comment on column members.id is 'Primary key UUID';
comment on column members.name is 'Full name of the member';
comment on column members.class is 'School class or grade (e.g. 10-A, Faculty)';
comment on column members.phone is 'Contact phone number (local Indian format)';
comment on column members.email is 'Unique email address';
comment on column members.joined_date is 'Date the member joined the library';

create index idx_members_name on members(name) where deleted_at is null;
create index idx_members_class on members(class) where deleted_at is null;
create index idx_members_deleted_at on members(deleted_at);


--------------------------------------------------------------------------------
-- 3. LOANS TABLE
--------------------------------------------------------------------------------
create table if not exists loans (
    id uuid primary key default gen_random_uuid(),
    book_id uuid not null references books(id) on delete restrict,
    member_id uuid not null references members(id) on delete restrict,
    issue_date timestamptz not null default now(),
    due_date timestamptz not null,
    return_date timestamptz null,
    fine numeric(18,2) not null default 0.00 check (fine >= 0.00),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    constraint chk_due_date_after_issue check (due_date > issue_date),
    constraint chk_return_date_after_issue check (return_date is null or return_date >= issue_date)
);

comment on table loans is 'Book issue and return transaction tracking';
comment on column loans.id is 'Primary key UUID';
comment on column loans.book_id is 'Foreign key to books table';
comment on column loans.member_id is 'Foreign key to members table';
comment on column loans.issue_date is 'Date and time when the book was issued';
comment on column loans.due_date is 'Date and time when the book is due for return';
comment on column loans.return_date is 'Date and time when the book was actually returned (null if active)';
comment on column loans.fine is 'Calculated fine amount in INR for late returns';

create index idx_loans_book_id on loans(book_id);
create index idx_loans_member_id on loans(member_id);
create index idx_loans_issue_date on loans(issue_date);
create index idx_loans_due_date on loans(due_date);
create index idx_loans_return_date on loans(return_date);
create index idx_loans_active on loans(member_id) where return_date is null;


--------------------------------------------------------------------------------
-- 4. PROCEDURES / FUNCTIONS
--------------------------------------------------------------------------------

-- Function: fn_loan_issue
-- Purpose: Issue a book to a member with business rule validations.
create or replace function fn_loan_issue(
    p_book_id uuid,
    p_member_id uuid,
    p_due_date timestamptz
)
returns setof loans
language plpgsql
as $$
declare
    v_available_copies int;
    v_active_loans_count int;
    v_loan_id uuid;
begin
    -- 1. Check if book exists and has available copies
    select available_copies into v_available_copies
    from books
    id where id = p_book_id and deleted_at is null
    for update;

    if not found then
        raise exception 'BOOK_NOT_FOUND' using errcode = 'P0001';
    end if;

    if v_available_copies <= 0 then
        raise exception 'BOOK_NOT_AVAILABLE' using errcode = 'P0002';
    end if;

    -- 2. Check if member exists
    if not exists (select 1 from members where id = p_member_id and deleted_at is null) then
        raise exception 'MEMBER_NOT_FOUND' using errcode = 'P0003';
    end if;

    -- 3. Check active loan count for member (max 3 allowed)
    select count(*) into v_active_loans_count
    from loans
    where member_id = p_member_id and return_date is null;

    if v_active_loans_count >= 3 then
        raise exception 'MAX_LOANS_EXCEEDED' using errcode = 'P0004';
    end if;

    -- 4. Decrement available copies in books
    update books
    set available_copies = available_copies - 1,
        updated_at = now()
    where id = p_book_id;

    -- 5. Create loan record
    insert into loans (book_id, member_id, issue_date, due_date)
    values (p_book_id, p_member_id, now(), p_due_date)
    returning id into v_loan_id;

    -- 6. Return the created loan row
    return query
    select * from loans where id = v_loan_id;
end;
$$;

-- Function: fn_loan_return
-- Purpose: Return an issued book and calculate fine if late (₹5 per late day).
create or replace function fn_loan_return(
    p_loan_id uuid
)
returns setof loans
language plpgsql
as $$
declare
    v_book_id uuid;
    v_due_date timestamptz;
    v_return_date timestamptz := now();
    v_days_late int;
    v_fine numeric(18,2) := 0.00;
begin
    -- 1. Lock and fetch loan
    select book_id, due_date into v_book_id, v_due_date
    from loans
    where id = p_loan_id and return_date is null
    for update;

    if not found then
        raise exception 'ACTIVE_LOAN_NOT_FOUND' using errcode = 'P0005';
    end if;

    -- 2. Calculate fine (₹5 per day late)
    if v_return_date > v_due_date then
        v_days_late := ceil(extract(epoch from (v_return_date - v_due_date)) / 86400.0);
        v_fine := v_days_late * 5.00;
    end if;

    -- 3. Update loan record
    update loans
    set return_date = v_return_date,
        fine = v_fine,
        updated_at = now()
    where id = p_loan_id;

    -- 4. Increment available copies in books
    update books
    set available_copies = available_copies + 1,
        updated_at = now()
    where id = v_book_id;

    -- 5. Return updated loan row
    return query
    select * from loans where id = p_loan_id;
end;
$$;
