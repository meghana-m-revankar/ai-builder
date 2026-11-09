using SunriseYoga.Domain.Entities;

namespace SunriseYoga.Application.Interfaces;

public interface IInstructorRepository
{
    Task<IEnumerable<Instructor>> GetAllAsync(CancellationToken ct);
}
