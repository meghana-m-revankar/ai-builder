using MediatR;
using SmartRetail.Application.DTOs;

namespace SmartRetail.Application.Products.Queries;

public record GetProductsQuery : IRequest<IEnumerable<ProductDto>>;
