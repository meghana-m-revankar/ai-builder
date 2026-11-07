using GoldenCrust.Application.Interfaces;
using GoldenCrust.Domain.Entities;
using GoldenCrust.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;

namespace GoldenCrust.Infrastructure.Repositories;

public class ProductRepository : IProductRepository
{
    private readonly GoldenCrustDbContext _context;
    public ProductRepository(GoldenCrustDbContext context) => _context = context;

    public async Task<IEnumerable<Product>> GetAllAsync(CancellationToken ct) => 
        await _context.Products.AsNoTracking().ToListAsync(ct);
}
