using SearchProducts.Application.Common;
using SearchProducts.Application.DTOs;
using SearchProducts.Domain.Interfaces;

namespace SearchProducts.Application.Services;

public class ProductService : IProductService
{
    private readonly IProductRepository _repository;

    public ProductService(IProductRepository repository)
    {
        _repository = repository;
    }

    public async Task<PaginatedResponse<ProductDto>> GetProductsAsync(ProductFilterDto filter)
    {
        var (items, totalCount) = await _repository.GetAllAsync(
            search: filter.Search,
            minPrice: filter.MinPrice,
            maxPrice: filter.MaxPrice,
            currency: filter.Currency,
            inStock: filter.InStock,
            sortBy: filter.SortBy,
            sortDescending: filter.SortDescending,
            page: filter.Page,
            pageSize: filter.PageSize);

        var dtos = items.Select(p => new ProductDto(
            p.Id, p.Sku, p.Name, p.Price, p.Currency, p.Stock));

        var totalPages = (int)Math.Ceiling(totalCount / (double)filter.PageSize);

        return new PaginatedResponse<ProductDto>(dtos, totalCount, filter.Page, filter.PageSize, totalPages);
    }

    public async Task<ProductDto?> GetProductByIdAsync(int id)
    {
        var product = await _repository.GetByIdAsync(id);
        if (product is null) return null;

        return new ProductDto(product.Id, product.Sku, product.Name, product.Price, product.Currency, product.Stock);
    }

    public async Task<ProductDto?> UpdatePriceAsync(int id, UpdatePriceDto dto)
    {
        var success = await _repository.UpdatePriceAsync(id, dto.Price, dto.Currency);
        if (!success) return null;

        return await GetProductByIdAsync(id);
    }
}
