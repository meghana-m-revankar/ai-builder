using Portfolio.Domain.Entities;

namespace Portfolio.Infrastructure.Data;

public static class DbSeeder
{
    public static async Task SeedAsync(PortfolioDbContext context, CancellationToken ct)
    {
        if (await context.Projects.AnyAsync(ct)) return;

        context.Projects.AddRange(
            new Project("Shopping Website", "A modern e-commerce platform.", new List<string> { "React", "Node.js" }),
            new Project("Business Dashboard", "Analytics dashboard for business.", new List<string> { "React", "TypeScript" }),
            new Project("Mobile App", "Cross-platform mobile application.", new List<string> { "Flutter" })
        );
        await context.SaveChangesAsync(ct);
    }
}
