using FleetTracker.Application.DTOs;
using FleetTracker.Application.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace FleetTracker.Infrastructure.Persistence;

public sealed class VanRepository : IVanRepository
{
    private readonly FleetDbContext _context;

    public VanRepository(FleetDbContext context)
    {
        _context = context;
    }

    public async Task<IEnumerable<VanDto>> GetAllAsync(CancellationToken ct)
    {
        return await _context.Vans
            .Select(v => new VanDto(v.Id, v.Plate, v.Status, v.LastMaintenanceDate))
            .ToListAsync(ct);
    }
}
