-- Core Database Schema for Chat Arer

-- Enable UUID extension
create extension if not exists "pgcrypto";

-- Tables
create table users (
    id uuid primary key default gen_random_uuid(),
    username text not null unique,
    display_name text not null,
    avatar_url text,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);

create table conversations (
    id uuid primary key default gen_random_uuid(),
    is_group boolean not null default false,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);

create table conversation_members (
    id uuid primary key default gen_random_uuid(),
    conversation_id uuid not null references conversations(id) on delete restrict,
    user_id uuid not null references users(id) on delete restrict,
    joined_at timestamptz not null default now(),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    unique(conversation_id, user_id)
);

create table messages (
    id uuid primary key default gen_random_uuid(),
    conversation_id uuid not null references conversations(id) on delete restrict,
    sender_id uuid not null references users(id) on delete restrict,
    content text not null,
    status text not null default 'sent' check (status in ('sent', 'delivered', 'read')),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by uuid,
    updated_by uuid,
    deleted_at timestamptz null
);

-- Indexes
create index idx_conversation_members_user_id on conversation_members(user_id);
create index idx_conversation_members_conversation_id on conversation_members(conversation_id);
create index idx_messages_conversation_id_created_at on messages(conversation_id, created_at desc) where deleted_at is null;
create index idx_users_deleted_at on users(deleted_at) where deleted_at is null;
create index idx_conversations_deleted_at on conversations(deleted_at) where deleted_at is null;

-- Comments
comment on table users is 'Application users';
comment on table conversations is 'Chat rooms or direct messages';
comment on table messages is 'Individual chat messages';
comment on column messages.status is 'Delivery status: sent, delivered, read';
