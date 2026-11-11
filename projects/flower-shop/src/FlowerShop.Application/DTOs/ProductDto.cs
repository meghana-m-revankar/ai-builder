namespace FlowerShop.Application.DTOs;

public record ProductDto(Guid Id, string Name, decimal Price, string? Description, string ImageUrl);
