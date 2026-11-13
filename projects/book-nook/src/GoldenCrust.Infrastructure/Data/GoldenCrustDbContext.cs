using Microsoft.EntityFrameworkCore;
using GoldenCrust.Domain.Entities;

namespace GoldenCrust.Infrastructure.Data;

public class GoldenCrustDbContext : DbContext
{
    public GoldenCrustDbContext(DbContextOptions<GoldenCrustDbContext> options) : base(options) { }
    
    public DbSet<Product> Products => Set<Product>();
    
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder;
        // Configuration here
    }
}
