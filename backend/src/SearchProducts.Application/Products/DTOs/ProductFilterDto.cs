namespace SearchProducts.Application.Products.DTOs;

public record ProductFilterDto(
    string? Search = null,
    decimal? MinPrice = null,
    decimal? MaxPrice = null,
    string? Currency = null,
    bool? InStock = null,
    string? SortBy = null,
    bool SortDescending = false,
    int Page = 1,
    int PageSize = 10);
