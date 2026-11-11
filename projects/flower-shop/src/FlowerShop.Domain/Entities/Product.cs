namespace FlowerShop.Domain.Entities;

public sealed class Product
{
    public Guid Id { get; private set; }
    public Guid CategoryId { get; private set; }
    public string Name { get; private set; } = null!;
    public string? Description { get; private set; }
    public decimal Price { get; private set; }
    public int StockQuantity { get; private set; }
    public bool IsFeatured { get; private set; }

    public Product(Guid categoryId, string name, decimal price, int stockQuantity)
    {
        Id = Guid.NewGuid();
        CategoryId = categoryId;
        Name = name;
        Price = price;
        StockQuantity = stockQuantity;
    }
}
