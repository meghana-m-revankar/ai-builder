using Microsoft.EntityFrameworkCore;
using GoldenCrust.Infrastructure.Persistence;
using GoldenCrust.Domain.Entities;

namespace GoldenCrust.Infrastructure.Data;

public class DbSeeder
{
    public static async Task SeedAsync(GoldenCrustDbContext context, CancellationToken ct)
    {
        if (await context.Products.AnyAsync(ct)) return;

        var p1 = new Product(Guid.NewGuid(), "Sourdough", "خبز العجين", 28m);
        var p2 = new Product(Guid.NewGuid(), "Croissant", "كرواسون", 22m);
        
        context.Products.AddRange(p1, p2);
        await context.SaveChangesAsync(ct);
    }
}
