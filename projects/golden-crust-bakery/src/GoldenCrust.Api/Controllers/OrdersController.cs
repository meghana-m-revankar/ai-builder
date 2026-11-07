using GoldenCrust.Application.DTOs;
using Microsoft.AspNetCore.Mvc;

namespace GoldenCrust.Api.Controllers;

[ApiController]
[Route("api/v1/orders")]
public class OrdersController : ControllerBase
{
    [HttpPost]
    public async Task<IActionResult> Create([FromBody] CreateOrderCommand command)
    {
        // TODO: Send command to mediator
        return CreatedAtAction(nameof(GetById), new { id = Guid.NewGuid() }, command);
    }

    [HttpGet("{id}")]
    public IActionResult GetById(Guid id) => Ok();
}
