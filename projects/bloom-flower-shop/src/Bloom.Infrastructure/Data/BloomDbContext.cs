using Microsoft.EntityFrameworkCore;
using Bloom.Domain.Entities;

namespace Bloom.Infrastructure.Data;

public class BloomDbContext : DbContext
{
    public BloomDbContext(DbContextOptions<BloomDbContext> options) : base(options) { }
    
    public DbSet<Bouquet> Bouquets => Set<Bouquet>();
    public DbSet<Order> Orders => Set<Order>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfigurationsFromAssembly(typeof(BloomDbContext).Assembly);
    }
}
