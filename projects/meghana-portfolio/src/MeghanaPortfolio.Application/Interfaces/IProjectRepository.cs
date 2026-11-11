namespace MeghanaPortfolio.Application.Interfaces;

public interface IProjectRepository
{
    Task<IEnumerable<Domain.Entities.Project>> GetAllAsync(CancellationToken ct);
}
