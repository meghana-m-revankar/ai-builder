using FleetTracker.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace FleetTracker.Infrastructure.Persistence;

public sealed class FleetDbContext : DbContext
{
    public DbSet<Van> Vans => Set<Van>();

    public FleetDbContext(DbContextOptions<FleetDbContext> options) : base(options) { }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Van>().ToTable("vans");
        modelBuilder.Entity<Van>().HasKey(v => v.Id);
    }
}
