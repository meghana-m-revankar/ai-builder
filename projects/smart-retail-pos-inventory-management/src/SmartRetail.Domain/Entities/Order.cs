namespace SmartRetail.Domain.Entities;

public sealed class Order
{
    public Guid Id { get; private set; }
    public string OrderNumber { get; private set; }
    public decimal TotalAmount { get; private set; }
    
    private readonly List<OrderItem> _items = new();
    public IReadOnlyCollection<OrderItem> Items => _items.AsReadOnly();

    public Order(Guid id, string orderNumber, decimal totalAmount)
    {
        Id = id;
        OrderNumber = orderNumber;
        TotalAmount = totalAmount;
    }
}
