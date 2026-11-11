namespace PrintCraft.Application.Interfaces;

using PrintCraft.Application.DTOs;

public interface IProductRepository
{
    Task<IEnumerable<ProductDto>> GetAllAsync(CancellationToken ct);
    Task<ProductDto?> GetByIdAsync(Guid id, CancellationToken ct);
}
