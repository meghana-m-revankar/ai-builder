using Microsoft.EntityFrameworkCore;
using SunriseYoga.Domain.Entities;

namespace SunriseYoga.Infrastructure.Data;

public sealed class SunriseYogaDbContext : DbContext
{
    public SunriseYogaDbContext(DbContextOptions<SunriseYogaDbContext> options) : base(options) { }
    public DbSet<Instructor> Instructors => Set<Instructor>();
    // TODO: Add other DbSets
    
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfigurationsFromAssembly(typeof(SunriseYogaDbContext).Assembly);
    }
}
