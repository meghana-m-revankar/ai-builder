namespace GoldenCrust.Application.DTOs;

public record ProductDto(Guid Id, string Name, string Sku, decimal Price, int StockQuantity);
