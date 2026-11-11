namespace Portfolio.Domain.Entities;

public sealed class ContactMessage
{
    public Guid Id { get; private set; }
    public string Name { get; private set; } = string.Empty;
    public string Email { get; private set; } = string.Empty;
    public string Message { get; private set; } = string.Empty;
    public string Status { get; private set; } = "new";

    private ContactMessage() { }
    
    public static ContactMessage Create(string name, string email, string message)
    {
        return new ContactMessage { Id = Guid.NewGuid(), Name = name, Email = email, Message = message };
    }
}
