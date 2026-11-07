using GoldenCrust.Application.DTOs;
using GoldenCrust.Infrastructure.Persistence;

namespace GoldenCrust.Application.Services;

public class ProductService(IRepository<Domain.Entities.Product> repository) : IProductService
{
    public async Task<IEnumerable<ProductDto>> GetAvailableProductsAsync()
    {
        var products = await repository.GetAllAsync();
        return products.Select(p => new ProductDto(p.Id, p.NameEn, p.NameAr, p.Price, p.ImageUrl ?? ""));
    }
}
