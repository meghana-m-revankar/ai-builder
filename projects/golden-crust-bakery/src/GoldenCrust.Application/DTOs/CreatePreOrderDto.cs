namespace GoldenCrust.Application.DTOs;

public record CreatePreOrderDto(Guid ProductId, string CustomerName, string Phone, int Quantity, DateTime PickupDate);
