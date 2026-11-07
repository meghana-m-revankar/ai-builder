namespace GoldenCrust.Domain.Entities;

public class Product
{
    public Guid Id { get; set; }
    public string NameEn { get; set; } = string.Empty;
    public string NameAr { get; set; } = string.Empty;
    public string? DescriptionEn { get; set; }
    public string? DescriptionAr { get; set; }
    public decimal PriceAed { get; set; }
    public string Category { get; set; } = string.Empty;
    public bool IsAvailable { get; set; } = true;
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
}
