# UI Design System: Bloom Flower Shop

## Design Palette
- **Brand Colors:**
  - Primary (Brand-700): #065F46 (Emerald-800 - representing nature/freshness)
  - Accent (Accent-500): #E11D48 (Rose-600 - representing floral blossoms)
  - Surface: #FFFFFF
  - Background: #FDF2F8 (Light Pink tint)
  - Ink: #1E293B

## Pages Overview

### 1. Catalog Page (Public)
- **Purpose:** Browse available bouquets.
- **Layout:** Bento grid of product cards.
- **Fields:** Bouquet image, name, price.
- **Actions:** "View Details", "Add to Cart" button.
- **Navigation:** Header with Logo, Home, Orders, Cart icon.

### 2. Order Form (Public)
- **Purpose:** Place an order for a selected bouquet.
- **Layout:** Two-column split. Left side: Bouquet summary, Right side: Order form.
- **Fields:** Customer Name, Phone, Delivery Date, Gift Message.
- **Actions:** "Place Order" (CTA).

### 3. Admin Dashboard (Private)
- **Purpose:** Manage orders and inventory.
- **Layout:** Sidebar navigation, Main content area with a data table.
- **Fields:** Order list (Customer, Date, Status), Bouquet CRUD (Name, Price, Image).
- **Actions:** "Mark as Delivered", "Add New Bouquet", "Edit".
