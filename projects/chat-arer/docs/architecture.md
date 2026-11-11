# Chat Arer Architecture

## Overview
Chat Arer is a real-time messaging application designed with a familiar WhatsApp-like user interface. The project utilizes a clean, static frontend stack focusing on responsiveness and ease of use.

## Design Decisions
- **UI Paradigm**: Single-column view on mobile, master-detail (contact list + chat window) on desktop.
- **Styling**: Tailwind CSS via CDN for rapid development and consistent design tokens.
- **Interactivity**: Simulated via JavaScript (mocking backend responses) to maintain the static deployment model.
- **Icons**: Heroicons (via CDN) to match the modern, clean aesthetic.

## Folder Structure
```
/
├── index.html          # Entry point (Main Chat Interface)
├── css/
│   └── app.css         # Custom overrides and component classes
├── js/
│   ├── app.js          # Core UI interaction logic
│   └── mockData.js     # Simulated conversation data
├── images/             # Profile pictures and assets
└── README.md
```

## UI Components & Pages
- **Sidebar (Contact List)**: Search bar, pinned chats, and scrollable list of recent conversations with timestamps and message previews.
- **Chat Window (Main View)**: Header with contact info/status, scrollable message area (bubble styling), and a fixed footer input area (text field, emoji picker, send button).
- **Navigation**: Minimalistic tab bar for mobile to switch between Chats, Status, and Settings.

## Non-Functional Requirements
- **Performance**: Instant load times via static asset hosting.
- **Accessibility**: Semantic HTML5 tags and high-contrast color palette.
- **Responsiveness**: Mobile-first design using Tailwind's grid/flexbox utilities.
