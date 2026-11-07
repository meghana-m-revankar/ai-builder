using Microsoft.AspNetCore.Mvc;
using FleetTracker.Application.Queries;

namespace FleetTracker.Api.Controllers;

[ApiController]
[Route("api/v1/vans")]
public sealed class VansController : ControllerBase
{
    private readonly GetVansQueryHandler _handler;

    public VansController(GetVansQueryHandler handler)
    {
        _handler = handler;
    }

    [HttpGet]
    public async Task<IActionResult> GetAll(CancellationToken ct)
    {
        var result = await _handler.HandleAsync(ct);
        return Ok(result);
    }
}
