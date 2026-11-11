using Microsoft.EntityFrameworkCore;
using PrintCraft.Domain.Entities;

namespace PrintCraft.Infrastructure.Data;

public sealed class PrintCraftDbContext : DbContext
{
    public PrintCraftDbContext(DbContextOptions<PrintCraftDbContext> options) : base(options) { }

    public DbSet<Product> Products => Set<Product>();
    
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfigurationsFromAssembly(typeof(PrintCraftDbContext).Assembly);
    }
}
