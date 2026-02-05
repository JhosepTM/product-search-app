using System.Net;
using System.Text.Json;
using SearchProducts.Application.Common;

namespace SearchProducts.API.Middleware;

public class ApiKeyMiddleware
{
    private const string ApiKeyHeaderName = "X-Api-Key";
    private readonly RequestDelegate _next;
    private readonly ILogger<ApiKeyMiddleware> _logger;

    public ApiKeyMiddleware(RequestDelegate next, ILogger<ApiKeyMiddleware> logger)
    {
        _next = next;
        _logger = logger;
    }

    public async Task InvokeAsync(HttpContext context)
    {
        var configuration = context.RequestServices.GetRequiredService<IConfiguration>();
        var apiKey = configuration["ApiKey"];

        // If no API key is configured, skip authentication
        if (string.IsNullOrEmpty(apiKey))
        {
            await _next(context);
            return;
        }

        // Allow Swagger/OpenAPI without API key
        if (context.Request.Path.StartsWithSegments("/swagger") ||
            context.Request.Path.StartsWithSegments("/openapi"))
        {
            await _next(context);
            return;
        }

        if (!context.Request.Headers.TryGetValue(ApiKeyHeaderName, out var extractedApiKey) ||
            !apiKey.Equals(extractedApiKey.ToString()))
        {
            _logger.LogWarning("Unauthorized API access attempt from {IP}", context.Connection.RemoteIpAddress);

            context.Response.ContentType = "application/json";
            context.Response.StatusCode = (int)HttpStatusCode.Unauthorized;

            var response = new ApiErrorResponse(false, "Invalid or missing API key.");
            var options = new JsonSerializerOptions { PropertyNamingPolicy = JsonNamingPolicy.CamelCase };
            await context.Response.WriteAsync(JsonSerializer.Serialize(response, options));
            return;
        }

        await _next(context);
    }
}
