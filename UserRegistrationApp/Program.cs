using UserRegistrationLib;

bool hasStarted = false;
var builder = WebApplication.CreateBuilder(args);

//set 5432 port for api service
builder.WebHost.ConfigureKestrel(x => x.ListenAnyIP(5432));

var app = builder.Build();

app.MapGet("/", (IConfiguration configuration) => 
{
    string msg = 
        configuration["ENV_MESSAGE"] 
        ?? "Hello UserRegistrationApp! ENV_MESSAGE not found.";
    return new UserRegistrationState(msg);
});
// liveness endpoint for Kubernetes restart app
app.MapGet("/live", () => Results.Ok());
// readiness endpoint for Kubernetes to be signaled app is ready to receive requests
app.MapGet("/ready", () => hasStarted ? Results.Ok() : Results.StatusCode(500));
// PostStart Kubernete event hook
app.MapGet("/postStart", (ILogger<UserRegistrationApp> logger) 
    => logger.LogInformation("PostStart event"));
// PreStop Kubernete event hook to gracefully shutdown
app.MapGet("/preStop", (ILogger<UserRegistrationApp> logger) 
    => logger.LogInformation("PreStop event"));
app.Run();

hasStarted = true;
