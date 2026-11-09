namespace PulseFitness.Application.Interfaces;

public interface IBookingRepository
{
    Task CreateBookingAsync(PulseFitness.Domain.Entities.Booking booking, CancellationToken ct);
}