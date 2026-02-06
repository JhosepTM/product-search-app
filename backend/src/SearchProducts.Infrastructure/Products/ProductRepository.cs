using Microsoft.EntityFrameworkCore;
using SearchProducts.Domain.Products;
using SearchProducts.Infrastructure.Persistence;

namespace SearchProducts.Infrastructure.Products;

public class ProductRepository : IProductRepository
{
    private readonly AppDbContext _context;

    public ProductRepository(AppDbContext context)
    {
        _context = context;
    }

    public async Task<(IEnumerable<Product> Items, int TotalCount)> GetAllAsync(
        string? search = null,
        decimal? minPrice = null,
        decimal? maxPrice = null,
        string? currency = null,
        bool? inStock = null,
        string? sortBy = null,
        bool sortDescending = false,
        int page = 1,
        int pageSize = 10)
    {
        var query = _context.Products.AsNoTracking().AsQueryable();

        // Search by name or SKU
        if (!string.IsNullOrWhiteSpace(search))
        {
            var searchLower = search.ToLower();
            query = query.Where(p =>
                p.Name.ToLower().Contains(searchLower) ||
                p.Sku.ToLower().Contains(searchLower));
        }

        // Filter by price range
        if (minPrice.HasValue)
            query = query.Where(p => p.Price >= minPrice.Value);

        if (maxPrice.HasValue)
            query = query.Where(p => p.Price <= maxPrice.Value);

        // Filter by currency
        if (!string.IsNullOrWhiteSpace(currency))
            query = query.Where(p => p.Currency.ToLower() == currency.ToLower());

        // Filter by stock availability
        if (inStock.HasValue)
            query = query.Where(p => inStock.Value ? p.Stock > 0 : p.Stock == 0);

        // Get total count before pagination
        var totalCount = await query.CountAsync();

        // Sorting
        query = (sortBy?.ToLowerInvariant()) switch
        {
            "name" => sortDescending ? query.OrderByDescending(p => p.Name) : query.OrderBy(p => p.Name),
            "price" => sortDescending ? query.OrderByDescending(p => p.Price) : query.OrderBy(p => p.Price),
            "stock" => sortDescending ? query.OrderByDescending(p => p.Stock) : query.OrderBy(p => p.Stock),
            "sku" => sortDescending ? query.OrderByDescending(p => p.Sku) : query.OrderBy(p => p.Sku),
            _ => query.OrderBy(p => p.Id)
        };

        // Pagination
        var items = await query
            .Skip((page - 1) * pageSize)
            .Take(pageSize)
            .ToListAsync();

        return (items, totalCount);
    }

    public async Task<Product?> GetByIdAsync(int id)
    {
        return await _context.Products.FindAsync(id);
    }

    public async Task<bool> UpdatePriceAsync(int id, decimal price, string currency)
    {
        var product = await _context.Products.FindAsync(id);
        if (product is null) return false;

        product.Price = price;
        product.Currency = currency;
        product.UpdatedAt = DateTime.UtcNow;

        await _context.SaveChangesAsync();
        return true;
    }
}
