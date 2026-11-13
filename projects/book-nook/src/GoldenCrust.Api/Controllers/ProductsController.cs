using Microsoft.AspNetCore.Mvc;
using GoldenCrust.Application.Interfaces;

namespace GoldenCrust.Api.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public class ProductsController : ControllerBase
{
    private readonly IProductRepository _repository;
    public ProductsController(IProductRepository repository) => _repository = repository;

    [HttpGet]
    public async Task<IActionResult> GetAll(CancellationToken ct) => 
        Ok(await _repository.GetAllAsync(ct));
}
