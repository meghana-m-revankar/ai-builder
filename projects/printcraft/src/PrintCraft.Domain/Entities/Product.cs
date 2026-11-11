namespace PrintCraft.Domain.Entities;

public sealed class Product
{
    public Guid Id { get; private set; }
    public string Name { get; private set; } = string.Empty;
    public string Category { get; private set; } = string.Empty;
    public decimal BasePrice { get; private set; }
    public string Currency { get; private set; } = "USD";
    public string? Description { get; private set; }
    public int Stock { get; private set; }
    public string? ImageUrl { get; private set; }

    private Product() { }

    public static Product Create(string name, string category, decimal basePrice, int stock)
    {
        // TODO: Add guard clauses
        return new Product { Id = Guid.NewGuid(), Name = name, Category = category, BasePrice = basePrice, Stock = stock };
    }
}
