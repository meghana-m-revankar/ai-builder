using Microsoft.EntityFrameworkCore;
using JioLife.Domain.Entities;
using JioLife.Application.Interfaces;

namespace JioLife.Infrastructure.Persistence;

public class JioLifeDbContext : DbContext
{
    public JioLifeDbContext(DbContextOptions<JioLifeDbContext> options) : base(options) { }

    public DbSet<UserProfile> UserProfiles => Set<UserProfile>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<UserProfile>().ToTable("user_profiles");
        modelBuilder.Entity<UserProfile>().HasKey(u => u.Id);
    }
}
