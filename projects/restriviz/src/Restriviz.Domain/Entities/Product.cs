namespace Restriviz.Domain.Entities;

public sealed class Product
{
    public Guid Id { get; private set; }
    public Guid CategoryId { get; private set; }
    public string Name { get; private set; } = string.Empty;
    public decimal Price { get; private set; }
    public bool IsVeg { get; private set; }
    public bool IsAvailable { get; private set; }

    private Product() { }

    public static Product Create(Guid categoryId, string name, decimal price, bool isVeg)
    {
        return new Product
        {
            Id = Guid.NewGuid(),
            CategoryId = categoryId,
            Name = name,
            Price = price,
            IsVeg = isVeg,
            IsAvailable = true
        };
    }
}
