using FleetTracker.Application.DTOs;
using FleetTracker.Domain.Entities;

namespace FleetTracker.Application.Interfaces;

public interface IVanRepository
{
    Task<IEnumerable<Van>> GetAllAsync(VanStatus? status = null);
}
