using SmartRetail.Application.DTOs;
using SmartRetail.Application.Interfaces;
using SmartRetail.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;

namespace SmartRetail.Infrastructure.Repositories;

public class ProductRepository : IProductRepository
{
    private readonly SmartRetailDbContext _context;

    public ProductRepository(SmartRetailDbContext context)
    {
        _context = context;
    }

    public async Task<IEnumerable<ProductDto>> GetAllAsync(CancellationToken ct)
    {
        return await _context.Products
            .Select(p => new ProductDto(p.Id, p.Name, p.SKU, p.Price, p.StockQuantity))
            .ToListAsync(ct);
    }
}
