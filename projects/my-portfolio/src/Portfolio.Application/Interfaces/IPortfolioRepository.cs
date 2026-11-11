namespace Portfolio.Application.Interfaces;

using Portfolio.Domain.Entities;

public interface IPortfolioRepository
{
    Task<List<Project>> GetAllProjectsAsync(CancellationToken ct);
}
