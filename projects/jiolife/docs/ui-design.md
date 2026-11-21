# UI Design & Architecture Document: JioLife

## Design System & Theme
- **Theme Palette**: Deep Purple (`#6D28D9` brand-700, `#EDE9FE` brand-100), Slate Dark (`#0F172A` ink-900), Canvas (`#F8FAFC`).
- **Typography**: Plus Jakarta Sans for headings, Inter for body text.
- **Icons**: Lucide icons throughout.
- **Framework**: Blazor Web App (Interactive Server) + Tailwind CSS via CDN.

---

## Page Inventory & Layout Specifications

### 1. Dashboard (`/`)
- **Purpose**: High-level overview of user health metrics, recent activities, and recommended wellness plans.
- **Layout**: Bento grid layout with 4 KPI summary cards (Steps, Calories, Active Minutes, Heart Rate), a recent activity feed table, and quick action banners.
- **Fields**: Metric values, trend indicators (+12% vs last week), activity list items with timestamps.
- **Actions**: "Log Activity", "View All Metrics", "Explore Plans".

### 2. Activities (`/activities`)
- **Purpose**: Manage and log fitness activities, view workout history and calorie burn trends.
- **Layout**: Split layout with a quick-add form on the left and a searchable, filterable activity history table on the right.
- **Fields**: Activity Type (Running, Yoga, Cycling, Gym), Duration (minutes), Calories Burned, Logged Date.
- **Actions**: Submit New Activity, Delete Activity, Filter by Date Range.

### 3. Wellness Plans (`/plans`)
- **Purpose**: Browse subscription and self-paced wellness plans curated by experts.
- **Layout**: 3-column card grid showcasing plan tiers (Basic, Pro, Elite) with feature checkmarks and pricing badges.
- **Fields**: Plan Title, Description, Category, Price, Duration.
- **Actions**: "Subscribe Now", "View Details".

### 4. Health Metrics (`/metrics`)
- **Purpose**: Track vital health records like weight, blood pressure, sleep hours, and water intake.
- **Layout**: Data table with inline charts and a floating "Record Metric" modal trigger.
- **Fields**: Metric Name, Metric Value, Recorded At timestamp.
- **Actions**: "Add Record", "Export Data".

### 5. Profile & Settings (`/profile`)
- **Purpose**: Manage personal account details and preferences.
- **Layout**: 2-column settings panel with avatar upload preview and form fields.
- **Fields**: First Name, Last Name, Email Address, Notification Preferences.
- **Actions**: "Save Changes", "Reset".
