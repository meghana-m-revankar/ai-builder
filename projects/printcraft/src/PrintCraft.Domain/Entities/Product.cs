namespace PrintCraft.Domain.Entities;

public sealed class Product
{
    public Guid Id { get; private set; }
    public string Name { get; private set; } = string.Empty;
    public decimal BasePrice { get; private set; }
    public string Category { get; private set; } = string.Empty;
    public string OptionsJson { get; private set; } = "{}";
    public bool IsActive { get; private set; } = true;

    private Product() { }

    public static Product Create(string name, decimal basePrice, string category)
    {
        // TODO: Add guard clauses
        return new Product { Name = name, BasePrice = basePrice, Category = category };
    }
}
