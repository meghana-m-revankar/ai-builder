using Microsoft.EntityFrameworkCore;
using PulseFitness.Domain.Entities;

namespace PulseFitness.Infrastructure.Persistence;

public class PulseDbContext : DbContext
{
    public PulseDbContext(DbContextOptions<PulseDbContext> options) : base(options) { }

    public DbSet<ClassType> ClassTypes => Set<ClassType>();
    public DbSet<Booking> Bookings => Set<Booking>();
    // TODO: Add remaining DbSets
}