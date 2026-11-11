using Microsoft.EntityFrameworkCore;
using MeghanaPortfolio.Domain.Entities;

namespace MeghanaPortfolio.Infrastructure.Data;

public sealed class MeghanaPortfolioDbContext : DbContext
{
    public MeghanaPortfolioDbContext(DbContextOptions<MeghanaPortfolioDbContext> options) : base(options) { }
    public DbSet<Project> Projects => Set<Project>();
    public DbSet<Skill> Skills => Set<Skill>();
}
