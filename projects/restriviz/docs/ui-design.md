# UI Design - Restriviz POS

## Overview
Restriviz is a clean, modern POS system for cafes. The design prioritizes speed of interaction, clarity of data, and accessibility.

## Design System Tokens
- Colors: Brand-900 (#0B1B3F), Brand-700 (#1E3A8A), Brand-500 (#3B5BDB), Brand-100 (#E7ECFB), Accent-500 (#F97316).
- Typography: Plus Jakarta Sans for headings, Inter for body, JetBrains Mono for prices/IDs.
- Radius: 12px for cards, 8px for inputs/buttons.
- Layout: Fixed sidebar (240px), top bar, fluid content area with 24px padding.

## Pages

### 1. Dashboard (`Dashboard.razor`)
- **Purpose**: Overview of current cafe operations.
- **Layout**: KPI cards at top (Orders today, Active tables, Revenue), recent orders table.
- **Actions**: Quick actions to "New Order", "Manage Menu".

### 2. POS Interface (`OrderEntry.razor`)
- **Purpose**: Main order taking screen.
- **Layout**: Two-column layout. Left: Category/Product selector (grid). Right: Order summary, cart list, "Place Order" button.
- **Actions**: Category filtering, quantity adjustment, remove item, proceed to payment.

### 3. Menu Management (`Menu.razor`)
- **Purpose**: CRUD for cafe menu items.
- **Layout**: Table view with search and filter. Modal for add/edit product.
- **Actions**: Add product, Edit, Toggle availability.
