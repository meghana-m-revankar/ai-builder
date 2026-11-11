namespace ChatArer.Application.Services;

using ChatArer.Application.DTOs;
using ChatArer.Application.Interfaces;

public sealed class ChatService
{
    private readonly IMessageRepository _repository;

    public ChatService(IMessageRepository repository) => _repository = repository;

    public async Task<IEnumerable<MessageDto>> GetConversationHistoryAsync(Guid conversationId, CancellationToken ct)
    {
        return await _repository.GetRecentMessagesAsync(conversationId, 50, ct);
    }

    public async Task SendMessageAsync(Guid conversationId, Guid senderId, string content, CancellationToken ct)
    {
        // TODO: Validate business rules (e.g. member of conversation)
        await _repository.AddMessageAsync(conversationId, senderId, content, ct);
    }
}
