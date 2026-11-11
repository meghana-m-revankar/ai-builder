namespace SmartRetail.Domain.Entities;

public sealed class Product
{
    public Guid Id { get; private set; }
    public Guid CategoryId { get; private set; }
    public string SKU { get; private set; }
    public string Name { get; private set; }
    public decimal Price { get; private set; }
    public int StockQuantity { get; private set; }

    public Product(Guid id, Guid categoryId, string sku, string name, decimal price, int stockQuantity)
    {
        Id = id;
        CategoryId = categoryId;
        SKU = sku;
        Name = name;
        Price = price;
        StockQuantity = stockQuantity;
    }
}
