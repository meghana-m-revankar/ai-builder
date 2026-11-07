using GoldenCrust.Domain.Entities;

namespace GoldenCrust.Application.DTOs;

public record ProductDto(Guid Id, string NameEn, string NameAr, string? DescriptionEn, string? DescriptionAr, decimal PriceAed, string Category, bool IsAvailable);
public record CreateOrderDto(string CustomerName, string Phone, Guid ProductId, int Quantity, DateTime PickupDate);
public record OrderDto(Guid Id, string CustomerName, string Phone, Guid ProductId, int Quantity, DateTime PickupDate, string Status);
