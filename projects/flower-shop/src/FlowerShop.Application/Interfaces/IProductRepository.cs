using FlowerShop.Application.DTOs;

namespace FlowerShop.Application.Interfaces;

public interface IProductRepository
{
    Task<IEnumerable<ProductDto>> GetAllFeaturedAsync(CancellationToken ct);
}
