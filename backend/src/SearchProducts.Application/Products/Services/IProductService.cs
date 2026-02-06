using SearchProducts.Application.Common;
using SearchProducts.Application.Products.DTOs;

namespace SearchProducts.Application.Products.Services;

public interface IProductService
{
    Task<PaginatedResponse<ProductDto>> GetProductsAsync(ProductFilterDto filter);
    Task<ProductDto?> GetProductByIdAsync(int id);
    Task<ProductDto?> UpdatePriceAsync(int id, UpdatePriceDto dto);
}
