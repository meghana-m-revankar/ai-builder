using Microsoft.AspNetCore.Mvc;
using MeghanaPortfolio.Application.DTOs;
using MeghanaPortfolio.Application.Interfaces;
using MeghanaPortfolio.Domain.Entities;

namespace MeghanaPortfolio.Api.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public class ContactController : ControllerBase
{
    private readonly IContactRepository _repository;

    public ContactController(IContactRepository repository) => _repository = repository;

    [HttpPost]
    public async Task<IActionResult> Create([FromBody] ContactSubmissionDto dto, CancellationToken ct)
    {
        var submission = new ContactSubmission(dto.FullName, dto.Email, dto.Subject, dto.Message);
        await _repository.AddAsync(submission, ct);
        return CreatedAtAction(nameof(Create), new { id = submission.Id }, submission);
    }
}
