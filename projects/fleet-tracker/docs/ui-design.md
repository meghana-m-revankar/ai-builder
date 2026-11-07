# UI Design Specification - Fleet Tracker

## 1. Dashboard (Main Overview)
- **Purpose**: At-a-glance status of the fleet.
- **Layout**: 
  - Top row: 4 KPI cards (Total Vans, Active, In Maintenance, Alerts).
  - Middle row: "Recent Maintenance" (table) and "Maintenance Costs" (chart).
  - Bottom row: "Fleet Health" heatmap/bento grid.
- **Actions**: Refresh data, Add Maintenance (CTA).

## 2. Fleet Management
- **Purpose**: List and edit van details.
- **Layout**: Data table with search, status filters (All, Active, Maintenance), and a list of vans.
- **Fields**: Plate, Status, Last Maintenance, Actions (View/Edit).
- **Actions**: Add New Van, Edit Status, Log Maintenance.

## 3. Maintenance Tracker
- **Purpose**: Logging and reporting maintenance activities.
- **Layout**: Split view: Form on left, History list on right.
- **Fields**: Van Select, Cost, Description, Date.
- **Actions**: Submit Maintenance, Export Report.

## 4. Reports
- **Purpose**: Fuel and operational insights.
- **Layout**: Date range picker followed by data visualization widgets.
