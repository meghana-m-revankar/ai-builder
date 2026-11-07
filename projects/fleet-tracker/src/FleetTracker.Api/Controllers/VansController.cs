using Microsoft.AspNetCore.Mvc;
using FleetTracker.Application.Services;

namespace FleetTracker.Api.Controllers;

[ApiController]
[Route("api/v1/vans")]
public class VansController(VanService vanService) : ControllerBase
{
    [HttpGet]
    public async Task<IActionResult> Get([FromQuery] string? status)
    {
        var result = await vanService.GetVansAsync(status);
        return Ok(result);
    }
}
