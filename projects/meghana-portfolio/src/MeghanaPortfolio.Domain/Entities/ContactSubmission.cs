namespace MeghanaPortfolio.Domain.Entities;

public sealed class ContactSubmission
{
    public Guid Id { get; private set; }
    public string FullName { get; private set; } = string.Empty;
    public string Email { get; private set; } = string.Empty;
    public string Subject { get; private set; } = string.Empty;
    public string Message { get; private set; } = string.Empty;
    public string Status { get; private set; } = "new";
    public DateTime CreatedAt { get; private set; } = DateTime.UtcNow;

    public ContactSubmission(string fullName, string email, string subject, string message)
    {
        Id = Guid.NewGuid();
        FullName = fullName;
        Email = email;
        Subject = subject;
        Message = message;
    }
}
