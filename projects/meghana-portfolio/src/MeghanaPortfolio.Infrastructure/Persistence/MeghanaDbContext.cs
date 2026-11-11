using Microsoft.EntityFrameworkCore;
using MeghanaPortfolio.Domain.Entities;

namespace MeghanaPortfolio.Infrastructure.Persistence;

public class MeghanaDbContext : DbContext
{
    public MeghanaDbContext(DbContextOptions<MeghanaDbContext> options) : base(options) { }
    public DbSet<Project> Projects => Set<Project>();
    public DbSet<ContactMessage> ContactMessages => Set<ContactMessage>();
}
