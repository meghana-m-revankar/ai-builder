using SunriseYoga.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace SunriseYoga.Infrastructure.Data;

public static class DbSeeder
{
    public static async Task SeedAsync(SunriseYogaDbContext context, CancellationToken ct)
    {
        if (await context.Instructors.AnyAsync(ct)) return;
        // TODO: Add demo data
    }
}
