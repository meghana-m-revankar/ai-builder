using Microsoft.AspNetCore.Mvc;

namespace PrintCraft.Api.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public class ProductsController : ControllerBase
{
    [HttpGet]
    public async Task<IActionResult> GetAll(CancellationToken ct)
    {
        // TODO: Call Application use case
        return Ok(new List<object>());
    }

    [HttpGet("{id:guid}")]
    public async Task<IActionResult> GetById(Guid id, CancellationToken ct)
    {
        // TODO: Call Application use case
        return Ok();
    }
}
