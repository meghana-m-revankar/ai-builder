using Microsoft.AspNetCore.Mvc;
using MediatR;
using SmartRetail.Application.Products.Queries;

namespace SmartRetail.Api.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public class ProductsController : ControllerBase
{
    private readonly IMediator _mediator;

    public ProductsController(IMediator mediator) => _mediator = mediator;

    [HttpGet]
    public async Task<IActionResult> GetAll(CancellationToken ct)
    {
        return Ok(await _mediator.Send(new GetProductsQuery(), ct));
    }
}
