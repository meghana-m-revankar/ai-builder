using MeghanaPortfolio.Application.DTOs;
using MeghanaPortfolio.Application.Services;
using Microsoft.AspNetCore.Mvc;

namespace MeghanaPortfolio.Api.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public class ContactsController(ContactService contactService) : ControllerBase
{
    [HttpPost]
    public async Task<ActionResult<ContactResponse>> Create([FromBody] CreateContactRequest request, CancellationToken ct)
    {
        var result = await contactService.CreateAsync(request, ct);
        return CreatedAtAction(nameof(Create), new { id = result.Id }, result);
    }
}