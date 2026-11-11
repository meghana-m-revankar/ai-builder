using Microsoft.AspNetCore.Mvc;
using MeghanaPortfolio.Application.DTOs;

namespace MeghanaPortfolio.Api.Controllers;

[ApiController]
[Route("api/v1/contacts")]
public class ContactController : ControllerBase
{
    [HttpPost]
    public async Task<IActionResult> Create([FromBody] CreateContactSubmissionDto dto)
    {
        // TODO: Call MediatR handler
        return CreatedAtAction(nameof(Create), new { id = Guid.NewGuid() }, dto);
    }
}
