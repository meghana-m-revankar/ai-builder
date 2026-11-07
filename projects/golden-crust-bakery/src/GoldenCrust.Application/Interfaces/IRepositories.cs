using GoldenCrust.Domain.Entities;

namespace GoldenCrust.Application.Interfaces;

public interface IProductRepository
{
    Task<IEnumerable<Product>> GetAllAsync();
}

public interface IOrderRepository
{
    Task<Order> CreateAsync(Order order);
    Task<IEnumerable<Order>> GetAllAsync();
    Task<Order?> GetByIdAsync(Guid id);
    Task UpdateAsync(Order order);
}
