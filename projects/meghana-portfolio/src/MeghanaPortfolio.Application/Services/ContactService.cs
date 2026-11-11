using MeghanaPortfolio.Application.DTOs;
using MeghanaPortfolio.Application.Interfaces;
using MeghanaPortfolio.Domain.Entities;

namespace MeghanaPortfolio.Application.Services;

public class ContactService(IContactRepository repository)
{
    public async Task<ContactResponse> CreateAsync(CreateContactRequest request, CancellationToken ct)
    {
        var contact = Contact.Create(request.FullName, request.Email, request.Message);
        await repository.AddAsync(contact, ct);
        return new ContactResponse(contact.Id, contact.FullName, contact.Email, contact.Message, contact.IsRead, contact.CreatedAt);
    }
}