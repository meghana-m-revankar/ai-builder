# UI Design Specification - Smart Retail POS & Inventory

## Overview
A premium, modern SaaS dashboard for retail management. Using a sidebar-navigation pattern with a clean, spacious interface.

## Pages

### 1. Dashboard (Home)
- **Purpose**: At-a-glance view of daily sales, low stock alerts, and recent orders.
- **Layout**: Bento grid layout. Large cards for revenue trends, small KPI cards for totals.
- **Actions**: "New Order" primary button.
- **Navigation**: Sidebar link.

### 2. Products
- **Purpose**: Manage inventory catalog.
- **Layout**: Data table with search, filter, and "Add Product" action.
- **Fields**: SKU, Name, Price, Stock Level.
- **Actions**: Edit/Delete row actions, Bulk Add.

### 3. POS (New Order)
- **Purpose**: Process customer purchases.
- **Layout**: Split-screen. Left: Product grid/search. Right: Order summary & payment.
- **Fields**: Quantity, Payment Method (Dropdown).
- **Actions**: "Complete Transaction", "Cancel Order".

## Design System
- **Colors**: Brand Blue (#1E3A8A), Accent Orange (#F97316), Canvas (#F6F7FB).
- **Typography**: Plus Jakarta Sans (headings), Inter (body).
- **Shadows**: Soft layered shadows on interactive cards.
