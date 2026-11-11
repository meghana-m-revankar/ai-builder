using MeghanaPortfolio.Application.Interfaces;
using MeghanaPortfolio.Application.Services;
using MeghanaPortfolio.Infrastructure.Data;
using MeghanaPortfolio.Infrastructure.Repositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace MeghanaPortfolio.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddDbContext<MeghanaDbContext>(options => 
            options.UseNpgsql(configuration.GetConnectionString("Default")));
        
        services.AddScoped<IContactRepository, ContactRepository>();
        services.AddScoped<ContactService>();
        return services;
    }
}