using SunriseYoga.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using SunriseYoga.Infrastructure.Data;
using SunriseYoga.Application.Interfaces;

namespace SunriseYoga.Infrastructure.Repositories;

public sealed class InstructorRepository : IInstructorRepository
{
    private readonly SunriseYogaDbContext _context;
    public InstructorRepository(SunriseYogaDbContext context) => _context = context;

    public async Task<IEnumerable<Instructor>> GetAllAsync(CancellationToken ct) 
        => await _context.Instructors.Where(x => x.DeletedAt == null).ToListAsync(ct);
}
