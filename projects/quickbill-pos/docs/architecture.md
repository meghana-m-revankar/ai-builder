# 03 Architecture - QuickBill POS

## Overview
QuickBill POS is a client-side, browser-based Point of Sale application designed for small cafes. It provides a touch-friendly interface for order management, a dashboard for business insights, and product inventory management, all while maintaining data persistence via `localStorage`.

## UI/UX Design System
- **Brand**: Emerald (#059669)
- **Palette**: White/Slate (Clean, minimalist)
- **Controls**: Large, touch-friendly buttons for tablet operation.
- **Styling**: Tailwind CSS (via CDN).

## Pages & Navigation
- **Home (index.html)**: Public marketing landing page.
- **POS (pos.html)**: Main interactive screen for cashiers.
- **Dashboard (dashboard.html)**: Business analytics and daily reporting.
- **Products (products.html)**: CRUD operations for inventory management.

## Module Structure
- **Core (js/main.js)**: Orchestrates global state, event handling, and persistence.
- **Data (js/data.js)**: Initial schema and default product seeding.
- **Layout (Shared)**: Consistent header/sidebar navigation across all app pages.

## Data Structure (localStorage)
- `pos_products`: Array of {id, name, category, price, imageKeyword}
- `pos_bills`: Array of {id, timestamp, items: [], subtotal, gst, total, paymentMode}

## Folder Structure
```
/
  index.html
  pos.html
  dashboard.html
  products.html
  css/
    app.css       # Custom overrides and component classes
  js/
    main.js       # App logic, state management, UI rendering
    data.js       # Default demo data
  images/         # Static assets
```

## Key Design Decisions
1. **No Backend**: Data resides in `localStorage`. Ideal for zero-cost, offline-first deployment.
2. **Interactive Server Mode Replacement**: As the stack is static, SPA-like state management is simulated via `main.js` which re-renders components on state change.
3. **Print Workflow**: Use CSS `@media print` rules to ensure the receipt modal is the only visible element when printing.
4. **Input Handling**: Global event listeners for `Enter` (Checkout) and `Esc` (Clear Cart) keys to speed up POS operations.
