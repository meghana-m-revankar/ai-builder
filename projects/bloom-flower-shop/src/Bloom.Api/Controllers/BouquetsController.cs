using Microsoft.AspNetCore.Mvc;
using Bloom.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace Bloom.Api.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public class BouquetsController : ControllerBase
{
    private readonly BloomDbContext _context;

    public BouquetsController(BloomDbContext context) => _context = context;

    [HttpGet]
    public async Task<IActionResult> GetAll(CancellationToken ct)
    {
        return Ok(await _context.Bouquets.ToListAsync(ct));
    }
}
