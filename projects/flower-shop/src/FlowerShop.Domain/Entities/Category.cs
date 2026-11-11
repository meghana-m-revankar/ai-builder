namespace FlowerShop.Domain.Entities;

public sealed class Category
{
    public Guid Id { get; private set; }
    public string Name { get; private set; } = null!;
    public string? Description { get; private set; }

    public Category(string name, string? description)
    {
        Id = Guid.NewGuid();
        Name = name;
        Description = description;
    }
}
