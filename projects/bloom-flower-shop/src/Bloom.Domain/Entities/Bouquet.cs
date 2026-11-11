namespace Bloom.Domain.Entities;

public sealed class Bouquet
{
    public Guid Id { get; private set; }
    public string Name { get; private set; } = string.Empty;
    public string? Description { get; private set; }
    public decimal Price { get; private set; }
    public string Currency { get; private set; } = "AED";
    public string? ImageUrl { get; private set; }
    public bool IsActive { get; private set; } = true;
    public DateTime CreatedAt { get; private set; }
    public DateTime UpdatedAt { get; private set; }

    public Bouquet(Guid id, string name, string? description, decimal price, string? imageUrl)
    {
        Id = id;
        Name = name;
        Description = description;
        Price = price;
        ImageUrl = imageUrl;
        CreatedAt = DateTime.UtcNow;
        UpdatedAt = DateTime.UtcNow;
    }

    public void Update(string name, string? description, decimal price, string? imageUrl, bool isActive)
    {
        Name = name;
        Description = description;
        Price = price;
        ImageUrl = imageUrl;
        IsActive = isActive;
        UpdatedAt = DateTime.UtcNow;
    }
}
