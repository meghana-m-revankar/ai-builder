namespace ChatArer.Domain.Entities;

public sealed class User
{
    public Guid Id { get; private set; }
    public string Username { get; private set; } = default!;
    public string DisplayName { get; private set; } = default!;
    public string? AvatarUrl { get; private set; }

    private User() { }

    public User(string username, string displayName)
    {
        Id = Guid.NewGuid();
        Username = username;
        DisplayName = displayName;
    }
}
