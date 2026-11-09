namespace QuickFix.Domain.Entities;

public class Payment
{
    public Guid Id { get; private set; }
    public Guid BookingId { get; private set; }
    public decimal Amount { get; private set; }
    public string Status { get; private set; } = "pending";
    public string PaymentMethod { get; private set; } = default!;
}