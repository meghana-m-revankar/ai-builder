using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using FlowerShop.Infrastructure.Data;
using Microsoft.Extensions.Configuration;

namespace FlowerShop.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection services, IConfiguration config)
    {
        services.AddDbContext<FlowerShopDbContext>(options =>
            options.UseNpgsql(config.GetConnectionString("Default")));
        return services;
    }
}
