namespace MeghanaPortfolio.Application.DTOs;

public record ProjectDto(Guid Id, string Title, string Description, string[] TechStack, string? ProjectUrl, string? ImageUrl);
