using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using JioLife.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;

namespace JioLife.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection services, IConfiguration configuration)
    {
        var connectionString = configuration.GetConnectionString("Default");
        services.AddDbContext<JioLifeDbContext>(options =>
            options.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString)));
        
        return services;
    }
}
