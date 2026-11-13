# Restriviz UI Design

## Overview
Restriviz is a restaurant POS designed for a small cafe. The UI follows a modern, clean, and efficient aesthetic to ensure fast operations for cashiers.

## Design System
- **Colors**: Brand Blue (#1E3A8A), Accent Orange (#F97316), Canvas (#F6F7FB).
- **Typography**: Plus Jakarta Sans (headings), Inter (body), JetBrains Mono (prices).
- **Layout**: Fixed sidebar navigation, top status bar, content-driven layouts.

## Pages

### 1. Dashboard (`/`)
- **Purpose**: Quick overview of daily operations.
- **Layout**: KPI cards (Active orders, Today's Sales, Low Stock) + Recent activity table.
- **Actions**: "New Order" primary button.

### 2. Menu Management (`/menu`)
- **Purpose**: CRUD for products and categories.
- **Layout**: Tabbed view for categories. Grid of product cards with toggle for availability.
- **Actions**: "Add Product" modal, "Edit/Delete" per product.

### 3. POS / Order Taking (`/pos`)
- **Purpose**: Main ordering interface.
- **Layout**: Two-pane. Left: Product categories and items. Right: Active order summary, total calculation, payment method selection.
- **Actions**: "Confirm Order", "Apply Discount", "Record Payment".

### 4. Orders History (`/orders`)
- **Purpose**: Review past orders and payments.
- **Layout**: Filterable table with order details.
- **Actions**: "View Details", "Print Receipt".
