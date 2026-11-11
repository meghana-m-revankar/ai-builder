using MeghanaPortfolio.Application.Interfaces;
using MeghanaPortfolio.Domain.Entities;
using MeghanaPortfolio.Infrastructure.Data;

namespace MeghanaPortfolio.Infrastructure.Repositories;

public class ContactRepository(MeghanaDbContext context) : IContactRepository
{
    public async Task AddAsync(Contact contact, CancellationToken ct)
    {
        await context.Contacts.AddAsync(contact, ct);
        await context.SaveChangesAsync(ct);
    }
}