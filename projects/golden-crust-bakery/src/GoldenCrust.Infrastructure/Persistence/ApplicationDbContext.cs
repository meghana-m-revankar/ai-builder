using GoldenCrust.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoldenCrust.Infrastructure.Persistence;

public class ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : DbContext(options)
{
    public DbSet<Product> Products => Set<Product>();
    public DbSet<Order> Orders => Set<Order>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Order>().Property(o => o.Status).HasConversion<string>();
    }
}
