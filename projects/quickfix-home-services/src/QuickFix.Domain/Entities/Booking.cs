namespace QuickFix.Domain.Entities;

public class Booking
{
    public Guid Id { get; private set; }
    public Guid CustomerId { get; private set; }
    public string ServiceType { get; private set; } = default!;
    public string Address { get; private set; } = default!;
    public DateTime ScheduledAt { get; private set; }
    public string Status { get; private set; } = "pending";
    public Guid? TechnicianId { get; private set; }
    public decimal TotalPrice { get; private set; }
    public string Currency { get; private set; } = "INR";
}