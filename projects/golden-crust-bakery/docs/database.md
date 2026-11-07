# 05 Database - Golden Crust Bakery

## ER Diagram
```mermaid
erDiagram
    PRODUCT ||--o{ ORDER : includes
    PRODUCT {
        uuid id PK
        text name_en
        text name_ar
        numeric price_aed
        boolean is_best_seller
    }
    ORDER {
        uuid id PK
        text customer_name
        text phone
        uuid product_id FK
        integer quantity
        timestamptz pickup_date
        text status
    }
```

## Schema Details
- All tables include `created_at` (timestamptz), `updated_at` (timestamptz).
- Orders status: 'Pending', 'Confirmed', 'Completed', 'Cancelled'.
