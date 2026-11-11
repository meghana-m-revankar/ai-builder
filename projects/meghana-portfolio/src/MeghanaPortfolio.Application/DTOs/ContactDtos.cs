namespace MeghanaPortfolio.Application.DTOs;

public record CreateContactRequest(string FullName, string Email, string Message);
public record ContactResponse(Guid Id, string FullName, string Email, string Message, bool IsRead, DateTime CreatedAt);