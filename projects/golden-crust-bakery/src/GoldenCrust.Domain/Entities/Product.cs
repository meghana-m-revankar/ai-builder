using System.ComponentModel.DataAnnotations;

namespace GoldenCrust.Domain.Entities;

public sealed class Product
{
    public Guid Id { get; private set; }
    public string NameEn { get; private set; } = string.Empty;
    public string NameAr { get; private set; } = string.Empty;
    public string? Description { get; private set; }
    public decimal Price { get; private set; }
    public string Currency { get; private set; } = "AED";
    public bool IsDailySpecial { get; private set; }
    public bool IsBestseller { get; private set; }
    public DateTime CreatedAt { get; private set; }

    public Product(Guid id, string nameEn, string nameAr, decimal price)
    {
        Id = id;
        NameEn = nameEn;
        NameAr = nameAr;
        Price = price;
        CreatedAt = DateTime.UtcNow;
    }
}
