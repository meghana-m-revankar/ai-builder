using MeghanaPortfolio.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace MeghanaPortfolio.Infrastructure.Data;

public class MeghanaDbContext(DbContextOptions<MeghanaDbContext> options) : DbContext(options)
{
    public DbSet<Contact> Contacts => Set<Contact>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Contact>().HasKey(c => c.Id);
    }
}