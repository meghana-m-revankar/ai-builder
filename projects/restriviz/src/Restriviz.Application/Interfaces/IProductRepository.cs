using Restriviz.Domain.Entities;

namespace Restriviz.Application.Interfaces;

public interface IProductRepository
{
    Task<IEnumerable<Product>> GetAllAsync(CancellationToken ct);
}
