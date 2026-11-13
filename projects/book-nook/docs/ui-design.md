# UI Design Document: Book Nook

## Design System & Theme
- **Theme Name**: Book Nook Library SaaS (Sunrise School, Pune)
- **Primary Color (brand-700)**: `#1E3A8A` (Indigo Blue)
- **Accent Color (accent-500)**: `#F97316` (Warm Orange)
- **Canvas / Background**: `#F6F7FB`
- **Surface**: `#FFFFFF`
- **Typography**: Plus Jakarta Sans (Headings), Inter (Body), JetBrains Mono (ISBN / Numbers)
- **Icon Pack**: Lucide Icons (`data-lucide`)

---

## Screen Inventory

1. **Dashboard (`/`)**
   - **Purpose**: Overview of library statistics, quick metrics, and recent book issues.
   - **Layout**: Top header metrics bento cards (Total Books, Members, Active Loans, Overdue Fines) followed by a 2-column grid showing recent loans and quick action shortcuts.
   - **Fields/Metrics**: Stat values, trend indicators, overdue count.
   - **Actions**: Quick link to issue book, view overdue, or search books.

2. **Books Management (`/books`)**
   - **Purpose**: Comprehensive catalogue of library books with inventory tracking.
   - **Layout**: Top action bar with search input and "Add New Book" button. Responsive data table with columns for Title, Author, Category, ISBN, and Available Copies.
   - **Fields**: Title, Author, Category, ISBN, Total Copies, Available Copies.
   - **Actions**: Search, Filter by category, Add Book modal/form, Edit Book, Delete Book.

3. **Members Management (`/members`)**
   - **Purpose**: Manage student and staff library membership records.
   - **Layout**: Top action bar with search and "Add Member" button. Table or card grid displaying member details.
   - **Fields**: Name, Class/Grade, Phone, Email, Joined Date.
   - **Actions**: Add Member, Edit Member, View Member Loans.

4. **Loans & Circulation (`/loans`)**
   - **Purpose**: Track book checkouts, returns, and circulation history.
   - **Layout**: Tabbed or filtered views for Active Loans, Overdue Loans, and History. Action buttons for issuing books.
   - **Fields**: Book Title, Member Name, Issue Date, Due Date, Return Date, Fine Amount.
   - **Actions**: Issue New Book modal, Return Book action button (calculates fines automatically).

5. **Overdue & Fines (`/overdue`)**
   - **Purpose**: Focused view on overdue books and pending fine collections for librarian follow-ups.
   - **Layout**: Alert banner highlighting total overdue items, data table listing overdue loans with days late and computed fine (₹5/day).
   - **Fields**: Book Title, Member Name & Phone, Due Date, Days Overdue, Fine (₹).
   - **Actions**: Send Reminder (simulation), Return & Collect Fine.
