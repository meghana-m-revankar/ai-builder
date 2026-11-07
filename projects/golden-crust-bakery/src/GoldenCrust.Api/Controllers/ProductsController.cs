using Microsoft.AspNetCore.Mvc;
using GoldenCrust.Application.Interfaces;

namespace GoldenCrust.Api.Controllers;

[ApiController]
[Route("api/v1/products")]
public class ProductsController : ControllerBase
{
    private readonly IProductRepository _repository;

    public ProductsController(IProductRepository repository) => _repository = repository;

    [HttpGet]
    public async Task<IActionResult> Get(CancellationToken ct)
    {
        var products = await _repository.GetAllAsync(ct);
        return Ok(products);
    }
}
