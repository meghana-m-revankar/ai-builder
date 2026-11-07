namespace GoldenCrust.Domain.Entities;

public sealed class Product
{
    public Guid Id { get; private set; }
    public string Name { get; private set; } = default!;
    public string? Description { get; private set; }
    public decimal Price { get; private set; }
    public string Currency { get; private set; } = "AED";
    public string? ImageUrl { get; private set; }
    public bool IsSpecial { get; private set; }

    private Product() { }

    public static Product Create(string name, decimal price, string? description = null, bool isSpecial = false)
    {
        if (string.IsNullOrWhiteSpace(name)) throw new ArgumentException("Name required");
        if (price < 0) throw new ArgumentException("Price cannot be negative");

        return new Product { Id = Guid.NewGuid(), Name = name, Price = price, Description = description, IsSpecial = isSpecial };
    }
}
