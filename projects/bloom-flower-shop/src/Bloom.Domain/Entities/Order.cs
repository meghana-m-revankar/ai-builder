using Bloom.Domain.Enums;

namespace Bloom.Domain.Entities;

public sealed class Order
{
    public Guid Id { get; private set; }
    public string CustomerName { get; private set; } = string.Empty;
    public string CustomerPhone { get; private set; } = string.Empty;
    public DateTime DeliveryDate { get; private set; }
    public string? GiftMessage { get; private set; }
    public OrderStatus Status { get; private set; }
    public DateTime CreatedAt { get; private set; }

    public Order(Guid id, string customerName, string customerPhone, DateTime deliveryDate, string? giftMessage)
    {
        Id = id;
        CustomerName = customerName;
        CustomerPhone = customerPhone;
        DeliveryDate = deliveryDate;
        GiftMessage = giftMessage;
        Status = OrderStatus.New;
        CreatedAt = DateTime.UtcNow;
    }

    public void UpdateStatus(OrderStatus newStatus)
    {
        Status = newStatus;
    }
}
