using Microsoft.AspNetCore.Mvc;
using JioLife.Application.Interfaces;

namespace JioLife.Api.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public class ProfilesController : ControllerBase
{
    private readonly IUserProfileRepository _repository;

    public ProfilesController(IUserProfileRepository repository)
    {
        _repository = repository;
    }

    [HttpGet("{id}")]
    public async Task<IActionResult> Get(Guid id, CancellationToken ct)
    {
        var profile = await _repository.GetByIdAsync(id, ct);
        return profile == null ? NotFound() : Ok(profile);
    }
}
