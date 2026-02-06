using FluentValidation;
using SearchProducts.Application.Products.DTOs;

namespace SearchProducts.Application.Products.Validators;

public class ProductFilterValidator : AbstractValidator<ProductFilterDto>
{
    private static readonly string[] AllowedSortFields = ["name", "price", "stock", "sku"];

    public ProductFilterValidator()
    {
        RuleFor(x => x.Page)
            .GreaterThanOrEqualTo(1)
            .WithMessage("Page must be at least 1.");

        RuleFor(x => x.PageSize)
            .InclusiveBetween(1, 100)
            .WithMessage("PageSize must be between 1 and 100.");

        RuleFor(x => x.MinPrice)
            .GreaterThanOrEqualTo(0)
            .When(x => x.MinPrice.HasValue)
            .WithMessage("MinPrice must be >= 0.");

        RuleFor(x => x.MaxPrice)
            .GreaterThan(0)
            .When(x => x.MaxPrice.HasValue)
            .WithMessage("MaxPrice must be > 0.");

        RuleFor(x => x)
            .Must(x => !x.MinPrice.HasValue || !x.MaxPrice.HasValue || x.MinPrice <= x.MaxPrice)
            .WithMessage("MinPrice must be less than or equal to MaxPrice.");

        RuleFor(x => x.SortBy)
            .Must(s => s == null || AllowedSortFields.Contains(s.ToLowerInvariant()))
            .WithMessage($"SortBy must be one of: {string.Join(", ", AllowedSortFields)}.");
    }
}
