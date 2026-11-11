using MeghanaPortfolio.Domain.Entities;
using MeghanaPortfolio.Infrastructure.Data;

namespace MeghanaPortfolio.Infrastructure.Data;

public static class DbSeeder
{
    public static async Task SeedAsync(MeghanaPortfolioDbContext context, CancellationToken ct)
    {
        if (await context.Projects.AnyAsync(ct)) return;

        context.Projects.AddRange(
            new Project("Portfolio Website", "Personal site using Tailwind CSS", new[] { "HTML", "Tailwind", "JS" }, 1),
            new Project("E-commerce App", "Full stack shop", new[] { "C#", "ASP.NET", "PostgreSQL" }, 2)
        );
        await context.SaveChangesAsync(ct);
    }
}
