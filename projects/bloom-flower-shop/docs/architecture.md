# Bloom Flower Shop Architecture

## Overview
Bloom is a web-based e-commerce platform for a boutique flower shop. It provides a public-facing catalog for customers to browse bouquets and place orders, and an administrative dashboard for the shop owner to manage inventory and order fulfillment.

## Components & Modules
- **Bloom.Domain**: Business entities (Bouquet, Order) and business logic.
- **Bloom.Application**: CQRS handlers, validation, and interfaces.
- **Bloom.Infrastructure**: EF Core, PostgreSQL persistence.
- **Bloom.Api**: RESTful API to serve the web interface.
- **Bloom.Web**: Blazor Web App (Interactive Server) providing the UI.

## Folder Structure
```
src/
  Bloom.Domain/
  Bloom.Application/
  Bloom.Infrastructure/
  Bloom.Api/
  Bloom.Web/
tests/
  Bloom.UnitTests/
  Bloom.IntegrationTests/
```

## Data Entities
- **Bouquet**: id, name, description, price, image_url, is_active (bool).
- **Order**: id, customer_name, customer_phone, delivery_date, gift_message, status (New, Delivered), created_at.

## API Endpoints
- `GET /api/v1/bouquets` - List all bouquets.
- `POST /api/v1/bouquets` - Create/Update bouquet (Admin).
- `POST /api/v1/orders` - Place new order.
- `GET /api/v1/orders` - List orders (Admin).
- `PATCH /api/v1/orders/{id}/status` - Update order status (Admin).

## Design Decisions
- **Architecture**: Clean Architecture for separation of concerns.
- **UI**: Blazor Server for real-time interactivity. Tailwind CSS for elegant design (pink/white/green palette).
- **Database**: PostgreSQL with manual SQL scripts for schema control (no EF migrations).
