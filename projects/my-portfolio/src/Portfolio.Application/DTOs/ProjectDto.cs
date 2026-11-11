namespace Portfolio.Application.DTOs;

public record ProjectDto(Guid Id, string Title, string Description, string? ImageUrl, string? ProjectUrl);
