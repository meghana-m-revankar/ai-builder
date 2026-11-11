namespace Portfolio.Domain.Entities;

public sealed class Project
{
    public Guid Id { get; private set; }
    public string Title { get; private set; } = string.Empty;
    public string Description { get; private set; } = string.Empty;
    public List<string> Technologies { get; private set; } = new();
    public string? ProjectUrl { get; private set; }
    public string? ImageUrl { get; private set; }

    public Project(string title, string description, List<string> technologies)
    {
        Id = Guid.NewGuid();
        Title = title;
        Description = description;
        Technologies = technologies;
    }
}
