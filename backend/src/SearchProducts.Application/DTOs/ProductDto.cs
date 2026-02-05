namespace SearchProducts.Application.DTOs;

public record ProductDto(
    int Id,
    string Sku,
    string Name,
    decimal Price,
    string Currency,
    int Stock);
