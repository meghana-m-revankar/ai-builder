namespace GoldenCrust.Domain.Entities;

public enum OrderStatus
{
    Pending,
    Ready,
    Completed
}

public class Order
{
    public Guid Id { get; set; }
    public string CustomerName { get; set; } = string.Empty;
    public string Phone { get; set; } = string.Empty;
    public Guid ProductId { get; set; }
    public int Quantity { get; set; }
    public DateTime PickupDate { get; set; }
    public OrderStatus Status { get; set; } = OrderStatus.Pending;
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
    
    public Product? Product { get; set; }
}
