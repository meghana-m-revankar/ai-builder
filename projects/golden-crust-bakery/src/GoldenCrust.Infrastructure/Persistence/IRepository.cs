using GoldenCrust.Domain.Entities;

namespace GoldenCrust.Infrastructure.Persistence;

public interface IRepository<T> where T : class
{
    Task<IEnumerable<T>> GetAllAsync();
    Task<T?> GetByIdAsync(Guid id);
    Task AddAsync(T entity);
    Task UpdateAsync(T entity);
}
