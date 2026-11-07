namespace GoldenCrust.Domain.Entities;

public enum OrderStatus { Pending, Confirmed, Cancelled, Completed }

public sealed class PreOrder
{
    public Guid Id { get; private set; }
    public Guid ProductId { get; private set; }
    public string CustomerName { get; private set; } = string.Empty;
    public string Phone { get; private set; } = string.Empty;
    public int Quantity { get; private set; }
    public DateTime PickupDate { get; private set; }
    public OrderStatus Status { get; private set; }
    public DateTime CreatedAt { get; private set; }

    public PreOrder(Guid id, Guid productId, string customerName, string phone, int quantity, DateTime pickupDate)
    {
        Id = id;
        ProductId = productId;
        CustomerName = customerName;
        Phone = phone;
        Quantity = quantity;
        PickupDate = pickupDate;
        Status = OrderStatus.Pending;
        CreatedAt = DateTime.UtcNow;
    }
}
