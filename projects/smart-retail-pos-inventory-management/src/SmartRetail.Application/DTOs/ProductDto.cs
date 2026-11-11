namespace SmartRetail.Application.DTOs;

public record ProductDto(Guid Id, string Name, string SKU, decimal Price, int StockQuantity);
