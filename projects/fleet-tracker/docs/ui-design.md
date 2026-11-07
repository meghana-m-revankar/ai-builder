# UI Design Specification - Fleet Tracker

## 1. Dashboard
- **Purpose**: High-level overview of fleet status, active deliveries, and upcoming maintenance.
- **Layout**: 
    - Header: Search, Notifications, User Profile.
    - KPI Row: "Active Vans", "Drivers Due for License Renewal", "Maintenance Alerts", "Total Fuel Expense".
    - Main: Two-column grid:
        - Left: Recent Deliveries table (last 5).
        - Right: Fleet Status donut chart + Urgent Maintenance Alerts list.
- **Actions**: View Details links.

## 2. Fleet Management
- **Purpose**: Manage the van inventory.
- **Layout**: 
    - Header: Page Title, "Add New Van" CTA.
    - Filters: Status (Active, In Repair, Retired), Model search.
    - Main: Data table with columns: ID, Plate, Model, Status, Last Maintenance.
- **Actions**: Edit/View details via row menu.

## 3. Maintenance Logs
- **Purpose**: Record and track vehicle maintenance.
- **Layout**: 
    - Header: Page Title, "Add Log" button.
    - Filters: Van search, Date range.
    - Main: Table with ID, Van Plate, Description, Cost, Date.
- **Actions**: Delete button (with confirmation modal).

## 4. HR/Compliance
- **Purpose**: Track driver data and license status.
- **Layout**: 
    - Header: Page Title.
    - Filters: License Status (Valid, Expiring Soon, Expired).
    - Main: List cards per driver showing name, license number, and expiry date.
- **Actions**: View profile.

## 5. Reporting
- **Purpose**: Analyze fuel costs and performance.
- **Layout**: 
    - Header: Title, Date range selector.
    - Main: Multi-line chart (Fuel Costs vs. Time) and aggregate cards (Avg Fuel Cost per KM).
