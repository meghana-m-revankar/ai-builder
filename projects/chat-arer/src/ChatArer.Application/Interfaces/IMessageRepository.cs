namespace ChatArer.Application.Interfaces;

using ChatArer.Application.DTOs;

public interface IMessageRepository
{
    Task<IEnumerable<MessageDto>> GetRecentMessagesAsync(Guid conversationId, int limit, CancellationToken ct);
    Task AddMessageAsync(Guid conversationId, Guid senderId, string content, CancellationToken ct);
}
