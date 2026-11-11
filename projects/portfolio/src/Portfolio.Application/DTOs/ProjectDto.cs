namespace Portfolio.Application.DTOs;

public record ProjectDto(Guid Id, string Title, string Description, List<string> Technologies, string? ProjectUrl, string? ImageUrl);
