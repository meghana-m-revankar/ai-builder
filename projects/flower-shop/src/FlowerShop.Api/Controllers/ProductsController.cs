using Microsoft.AspNetCore.Mvc;

namespace FlowerShop.Api.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public class ProductsController : ControllerBase
{
    [HttpGet("featured")]
    public IActionResult GetFeatured() => Ok(new[] { new { Id = Guid.NewGuid(), Name = "Red Roses" } });
}
