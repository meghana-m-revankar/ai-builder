namespace MeghanaPortfolio.Domain.Entities;

public sealed class ContactSubmission
{
    public Guid Id { get; private set; }
    public string FullName { get; private set; } = default!;
    public string Email { get; private set; } = default!;
    public string Subject { get; private set; } = default!;
    public string Message { get; private set; } = default!;
    public string Status { get; private set; } = "new";
    public DateTime CreatedAt { get; private set; }
    
    private ContactSubmission() { }

    public static ContactSubmission Create(string fullName, string email, string subject, string message)
    {
        return new ContactSubmission
        {
            Id = Guid.NewGuid(),
            FullName = fullName,
            Email = email,
            Subject = subject,
            Message = message,
            CreatedAt = DateTime.UtcNow
        };
    }
}
