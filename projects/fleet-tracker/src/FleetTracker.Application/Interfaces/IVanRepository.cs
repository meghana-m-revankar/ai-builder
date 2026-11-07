using FleetTracker.Application.DTOs;

namespace FleetTracker.Application.Interfaces;

public interface IVanRepository
{
    Task<IEnumerable<VanDto>> GetAllAsync(CancellationToken ct);
}
