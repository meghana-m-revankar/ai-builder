namespace GoldenCrust.Application.DTOs;

public record ProductDto(Guid Id, string Name, string? Description, decimal Price, string Currency, bool IsSpecial);
