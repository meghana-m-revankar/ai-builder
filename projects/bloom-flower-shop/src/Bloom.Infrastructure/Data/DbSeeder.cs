using Microsoft.EntityFrameworkCore;
using Bloom.Domain.Entities;

namespace Bloom.Infrastructure.Data;

public static class DbSeeder
{
    public static async Task SeedAsync(BloomDbContext context, CancellationToken ct)
    {
        if (await context.Bouquets.AnyAsync(ct)) return;

        context.Bouquets.AddRange(new[]
        {
            new Bouquet(Guid.NewGuid(), "Classic Rose Bunch", "Elegant red roses.", 150m, "https://picsum.photos/seed/rose/400/300"),
            new Bouquet(Guid.NewGuid(), "Spring Tulips", "Colorful spring flowers.", 120m, "https://picsum.photos/seed/tulips/400/300")
        });
        await context.SaveChangesAsync(ct);
    }
}
