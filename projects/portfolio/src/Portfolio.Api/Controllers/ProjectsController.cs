using Microsoft.AspNetCore.Mvc;
using Portfolio.Application.DTOs;

namespace Portfolio.Api.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public class ProjectsController : ControllerBase
{
    [HttpGet]
    public ActionResult<IEnumerable<ProjectDto>> Get()
    {
        // TODO: Implement using MediatR/Handler
        return Ok(new List<ProjectDto>());
    }
}
