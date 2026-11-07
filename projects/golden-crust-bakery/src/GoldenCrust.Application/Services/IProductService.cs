using GoldenCrust.Application.DTOs;

namespace GoldenCrust.Application.Services;

public interface IProductService
{
    Task<IEnumerable<ProductDto>> GetAvailableProductsAsync();
}
