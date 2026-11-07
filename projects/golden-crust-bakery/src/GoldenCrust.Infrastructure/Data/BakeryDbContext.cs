using Microsoft.EntityFrameworkCore;
using GoldenCrust.Domain.Entities;

namespace GoldenCrust.Infrastructure.Data;

public class BakeryDbContext : DbContext
{
    public BakeryDbContext(DbContextOptions<BakeryDbContext> options) : base(options) { }

    public DbSet<Product> Products => Set<Product>();
    public DbSet<Order> Orders => Set<Order>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Product>().ToTable("products");
        modelBuilder.Entity<Order>().ToTable("orders");
        // TODO: Map Enums and constraints
    }
}
