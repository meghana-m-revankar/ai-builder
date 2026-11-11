using MeghanaPortfolio.Domain.Entities;

namespace MeghanaPortfolio.Application.Interfaces;

public interface IProjectRepository
{
    Task<IEnumerable<Project>> GetAllAsync(CancellationToken ct);
}
