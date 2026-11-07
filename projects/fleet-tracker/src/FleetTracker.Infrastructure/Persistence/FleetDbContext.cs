using Microsoft.EntityFrameworkCore;
using FleetTracker.Domain.Entities;
using FleetTracker.Application.Interfaces;

namespace FleetTracker.Infrastructure.Persistence;

public class FleetDbContext : DbContext
{
    public FleetDbContext(DbContextOptions<FleetDbContext> options) : base(options) { }
    public DbSet<Van> Vans => Set<Van>();
    // TODO: Add other DbSets
}

public class VanRepository(FleetDbContext context) : IVanRepository
{
    public async Task<IEnumerable<Van>> GetAllAsync(VanStatus? status = null)
    {
        var query = context.Vans.AsQueryable();
        if (status.HasValue)
        {
            query = query.Where(v => v.Status == status.Value);
        }
        return await query.ToListAsync();
    }
}
