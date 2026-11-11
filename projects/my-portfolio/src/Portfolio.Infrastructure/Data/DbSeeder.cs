namespace Portfolio.Infrastructure.Data;

using Portfolio.Domain.Entities;

public static class DbSeeder
{
    public static async Task SeedAsync(PortfolioDbContext context, CancellationToken ct)
    {
        if (await context.Projects.AnyAsync(ct)) return;

        context.Projects.AddRange(
            Project.Create("Project 1", "Description 1", null, null),
            Project.Create("Project 2", "Description 2", null, null)
        );
        await context.SaveChangesAsync(ct);
    }
}
