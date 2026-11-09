using Microsoft.AspNetCore.Mvc;

namespace PulseFitness.Api.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public class BookingsController : ControllerBase
{
    [HttpPost]
    public async Task<IActionResult> CreateBooking()
    {
        // TODO: Integrate MediatR
        return CreatedAtAction(nameof(CreateBooking), new { id = Guid.NewGuid() }, null);
    }
}