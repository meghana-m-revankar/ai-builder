namespace Bloom.Application.DTOs;

public record BouquetDto(Guid Id, string Name, string? Description, decimal Price, string? ImageUrl, bool IsActive);
