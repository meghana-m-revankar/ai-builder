namespace MeghanaPortfolio.Application.Interfaces;

using MeghanaPortfolio.Domain.Entities;

public interface IContactRepository
{
    Task AddAsync(ContactSubmission submission, CancellationToken ct);
}
