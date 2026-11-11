using Microsoft.EntityFrameworkCore;
using MeghanaPortfolio.Domain.Entities;

namespace MeghanaPortfolio.Infrastructure.Data;

public class MeghanaPortfolioDbContext : DbContext
{
    public MeghanaPortfolioDbContext(DbContextOptions<MeghanaPortfolioDbContext> options) : base(options) { }
    
    public DbSet<ContactSubmission> ContactSubmissions => Set<ContactSubmission>();
    public DbSet<Project> Projects => Set<Project>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfigurationsFromAssembly(typeof(MeghanaPortfolioDbContext).Assembly);
    }
}
