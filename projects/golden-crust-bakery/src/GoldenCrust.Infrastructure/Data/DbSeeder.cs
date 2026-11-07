using GoldenCrust.Infrastructure.Persistence;

namespace GoldenCrust.Infrastructure.Data;

public class DbSeeder(ApplicationDbContext context)
{
    public async Task SeedAsync(CancellationToken ct)
    {
        if (await context.Products.AnyAsync(ct)) return;
        
        // TODO: Add initial seed data (Products)
        await context.SaveChangesAsync(ct);
    }
}
