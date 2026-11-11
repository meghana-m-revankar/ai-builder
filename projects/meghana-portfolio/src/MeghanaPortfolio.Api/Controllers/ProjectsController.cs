using Microsoft.AspNetCore.Mvc;
using MeghanaPortfolio.Application.Interfaces;

namespace MeghanaPortfolio.Api.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public class ProjectsController : ControllerBase
{
    private readonly IProjectRepository _repo;
    public ProjectsController(IProjectRepository repo) => _repo = repo;

    [HttpGet]
    public async Task<IActionResult> GetAll(CancellationToken ct) => Ok(await _repo.GetAllAsync(ct));
}
