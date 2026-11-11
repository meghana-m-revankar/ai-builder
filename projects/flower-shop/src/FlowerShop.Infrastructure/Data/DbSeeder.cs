using FlowerShop.Infrastructure.Data;
using FlowerShop.Domain.Entities;

namespace FlowerShop.Infrastructure.Data;

public static class DbSeeder
{
    public static async Task SeedAsync(FlowerShopDbContext context, CancellationToken ct)
    {
        if (await context.Categories.AnyAsync(ct)) return;
        
        var cat = new Category("Occasions", "Beautiful flowers for every event.");
        context.Categories.Add(cat);
        context.Products.Add(new Product(cat.Id, "Red Roses", 99.00m, 10) { IsFeatured = true });
        
        await context.SaveChangesAsync(ct);
    }
}
