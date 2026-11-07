using GoldenCrust.Application.Services;
using Microsoft.AspNetCore.Mvc;

namespace GoldenCrust.Api.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public class ProductsController(IProductService productService) : ControllerBase
{
    [HttpGet]
    public async Task<IActionResult> GetProducts()
    {
        var products = await productService.GetAvailableProductsAsync();
        return Ok(products);
    }
}
