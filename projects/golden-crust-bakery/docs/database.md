# 05 Database - Golden Crust Bakery

## ER Diagram
```mermaid
erDiagram
    PRODUCT ||--o{ PREORDER : has
    PRODUCT {
        uuid id
        string name_en
        string name_ar
        numeric price
        string currency
        bool is_bestseller
    }
    PREORDER {
        uuid id
        string customer_name
        string phone
        uuid product_id
        int quantity
        timestamptz pickup_date
        string status
    }
```
