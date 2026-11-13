using GoldenCrust.Domain.Entities;

namespace GoldenCrust.Application.Interfaces;

public interface IProductRepository
{
    Task<IEnumerable<Product>> GetAllAsync(CancellationToken ct);
}
