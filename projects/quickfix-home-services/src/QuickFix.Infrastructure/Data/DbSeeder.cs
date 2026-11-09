using Microsoft.EntityFrameworkCore;

namespace QuickFix.Infrastructure.Data;

public static class DbSeeder
{
    public static async Task SeedAsync(QuickFixDbContext context, CancellationToken ct)
    {
        if (await context.Bookings.AnyAsync(ct)) return;
        // Seed logic here
    }
}