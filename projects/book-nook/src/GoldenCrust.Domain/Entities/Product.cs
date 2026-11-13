namespace GoldenCrust.Domain.Entities;

public sealed class Product
{
    public Guid Id { get; private set; }
    public Guid TenantId { get; private set; }
    public Guid CategoryId { get; private set; }
    public string Name { get; private set; } = string.Empty;
    public string Sku { get; private set; } = string.Empty;
    public decimal Price { get; private set; }
    public int StockQuantity { get; private set; }
    public string ImageUrl { get; private set; } = string.Empty;

    private Product() { }

    public static Product Create(Guid tenantId, Guid categoryId, string name, string sku, decimal price, int stock, string imageUrl)
    {
        // TODO: Add guards
        return new Product 
        { 
            Id = Guid.NewGuid(), 
            TenantId = tenantId, 
            CategoryId = categoryId, 
            Name = name, 
            Sku = sku, 
            Price = price, 
            StockQuantity = stock,
            ImageUrl = imageUrl
        };
    }
}
