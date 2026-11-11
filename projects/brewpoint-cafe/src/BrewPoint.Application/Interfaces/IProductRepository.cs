using BrewPoint.Application.DTOs;

namespace BrewPoint.Application.Interfaces;

public interface IProductRepository
{
    Task<IEnumerable<ProductDto>> GetAllAsync(CancellationToken ct);
}
