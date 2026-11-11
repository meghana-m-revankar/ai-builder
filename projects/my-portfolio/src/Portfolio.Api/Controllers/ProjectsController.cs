namespace Portfolio.Api.Controllers;

using Microsoft.AspNetCore.Mvc;
using Portfolio.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

[ApiController]
[Route("api/v1/[controller]")]
public class ProjectsController(PortfolioDbContext context) : ControllerBase
{
    [HttpGet]
    public async Task<IActionResult> GetAll(CancellationToken ct)
    {
        var projects = await context.Projects.ToListAsync(ct);
        return Ok(projects);
    }
}
