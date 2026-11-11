namespace ChatArer.Application.DTOs;

public record MessageDto(Guid Id, Guid ConversationId, Guid SenderId, string Content, string Status, DateTime CreatedAt);
