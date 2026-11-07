using GoldenCrust.Domain.Entities;

namespace GoldenCrust.Application.Interfaces;

public interface IOrderRepository
{
    Task<Order> AddAsync(Order order, CancellationToken ct);
    Task<IEnumerable<Order>> GetAllAsync(CancellationToken ct);
}
