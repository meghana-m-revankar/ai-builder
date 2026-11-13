using Microsoft.AspNetCore.Mvc;
using BookNook.Application.DTOs;

namespace BookNook.Api.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public class BooksController : ControllerBase
{
    [HttpGet]
    public IActionResult GetBooks()
    {
        // TODO: Call MediatR/Query
        return Ok(new List<BookDto>());
    }
}
