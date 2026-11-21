namespace JioLife.Application.Interfaces;

using JioLife.Domain.Entities;

public interface IRepository<T> where T : class
{
    Task<T?> GetByIdAsync(Guid id, CancellationToken ct);
    Task AddAsync(T entity, CancellationToken ct);
}

public interface IUserProfileRepository : IRepository<UserProfile>
{
    Task<UserProfile?> GetByEmailAsync(string email, CancellationToken ct);
}
