using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using PrintCraft.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;

namespace PrintCraft.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddDbContext<PrintCraftDbContext>(options =>
            options.UseNpgsql(configuration.GetConnectionString("Default")));
        
        // TODO: Register repositories
        return services;
    }
}
