namespace GoldenCrust.Application.DTOs;

public record ProductDto(Guid Id, string NameEn, string NameAr, decimal Price, string ImageUrl);
