namespace SearchProducts.Application.Products.DTOs;

public record ProductDto(
    int Id,
    string Sku,
    string Name,
    decimal Price,
    string Currency,
    int Stock);
