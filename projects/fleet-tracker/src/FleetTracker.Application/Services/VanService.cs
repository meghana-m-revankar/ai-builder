using FleetTracker.Application.DTOs;
using FleetTracker.Application.Interfaces;
using FleetTracker.Domain.Entities;

namespace FleetTracker.Application.Services;

public class VanService(IVanRepository repository)
{
    public async Task<IEnumerable<VanDto>> GetVansAsync(string? status)
    {
        VanStatus? filter = null;
        if (Enum.TryParse<VanStatus>(status, out var parsedStatus))
        {
            filter = parsedStatus;
        }

        var vans = await repository.GetAllAsync(filter);
        return vans.Select(v => new VanDto(v.Id, v.PlateNumber, v.Model, v.Status.ToString(), v.LastMaintenanceDate));
    }
}
