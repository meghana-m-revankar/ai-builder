namespace BrewPoint.Application.DTOs;

public record ProductDto(Guid Id, string Name, string Category, decimal Price, int StockQuantity);
