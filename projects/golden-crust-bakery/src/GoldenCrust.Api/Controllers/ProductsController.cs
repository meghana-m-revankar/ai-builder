using Microsoft.AspNetCore.Mvc;

namespace GoldenCrust.Api.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public class ProductsController : ControllerBase
{
    [HttpGet]
    public IActionResult GetAll() => Ok(new List<object>()); // TODO: Integrate MediatR
}
