namespace Portfolio.Domain.Entities;

public sealed class Project
{
    public Guid Id { get; private set; }
    public string Title { get; private set; } = string.Empty;
    public string Description { get; private set; } = string.Empty;
    public string? ImageUrl { get; private set; }
    public string? ProjectUrl { get; private set; }

    private Project() { }

    public static Project Create(string title, string description, string? imageUrl, string? projectUrl)
    {
        // TODO: Add guard clauses
        return new Project { Id = Guid.NewGuid(), Title = title, Description = description, ImageUrl = imageUrl, ProjectUrl = projectUrl };
    }
}
