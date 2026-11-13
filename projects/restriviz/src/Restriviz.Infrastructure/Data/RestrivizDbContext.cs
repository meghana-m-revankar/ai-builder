using Microsoft.EntityFrameworkCore;
using Restriviz.Domain.Entities;

namespace Restriviz.Infrastructure.Data;

public class RestrivizDbContext : DbContext
{
    public RestrivizDbContext(DbContextOptions<RestrivizDbContext> options) : base(options) { }

    public DbSet<Product> Products => Set<Product>();
    // Other sets...
}
