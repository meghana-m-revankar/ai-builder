using Microsoft.AspNetCore.Mvc;
using GoldenCrust.Application.DTOs;
using GoldenCrust.Application.Services;

namespace GoldenCrust.Api.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public class OrdersController : ControllerBase
{
    private readonly OrderService _orderService;

    public OrdersController(OrderService orderService) => _orderService = orderService;

    [HttpPost]
    public async Task<IActionResult> Create(CreateOrderDto dto)
    {
        var result = await _orderService.CreateOrderAsync(dto);
        return Ok(result);
    }

    [HttpGet]
    public async Task<IActionResult> GetAll()
    {
        // TODO: Auth (Admin only)
        return Ok();
    }

    [HttpPatch("{id}/status")]
    public async Task<IActionResult> UpdateStatus(Guid id, [FromBody] string status)
    {
        await _orderService.UpdateStatusAsync(id, status);
        return NoContent();
    }
}
