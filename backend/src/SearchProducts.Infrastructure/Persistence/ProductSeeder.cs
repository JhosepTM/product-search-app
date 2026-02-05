using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using SearchProducts.Domain.Entities;

namespace SearchProducts.Infrastructure.Persistence;

public static class ProductSeeder
{
    public static async Task SeedAsync(IServiceProvider serviceProvider)
    {
        using var scope = serviceProvider.CreateScope();
        var context = scope.ServiceProvider.GetRequiredService<AppDbContext>();
        var logger = scope.ServiceProvider.GetRequiredService<ILogger<AppDbContext>>();

        await context.Database.MigrateAsync();

        if (await context.Products.AnyAsync())
        {
            logger.LogInformation("Database already seeded. Skipping.");
            return;
        }

        logger.LogInformation("Seeding database with initial products...");

        var products = new List<Product>
        {
            new() { Sku = "SKU-1001", Name = "Auriculares Bluetooth", Price = 199.90m, Currency = "BOB", Stock = 25 },
            new() { Sku = "SKU-1002", Name = "Teclado Mecánico RGB", Price = 349.50m, Currency = "BOB", Stock = 15 },
            new() { Sku = "SKU-1003", Name = "Mouse Inalámbrico", Price = 89.90m, Currency = "BOB", Stock = 40 },
            new() { Sku = "SKU-1004", Name = "Monitor 27\" 4K", Price = 1899.00m, Currency = "BOB", Stock = 8 },
            new() { Sku = "SKU-1005", Name = "Webcam HD 1080p", Price = 259.00m, Currency = "BOB", Stock = 20 },
            new() { Sku = "SKU-1006", Name = "Hub USB-C 7 en 1", Price = 179.90m, Currency = "BOB", Stock = 30 },
            new() { Sku = "SKU-1007", Name = "Disco SSD 1TB NVMe", Price = 499.00m, Currency = "BOB", Stock = 12 },
            new() { Sku = "SKU-1008", Name = "Memoria RAM 16GB DDR5", Price = 389.00m, Currency = "BOB", Stock = 18 },
            new() { Sku = "SKU-1009", Name = "Cargador Portátil 20000mAh", Price = 149.90m, Currency = "BOB", Stock = 35 },
            new() { Sku = "SKU-1010", Name = "Cable HDMI 2.1 3m", Price = 69.90m, Currency = "BOB", Stock = 50 },
            new() { Sku = "SKU-1011", Name = "Soporte para Laptop Ajustable", Price = 129.00m, Currency = "BOB", Stock = 22 },
            new() { Sku = "SKU-1012", Name = "Parlante Bluetooth Portátil", Price = 279.90m, Currency = "BOB", Stock = 16 },
            new() { Sku = "SKU-1013", Name = "Mousepad XL Gaming", Price = 59.90m, Currency = "BOB", Stock = 45 },
            new() { Sku = "SKU-1014", Name = "Adaptador WiFi USB", Price = 99.00m, Currency = "BOB", Stock = 28 },
            new() { Sku = "SKU-1015", Name = "Lámpara LED de Escritorio", Price = 189.00m, Currency = "BOB", Stock = 14 },
            new() { Sku = "SKU-2001", Name = "Laptop Gaming 15.6\"", Price = 6999.00m, Currency = "USD", Stock = 5 },
            new() { Sku = "SKU-2002", Name = "Tablet 10\" 128GB", Price = 2499.00m, Currency = "USD", Stock = 10 },
            new() { Sku = "SKU-2003", Name = "Smartwatch Deportivo", Price = 899.00m, Currency = "USD", Stock = 0 },
            new() { Sku = "SKU-2004", Name = "Cámara de Seguridad WiFi", Price = 349.00m, Currency = "USD", Stock = 20 },
            new() { Sku = "SKU-2005", Name = "Impresora Multifuncional", Price = 1299.00m, Currency = "USD", Stock = 7 },
        };

        context.Products.AddRange(products);
        await context.SaveChangesAsync();

        logger.LogInformation("Seeded {Count} products.", products.Count);
    }
}
