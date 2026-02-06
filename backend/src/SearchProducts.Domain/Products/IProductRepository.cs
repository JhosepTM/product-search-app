namespace SearchProducts.Domain.Products;

public interface IProductRepository
{
    Task<(IEnumerable<Product> Items, int TotalCount)> GetAllAsync(
        string? search = null,
        decimal? minPrice = null,
        decimal? maxPrice = null,
        string? currency = null,
        bool? inStock = null,
        string? sortBy = null,
        bool sortDescending = false,
        int page = 1,
        int pageSize = 10);

    Task<Product?> GetByIdAsync(int id);
    Task<bool> UpdatePriceAsync(int id, decimal price, string currency);
}
