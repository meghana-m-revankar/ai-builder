using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using SunriseYoga.Application.Interfaces;
using SunriseYoga.Infrastructure.Data;
using SunriseYoga.Infrastructure.Repositories;

namespace SunriseYoga.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddDbContext<SunriseYogaDbContext>(options =>
            options.UseNpgsql(configuration.GetConnectionString("Default")));
            
        services.AddScoped<IInstructorRepository, InstructorRepository>();
        return services;
    }
}
