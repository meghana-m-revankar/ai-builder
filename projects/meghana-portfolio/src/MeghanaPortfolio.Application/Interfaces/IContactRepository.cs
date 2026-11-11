using MeghanaPortfolio.Domain.Entities;

namespace MeghanaPortfolio.Application.Interfaces;

public interface IContactRepository
{
    Task AddAsync(Contact contact, CancellationToken ct);
}