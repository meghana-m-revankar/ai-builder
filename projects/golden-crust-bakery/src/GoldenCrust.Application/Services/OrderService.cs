using GoldenCrust.Application.DTOs;
using GoldenCrust.Domain.Entities;
using GoldenCrust.Application.Interfaces;

namespace GoldenCrust.Application.Services;

public class OrderService
{
    private readonly IOrderRepository _orderRepository;

    public OrderService(IOrderRepository orderRepository) => _orderRepository = orderRepository;

    public async Task<OrderDto> CreateOrderAsync(CreateOrderDto dto)
    {
        // TODO: Validate business rules and map DTO to Entity
        var order = new Order { CustomerName = dto.CustomerName, Phone = dto.Phone, ProductId = dto.ProductId, Quantity = dto.Quantity, PickupDate = dto.PickupDate };
        var result = await _orderRepository.CreateAsync(order);
        return new OrderDto(result.Id, result.CustomerName, result.Phone, result.ProductId, result.Quantity, result.PickupDate, result.Status.ToString());
    }

    public async Task UpdateStatusAsync(Guid id, string status)
    {
        // TODO: Implement status update logic
    }
}
