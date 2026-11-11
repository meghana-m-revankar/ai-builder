using Microsoft.AspNetCore.Mvc;
using MeghanaPortfolio.Application.Interfaces;

namespace MeghanaPortfolio.Api.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public class ProjectsController : ControllerBase
{
    private readonly IProjectRepository _repository;

    public ProjectsController(IProjectRepository repository) => _repository = repository;

    [HttpGet]
    public async Task<IActionResult> GetAll(CancellationToken ct)
    {
        var projects = await _repository.GetAllAsync(ct);
        return Ok(projects);
    }
}
