using GoldenCrust.Domain.Entities;

namespace GoldenCrust.Application.Interfaces;

public interface IOrderRepository
{
    Task AddAsync(PreOrder order, CancellationToken ct);
    Task<IEnumerable<PreOrder>> GetAllAsync(CancellationToken ct);
}
