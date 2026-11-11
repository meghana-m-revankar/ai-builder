namespace PrintCraft.Application.DTOs;

public record ProductDto(Guid Id, string Name, string Category, decimal BasePrice, string Currency, string? Description, int Stock, string? ImageUrl);
