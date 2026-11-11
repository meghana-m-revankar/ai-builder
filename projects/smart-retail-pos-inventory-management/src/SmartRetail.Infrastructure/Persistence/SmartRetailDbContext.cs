using Microsoft.EntityFrameworkCore;
using SmartRetail.Domain.Entities;

namespace SmartRetail.Infrastructure.Persistence;

public class SmartRetailDbContext : DbContext
{
    public SmartRetailDbContext(DbContextOptions<SmartRetailDbContext> options) : base(options) { }

    public DbSet<Product> Products => Set<Product>();
    public DbSet<Order> Orders => Set<Order>();
    public DbSet<OrderItem> OrderItems => Set<OrderItem>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfigurationsFromAssembly(typeof(SmartRetailDbContext).Assembly);
    }
}
