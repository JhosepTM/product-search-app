using Moq;
using SearchProducts.Application.Products.DTOs;
using SearchProducts.Application.Products.Services;
using SearchProducts.Domain.Products;

namespace SearchProducts.Tests.Products;

public class ProductServiceTests
{
    private readonly Mock<IProductRepository> _mockRepository;
    private readonly ProductService _productService;

    public ProductServiceTests()
    {
        _mockRepository = new Mock<IProductRepository>();
        _productService = new ProductService(_mockRepository.Object);
    }

    #region GetProductsAsync Tests

    [Fact]
    public async Task GetProductsAsync_ShouldReturnPaginatedProducts_WhenProductsExist()
    {
        // Arrange
        var products = new List<Product>
        {
            new() { Id = 1, Sku = "SKU-001", Name = "Product 1", Price = 100, Currency = "BOB", Stock = 10, ImageUrl = "http://test.com/1.jpg" },
            new() { Id = 2, Sku = "SKU-002", Name = "Product 2", Price = 200, Currency = "USD", Stock = 5, ImageUrl = "http://test.com/2.jpg" }
        };

        _mockRepository
            .Setup(r => r.GetAllAsync(
                It.IsAny<string?>(),
                It.IsAny<decimal?>(),
                It.IsAny<decimal?>(),
                It.IsAny<string?>(),
                It.IsAny<bool?>(),
                It.IsAny<string?>(),
                It.IsAny<bool>(),
                It.IsAny<int>(),
                It.IsAny<int>()))
            .ReturnsAsync((products.AsEnumerable(), 2));

        var filter = new ProductFilterDto { Page = 1, PageSize = 10 };

        // Act
        var result = await _productService.GetProductsAsync(filter);

        // Assert
        Assert.NotNull(result);
        Assert.Equal(2, result.TotalCount);
        Assert.Equal(1, result.Page);
        Assert.Equal(10, result.PageSize);
        Assert.Equal(2, result.Items.Count());
    }

    [Fact]
    public async Task GetProductsAsync_ShouldReturnEmptyList_WhenNoProductsExist()
    {
        // Arrange
        _mockRepository
            .Setup(r => r.GetAllAsync(
                It.IsAny<string?>(),
                It.IsAny<decimal?>(),
                It.IsAny<decimal?>(),
                It.IsAny<string?>(),
                It.IsAny<bool?>(),
                It.IsAny<string?>(),
                It.IsAny<bool>(),
                It.IsAny<int>(),
                It.IsAny<int>()))
            .ReturnsAsync((Enumerable.Empty<Product>(), 0));

        var filter = new ProductFilterDto { Page = 1, PageSize = 10 };

        // Act
        var result = await _productService.GetProductsAsync(filter);

        // Assert
        Assert.NotNull(result);
        Assert.Equal(0, result.TotalCount);
        Assert.Empty(result.Items);
    }

    [Fact]
    public async Task GetProductsAsync_ShouldApplySearchFilter_WhenSearchProvided()
    {
        // Arrange
        var products = new List<Product>
        {
            new() { Id = 1, Sku = "SKU-001", Name = "Monitor 27", Price = 350, Currency = "BOB", Stock = 10, ImageUrl = "http://test.com/1.jpg" }
        };

        _mockRepository
            .Setup(r => r.GetAllAsync(
                "Monitor",
                It.IsAny<decimal?>(),
                It.IsAny<decimal?>(),
                It.IsAny<string?>(),
                It.IsAny<bool?>(),
                It.IsAny<string?>(),
                It.IsAny<bool>(),
                It.IsAny<int>(),
                It.IsAny<int>()))
            .ReturnsAsync((products.AsEnumerable(), 1));

        var filter = new ProductFilterDto { Search = "Monitor", Page = 1, PageSize = 10 };

        // Act
        var result = await _productService.GetProductsAsync(filter);

        // Assert
        Assert.Single(result.Items);
        _mockRepository.Verify(r => r.GetAllAsync(
            "Monitor",
            It.IsAny<decimal?>(),
            It.IsAny<decimal?>(),
            It.IsAny<string?>(),
            It.IsAny<bool?>(),
            It.IsAny<string?>(),
            It.IsAny<bool>(),
            It.IsAny<int>(),
            It.IsAny<int>()), Times.Once);
    }

