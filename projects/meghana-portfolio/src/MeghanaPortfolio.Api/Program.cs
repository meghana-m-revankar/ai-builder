using MeghanaPortfolio.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using Serilog;

var builder = WebApplication.CreateBuilder(args);
builder.Host.UseSerilog((ctx, cfg) => cfg.ReadFrom.Configuration(ctx.Configuration).WriteTo.Console());

builder.Services.AddDbContext<MeghanaPortfolioDbContext>(o => 
    o.UseNpgsql(builder.Configuration.GetConnectionString("Default")));

// TODO: Register repositories
builder.Services.AddControllers();
builder.Services.AddSwaggerGen();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
    using var scope = app.Services.CreateScope();
    await DbSeeder.SeedAsync(scope.ServiceProvider.GetRequiredService<MeghanaPortfolioDbContext>(), CancellationToken.None);
}

app.MapControllers();
app.Run();

public partial class Program { }
