namespace Bloom.Application.Interfaces;

using Bloom.Domain.Entities;

public interface IBouquetRepository
{
    Task<IEnumerable<Bouquet>> GetAllAsync(CancellationToken ct);
    Task AddAsync(Bouquet bouquet, CancellationToken ct);
}
