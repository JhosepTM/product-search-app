using FluentValidation;
using Microsoft.AspNetCore.Mvc;
using SearchProducts.Application.Common;
using SearchProducts.Application.DTOs;
using SearchProducts.Application.Services;

namespace SearchProducts.API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ProductsController : ControllerBase
{
    private readonly IProductService _productService;
    private readonly IValidator<ProductFilterDto> _filterValidator;
    private readonly IValidator<UpdatePriceDto> _priceValidator;

    public ProductsController(
        IProductService productService,
        IValidator<ProductFilterDto> filterValidator,
        IValidator<UpdatePriceDto> priceValidator)
    {
        _productService = productService;
        _filterValidator = filterValidator;
        _priceValidator = priceValidator;
    }

    /// <summary>
    /// Get all products with optional filtering, sorting, and pagination.
    /// </summary>
    [HttpGet]
    public async Task<IActionResult> GetAll([FromQuery] ProductFilterDto filter)
    {
        var validation = await _filterValidator.ValidateAsync(filter);
        if (!validation.IsValid)
        {
            var errors = validation.Errors
                .GroupBy(e => e.PropertyName)
                .ToDictionary(g => g.Key, g => g.Select(e => e.ErrorMessage).ToArray());

            return BadRequest(new ApiErrorResponse(false, "Validation failed.", errors));
        }

        var result = await _productService.GetProductsAsync(filter);
        return Ok(new ApiResponse<PaginatedResponse<ProductDto>>(true, result));
    }

    /// <summary>
    /// Get a product by its ID.
    /// </summary>
    [HttpGet("{id:int}")]
    public async Task<IActionResult> GetById(int id)
    {
        var product = await _productService.GetProductByIdAsync(id);
        if (product is null)
            return NotFound(new ApiErrorResponse(false, $"Product with ID {id} not found."));

        return Ok(new ApiResponse<ProductDto>(true, product));
    }

    /// <summary>
    /// Update only the price and currency of a product.
    /// </summary>
    [HttpPatch("{id:int}/price")]
    public async Task<IActionResult> UpdatePrice(int id, [FromBody] UpdatePriceDto dto)
    {
        var validation = await _priceValidator.ValidateAsync(dto);
        if (!validation.IsValid)
        {
            var errors = validation.Errors
                .GroupBy(e => e.PropertyName)
                .ToDictionary(g => g.Key, g => g.Select(e => e.ErrorMessage).ToArray());

            return BadRequest(new ApiErrorResponse(false, "Validation failed.", errors));
        }

        var product = await _productService.UpdatePriceAsync(id, dto);
        if (product is null)
            return NotFound(new ApiErrorResponse(false, $"Product with ID {id} not found."));

        return Ok(new ApiResponse<ProductDto>(true, product, "Price updated successfully."));
    }
}
