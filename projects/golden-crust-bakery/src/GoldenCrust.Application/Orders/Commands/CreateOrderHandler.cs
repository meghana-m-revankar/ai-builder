using GoldenCrust.Application.DTOs;
using GoldenCrust.Application.Interfaces;
using GoldenCrust.Domain.Entities;
using MediatR;

namespace GoldenCrust.Application.Orders.Commands;

public class CreateOrderHandler(IOrderRepository orderRepository, TimeProvider timeProvider) 
    : IRequestHandler<CreateOrderCommand, OrderDto>
{
    public async Task<OrderDto> Handle(CreateOrderCommand request, CancellationToken ct)
    {
        var order = new Order(Guid.NewGuid(), request.CustomerName, request.Phone, request.ProductId, request.Quantity, request.PickupDate, timeProvider.GetUtcNow().DateTime);
        
        // TODO: Validate Product existence, Business rules (e.g. min/max qty)
        
        await orderRepository.AddAsync(order, ct);
        
        return new OrderDto(order.Id, order.CustomerName, order.Phone, order.ProductId, order.Quantity, order.PickupDate, order.Status.ToString());
    }
}
