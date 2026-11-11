using MediatR;
using SmartRetail.Application.DTOs;
using SmartRetail.Application.Interfaces;

namespace SmartRetail.Application.Products.Queries;

public class GetProductsQueryHandler : IRequestHandler<GetProductsQuery, IEnumerable<ProductDto>>
{
    private readonly IProductRepository _productRepository;

    public GetProductsQueryHandler(IProductRepository productRepository)
    {
        _productRepository = productRepository;
    }

    public async Task<IEnumerable<ProductDto>> Handle(GetProductsQuery request, CancellationToken cancellationToken)
    {
        // TODO: Map entities to DTOs
        return await _productRepository.GetAllAsync(cancellationToken);
    }
}
