namespace Restriviz.Infrastructure.Data;

using Microsoft.EntityFrameworkCore;
using Restriviz.Domain.Entities;

public class RestrivizDbContext : DbContext
{
    public RestrivizDbContext(DbContextOptions<RestrivizDbContext> options) : base(options) { }

    public DbSet<Product> Products => Set<Product>();
    
    // TODO: Add other DbSets
}
