using Microsoft.EntityFrameworkCore;
using BookNook.Domain.Entities;

namespace BookNook.Infrastructure.Data;

public class BookNookDbContext : DbContext
{
    public BookNookDbContext(DbContextOptions<BookNookDbContext> options) : base(options) { }

    public DbSet<Book> Books => Set<Book>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.UseSnakeCaseNamingConvention();
        modelBuilder.Entity<Book>().HasKey(b => b.Id);
    }
}
