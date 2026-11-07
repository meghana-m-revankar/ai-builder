namespace GoldenCrust.Application.DTOs;

public record ProductDto(Guid Id, string NameEn, string NameAr, decimal PriceAed, bool IsBestSeller);

public record CreateOrderCommand(string CustomerName, string Phone, Guid ProductId, int Quantity, DateTime PickupDate);

public record OrderDto(Guid Id, string CustomerName, string Phone, Guid ProductId, int Quantity, DateTime PickupDate, string Status);
