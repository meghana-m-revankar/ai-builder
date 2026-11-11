using Microsoft.AspNetCore.Mvc;

namespace BrewPoint.Api.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public class ProductsController : ControllerBase
{
    [HttpGet]
    public IActionResult GetProducts()
    {
        // TODO: Call Application service
        return Ok(new[] { new { Name = "Coffee" } });
    }
}
