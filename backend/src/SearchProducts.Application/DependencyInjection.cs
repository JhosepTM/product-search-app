using FluentValidation;
using Microsoft.Extensions.DependencyInjection;
using SearchProducts.Application.Services;

namespace SearchProducts.Application;

public static class DependencyInjection
{
    public static IServiceCollection AddApplication(this IServiceCollection services)
    {
        services.AddScoped<IProductService, ProductService>();
        services.AddValidatorsFromAssembly(typeof(DependencyInjection).Assembly);
        return services;
    }
}
