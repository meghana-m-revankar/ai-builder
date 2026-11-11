using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using MeghanaPortfolio.Infrastructure.Data;

namespace MeghanaPortfolio.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection services, Microsoft.Extensions.Configuration.IConfiguration config)
    {
        services.AddDbContext<MeghanaPortfolioDbContext>(o => o.UseNpgsql(config.GetConnectionString("Default")));
        return services;
    }
}
