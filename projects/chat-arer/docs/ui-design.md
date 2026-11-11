# UI Design - Chat Arer

## Overview
Chat Arer follows a modern, clean, WhatsApp-inspired design. It is optimized for both mobile and desktop screens, providing a seamless messaging experience.

## Page: Main Chat Interface (`index.html`)

### Purpose
The primary hub for users to view their contact list and interact with ongoing conversations.

### Layout
- **Mobile**: Single column view. Toggling between the contact list and chat window is handled via navigation tabs or clicking a contact.
- **Desktop (>= 1024px)**: Master-detail view. Left sidebar (350px) for contact list, right area (remaining space) for the active chat window.

### Components

#### 1. Sidebar (Contact List)
- **Header**: User profile avatar, status icons (New chat, menu).
- **Search**: Input field with search icon for filtering conversations.
- **Pinned Chats**: Horizontal row of small avatar bubbles for high-priority contacts.
- **Conversation List**: Vertical scrollable list. Each item includes:
    - Profile picture (48px)
    - Name (Bold)
    - Timestamp (Small font, JetBrains Mono)
    - Last message preview (Truncated text)
    - Unread message count badge (if applicable)

#### 2. Chat Window
- **Header**: Active contact info (Name, status, profile image), search/call/video icons.
- **Message Area**:
    - Scrollable background (light grey).
    - Message bubbles: Left-aligned (received), Right-aligned (sent, brand-700/brand-100).
    - Status indicators (single/double ticks).
- **Input Footer**:
    - Attachment button (plus icon).
    - Text area (multi-line capable).
    - Emoji picker trigger.
    - Send button (brand-700).

### Navigation
- **Mobile Footer Tabs**:
    - Chats (active)
    - Status
    - Settings

### Interactions
- Clicking a contact in the list loads their conversation into the main window.
- Hover effects on list items.
- "Send" button simulates message rendering in the bubble stream.
