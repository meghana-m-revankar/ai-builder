namespace GoldenCrust.Application.DTOs;

public record ProductDto(Guid Id, string NameEn, string NameAr, string? Description, decimal Price, bool IsDailySpecial, bool IsBestseller);
