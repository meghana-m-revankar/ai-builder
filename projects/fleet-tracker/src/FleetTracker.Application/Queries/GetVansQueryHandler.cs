using FleetTracker.Application.DTOs;
using FleetTracker.Application.Interfaces;

namespace FleetTracker.Application.Queries;

public sealed class GetVansQueryHandler
{
    private readonly IVanRepository _repository;

    public GetVansQueryHandler(IVanRepository repository)
    {
        _repository = repository;
    }

    public async Task<IEnumerable<VanDto>> HandleAsync(CancellationToken ct)
    {
        return await _repository.GetAllAsync(ct);
    }
}
