using Microsoft.EntityFrameworkCore;

namespace QuickFix.Infrastructure.Data;

public class QuickFixDbContext : DbContext
{
    public QuickFixDbContext(DbContextOptions<QuickFixDbContext> options) : base(options) { }
    public DbSet<Domain.Entities.Booking> Bookings => Set<Domain.Entities.Booking>();
    public DbSet<Domain.Entities.Technician> Technicians => Set<Domain.Entities.Technician>();
    public DbSet<Domain.Entities.Payment> Payments => Set<Domain.Entities.Payment>();
}