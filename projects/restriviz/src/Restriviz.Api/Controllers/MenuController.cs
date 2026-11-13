using Microsoft.AspNetCore.Mvc;
using Restriviz.Application.Interfaces;

namespace Restriviz.Api.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public class MenuController : ControllerBase
{
    private readonly IProductRepository _repository;

    public MenuController(IProductRepository repository)
    {
        _repository = repository;
    }

    [HttpGet]
    public async Task<IActionResult> GetMenu(CancellationToken ct)
    {
        var products = await _repository.GetAllAsync(ct);
        return Ok(products); // Mapping to DTOs would happen here
    }
}
