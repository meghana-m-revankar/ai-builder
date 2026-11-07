using Microsoft.EntityFrameworkCore;
using GoldenCrust.Domain.Entities;

namespace GoldenCrust.Infrastructure.Persistence;

public class GoldenCrustDbContext : DbContext
{
    public GoldenCrustDbContext(DbContextOptions<GoldenCrustDbContext> options) : base(options) { }

    public DbSet<Product> Products => Set<Product>();
    public DbSet<PreOrder> PreOrders => Set<PreOrder>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Product>().ToTable("products");
        modelBuilder.Entity<PreOrder>().ToTable("pre_orders");
    }
}
