namespace MeghanaPortfolio.Domain.Entities;

public sealed class Contact
{
    public Guid Id { get; private set; }
    public string FullName { get; private set; } = default!;
    public string Email { get; private set; } = default!;
    public string Message { get; private set; } = default!;
    public bool IsRead { get; private set; }
    public DateTime CreatedAt { get; private set; }

    private Contact() { }

    public static Contact Create(string fullName, string email, string message)
    {
        // TODO: Add guard clauses
        return new Contact
        {
            Id = Guid.NewGuid(),
            FullName = fullName,
            Email = email,
            Message = message,
            IsRead = false,
            CreatedAt = DateTime.UtcNow
        };
    }
}