namespace GoldenCrust.Domain.Entities;

public enum OrderStatus { Pending, Confirmed, Completed, Cancelled }

public class Order
{
    public Guid Id { get; private set; }
    public string CustomerName { get; private set; }
    public string Phone { get; private set; }
    public Guid ProductId { get; private set; }
    public int Quantity { get; private set; }
    public DateTime PickupDate { get; private set; }
    public OrderStatus Status { get; private set; }
    public DateTime CreatedAt { get; private set; }

    public Order(Guid id, string customerName, string phone, Guid productId, int quantity, DateTime pickupDate, DateTime createdAt)
    {
        Id = id;
        CustomerName = customerName;
        Phone = phone;
        ProductId = productId;
        Quantity = quantity;
        PickupDate = pickupDate;
        Status = OrderStatus.Pending;
        CreatedAt = createdAt;
    }
}
