# 03 Architecture - Golden Crust Bakery

## Overview
Golden Crust Bakery is a dual-language (English/Arabic) artisan bakery website in Dubai. It enables customers to view the menu, read the bakery story, and submit pre-order requests. The Admin dashboard allows management of pre-orders.

## Modules/Components
- **Api**: RESTful backend (ASP.NET Core 8) for order management and content retrieval.
- **Application**: Business logic (CQRS pattern, validation, pre-order orchestration).
- **Domain**: Entities (Product, Order, Testimonial, DailySpecial), Value Objects.
- **Infrastructure**: PostgreSQL persistence using EF Core.
- **Web (Blazor)**: Server-side Blazor UI with localization support.

## Folder Structure
```
src/
  GoldenCrust.Domain/
  GoldenCrust.Application/
  GoldenCrust.Infrastructure/
  GoldenCrust.Api/
  GoldenCrust.Web/
tests/
  GoldenCrust.UnitTests/
  GoldenCrust.IntegrationTests/
```

## Data Entities
- **Product**: `id`, `name_en`, `name_ar`, `price_aed`, `is_best_seller`, `created_at`.
- **Order**: `id`, `customer_name`, `phone`, `product_id`, `quantity`, `pickup_date`, `status`, `created_at`.
- **Testimonial**: `id`, `customer_name`, `content`, `rating`.

## API Endpoints
- `GET /api/v1/products` - List products.
- `POST /api/v1/orders` - Create pre-order (Idempotent).
- `GET /api/v1/orders` - Admin list of orders (Authenticated).

## Key Design Decisions
- **Localization**: Use `IStringLocalizer` for English/Arabic support.
- **Styling**: Warm/Premium theme using Tailwind CSS.
- **Timezone**: All business logic uses `TimeProvider` with UTC; displayed times converted to GST at the UI layer.
