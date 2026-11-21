namespace JioLife.Domain.Entities;

public sealed class UserProfile
{
    public Guid Id { get; private set; }
    public string Email { get; private set; } = string.Empty;
    public string FirstName { get; private set; } = string.Empty;
    public string LastName { get; private set; } = string.Empty;
    public DateTime CreatedAt { get; private set; }
    public DateTime? DeletedAt { get; private set; }

    public UserProfile(string email, string firstName, string lastName)
    {
        Id = Guid.NewGuid();
        Email = email;
        FirstName = firstName;
        LastName = lastName;
        CreatedAt = DateTime.UtcNow;
    }
}
