namespace SmartRetail.Domain.Entities;

public sealed class OrderItem
{
    public Guid Id { get; private set; }
    public Guid OrderId { get; private set; }
    public Guid ProductId { get; private set; }
    public int Quantity { get; private set; }
    public decimal PriceAtPurchase { get; private set; }

    public OrderItem(Guid id, Guid orderId, Guid productId, int quantity, decimal priceAtPurchase)
    {
        Id = id;
        OrderId = orderId;
        ProductId = productId;
        Quantity = quantity;
        PriceAtPurchase = priceAtPurchase;
    }
}
