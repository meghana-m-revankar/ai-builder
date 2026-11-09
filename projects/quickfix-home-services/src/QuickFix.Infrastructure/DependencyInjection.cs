using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace QuickFix.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddDbContext<Data.QuickFixDbContext>(options =>
            options.UseNpgsql(configuration.GetConnectionString("Default"))
                   .UseSnakeCaseNamingConvention());
        return services;
    }
}