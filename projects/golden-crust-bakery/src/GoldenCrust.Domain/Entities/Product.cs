namespace GoldenCrust.Domain.Entities;

public class Product
{
    public Guid Id { get; private set; }
    public string NameEn { get; private set; }
    public string NameAr { get; private set; }
    public decimal PriceAed { get; private set; }
    public bool IsBestSeller { get; private set; }
    public DateTime CreatedAt { get; private set; }

    public Product(Guid id, string nameEn, string nameAr, decimal priceAed, bool isBestSeller, DateTime createdAt)
    {
        Id = id;
        NameEn = nameEn;
        NameAr = nameAr;
        PriceAed = priceAed;
        IsBestSeller = isBestSeller;
        CreatedAt = createdAt;
    }
}
