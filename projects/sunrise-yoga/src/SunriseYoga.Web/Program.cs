using SunriseYoga.Web.Components;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddRazorComponents().AddInteractiveServerComponents();
builder.Services.AddHttpClient("Api", c => c.BaseAddress = new Uri(builder.Configuration["ApiBaseUrl"] ?? "https://localhost:7001"));
// TODO: register the Api client services used by the pages (e.g. builder.Services.AddScoped<IOrderService, OrderApiClient>()).

var app = builder.Build();
if (!app.Environment.IsDevelopment()) { app.UseExceptionHandler("/Error", createScopeForErrors: true); app.UseHsts(); }
app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseAntiforgery();
app.MapRazorComponents<App>().AddInteractiveServerRenderMode();
app.Run();
