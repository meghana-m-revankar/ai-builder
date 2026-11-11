using SmartRetail.Application.DTOs;

namespace SmartRetail.Application.Interfaces;

public interface IProductRepository
{
    Task<IEnumerable<ProductDto>> GetAllAsync(CancellationToken ct);
}
