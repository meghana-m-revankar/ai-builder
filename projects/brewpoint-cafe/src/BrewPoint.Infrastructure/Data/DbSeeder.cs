using Microsoft.EntityFrameworkCore;

namespace BrewPoint.Infrastructure.Data;

public static class DbSeeder
{
    public static async Task SeedAsync(BrewPointDbContext context, CancellationToken ct)
    {
        if (await context.Products.AnyAsync(ct)) return;
        // TODO: Insert real seed data here
    }
}