    [Fact]
    public async Task GetProductsAsync_ShouldCalculateTotalPages_Correctly()
    {
        // Arrange
        var products = new List<Product>
        {
            new() { Id = 1, Sku = "SKU-001", Name = "Product 1", Price = 100, Currency = "BOB", Stock = 10, ImageUrl = "http://test.com/1.jpg" }
        };

        _mockRepository
            .Setup(r => r.GetAllAsync(
                It.IsAny<string?>(),
                It.IsAny<decimal?>(),
                It.IsAny<decimal?>(),
                It.IsAny<string?>(),
                It.IsAny<bool?>(),
                It.IsAny<string?>(),
                It.IsAny<bool>(),
                It.IsAny<int>(),
                It.IsAny<int>()))
            .ReturnsAsync((products.AsEnumerable(), 25)); // 25 total items

        var filter = new ProductFilterDto { Page = 1, PageSize = 10 };

        // Act
        var result = await _productService.GetProductsAsync(filter);

        // Assert
        Assert.Equal(3, result.TotalPages); // 25 items / 10 per page = 3 pages
    }

    #endregion

    #region GetProductByIdAsync Tests

    [Fact]
    public async Task GetProductByIdAsync_ShouldReturnProduct_WhenProductExists()
    {
        // Arrange
        var product = new Product 
        { 
            Id = 1, 
            Sku = "SKU-001", 
            Name = "Test Product", 
            Price = 100, 
            Currency = "BOB", 
            Stock = 10, 
            ImageUrl = "http://test.com/1.jpg" 
        };

        _mockRepository.Setup(r => r.GetByIdAsync(1)).ReturnsAsync(product);

        // Act
        var result = await _productService.GetProductByIdAsync(1);

        // Assert
        Assert.NotNull(result);
        Assert.Equal(1, result.Id);
        Assert.Equal("SKU-001", result.Sku);
        Assert.Equal("Test Product", result.Name);
    }

    [Fact]
    public async Task GetProductByIdAsync_ShouldReturnNull_WhenProductNotFound()
    {
        // Arrange
        _mockRepository.Setup(r => r.GetByIdAsync(999)).ReturnsAsync((Product?)null);

        // Act
        var result = await _productService.GetProductByIdAsync(999);

        // Assert
        Assert.Null(result);
    }

    #endregion

    #region UpdatePriceAsync Tests

    [Fact]
    public async Task UpdatePriceAsync_ShouldReturnUpdatedProduct_WhenUpdateSucceeds()
    {
        // Arrange
        var updatedProduct = new Product 
        { 
            Id = 1, 
            Sku = "SKU-001", 
            Name = "Test Product", 
            Price = 150, 
            Currency = "USD", 
            Stock = 10, 
            ImageUrl = "http://test.com/1.jpg" 
        };

        _mockRepository.Setup(r => r.UpdatePriceAsync(1, 150, "USD")).ReturnsAsync(true);
        _mockRepository.Setup(r => r.GetByIdAsync(1)).ReturnsAsync(updatedProduct);

        var dto = new UpdatePriceDto(150, "USD");

        // Act
        var result = await _productService.UpdatePriceAsync(1, dto);

        // Assert
        Assert.NotNull(result);
        Assert.Equal(150, result.Price);
        Assert.Equal("USD", result.Currency);
    }

    [Fact]
    public async Task UpdatePriceAsync_ShouldReturnNull_WhenProductNotFound()
    {
        // Arrange
        _mockRepository.Setup(r => r.UpdatePriceAsync(999, 150, "USD")).ReturnsAsync(false);

        var dto = new UpdatePriceDto(150, "USD");

        // Act
        var result = await _productService.UpdatePriceAsync(999, dto);

        // Assert
        Assert.Null(result);
    }

    [Fact]
    public async Task UpdatePriceAsync_ShouldCallRepository_WithCorrectParameters()
    {
        // Arrange
        _mockRepository.Setup(r => r.UpdatePriceAsync(1, 200.50m, "BOB")).ReturnsAsync(true);
        _mockRepository.Setup(r => r.GetByIdAsync(1)).ReturnsAsync(new Product { Id = 1, Sku = "SKU-001", Name = "Test", Price = 200.50m, Currency = "BOB", Stock = 10 });

        var dto = new UpdatePriceDto(200.50m, "BOB");

        // Act
        await _productService.UpdatePriceAsync(1, dto);

        // Assert
        _mockRepository.Verify(r => r.UpdatePriceAsync(1, 200.50m, "BOB"), Times.Once);
    }

    #endregion
}
