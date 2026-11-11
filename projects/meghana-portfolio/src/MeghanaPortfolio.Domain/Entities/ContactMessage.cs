namespace MeghanaPortfolio.Domain.Entities;

public sealed class ContactMessage
{
    public Guid Id { get; private set; }
    public string FullName { get; private set; }
    public string Email { get; private set; }
    public string Subject { get; private set; }
    public string Message { get; private set; }
    public string Status { get; private set; }

    public ContactMessage(string fullName, string email, string subject, string message)
    {
        Id = Guid.NewGuid();
        FullName = fullName;
        Email = email;
        Subject = subject;
        Message = message;
        Status = "new";
    }
}
