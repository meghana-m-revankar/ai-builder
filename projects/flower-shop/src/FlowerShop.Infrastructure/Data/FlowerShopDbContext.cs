using Microsoft.EntityFrameworkCore;
using FlowerShop.Domain.Entities;

namespace FlowerShop.Infrastructure.Data;

public class FlowerShopDbContext : DbContext
{
    public FlowerShopDbContext(DbContextOptions<FlowerShopDbContext> options) : base(options) { }
    public DbSet<Category> Categories => Set<Category>();
    public DbSet<Product> Products => Set<Product>();
}
