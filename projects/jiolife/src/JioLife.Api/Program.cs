using JioLife.Infrastructure;
using JioLife.Infrastructure.Persistence;
using Serilog;

var builder = WebApplication.CreateBuilder(args);
builder.Host.UseSerilog((ctx, cfg) => cfg.ReadFrom.Configuration(ctx.Configuration).WriteTo.Console());

builder.Services.AddInfrastructure(builder.Configuration);
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddHealthChecks().AddDbContextCheck<JioLifeDbContext>("db", tags: new[] { "ready" });

var app = builder.Build();
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.MapControllers();
app.MapHealthChecks("/health/ready", new() { Predicate = c => c.Tags.Contains("ready") });
app.Run();

public partial class Program { }
