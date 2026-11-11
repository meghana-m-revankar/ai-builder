using Microsoft.EntityFrameworkCore;
using BrewPoint.Domain.Entities;

namespace BrewPoint.Infrastructure.Data;

public class BrewPointDbContext : DbContext
{
    public BrewPointDbContext(DbContextOptions<BrewPointDbContext> options) : base(options) { }
    public DbSet<Product> Products { get; set; } = default!;
}
