namespace Portfolio.Application.Interfaces;

using Portfolio.Domain.Entities;

public interface IProjectRepository
{
    Task<IEnumerable<Project>> GetAllAsync(CancellationToken ct);
}
