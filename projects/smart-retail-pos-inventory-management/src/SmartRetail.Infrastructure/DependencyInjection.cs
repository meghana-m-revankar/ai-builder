using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using SmartRetail.Infrastructure.Persistence;
using SmartRetail.Application.Interfaces;
using SmartRetail.Infrastructure.Repositories;
using Microsoft.Extensions.Configuration;

namespace SmartRetail.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddDbContext<SmartRetailDbContext>(options =>
            options.UseNpgsql(configuration.GetConnectionString("Default")));

        services.AddScoped<IProductRepository, ProductRepository>();
        return services;
    }
}
