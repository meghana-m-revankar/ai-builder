namespace MeghanaPortfolio.Domain.Entities;

public sealed class Project
{
    public Guid Id { get; private set; }
    public string Title { get; private set; } = default!;
    public string Description { get; private set; } = default!;
    public string[] TechStack { get; private set; } = default!;
    public string? ProjectUrl { get; private set; }
    public string? ImageUrl { get; private set; }
    public int DisplayOrder { get; private set; }

    public static Project Create(string title, string description, string[] techStack, string? projectUrl, string? imageUrl, int displayOrder)
    {
        return new Project
        {
            Id = Guid.NewGuid(),
            Title = title,
            Description = description,
            TechStack = techStack,
            ProjectUrl = projectUrl,
            ImageUrl = imageUrl,
            DisplayOrder = displayOrder
        };
    }
}
