# 05 Database

## PostgreSQL conventions
- Tables: `vans`, `drivers`, `maintenance`.
- Columns: `id uuid primary key`, `created_at timestamptz`, `updated_at timestamptz`.
- Currency: `numeric(18,2)`.

## ER Diagram
```mermaid
erDiagram
    VAN ||--o{ MAINTENANCE : has
    VAN ||--o| DRIVER : assigned_to
    VAN {
        uuid id
        text plate
        text status
        timestamptz created_at
    }
    MAINTENANCE {
        uuid id
        uuid van_id
        numeric cost
        text description
        timestamptz created_at
    }
```
