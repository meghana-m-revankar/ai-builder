namespace BrewPoint.Domain.Entities;

public sealed class Product
{
    public Guid Id { get; private set; }
    public string Name { get; private set; } = default!;
    public string Category { get; private set; } = default!;
    public decimal Price { get; private set; }
    public int StockQuantity { get; private set; }
    
    // Private setters to ensure invariants
    private Product() {}

    public static Product Create(string name, string category, decimal price, int stock)
    {
        if (price < 0) throw new ArgumentException("Price cannot be negative.");
        return new Product { Name = name, Category = category, Price = price, StockQuantity = stock };
    }
}
