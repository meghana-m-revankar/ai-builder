using MeghanaPortfolio.Domain.Entities;

namespace MeghanaPortfolio.Application.Interfaces;

public interface IContactRepository
{
    Task AddAsync(ContactSubmission submission, CancellationToken ct);
}
