using FluentValidation;
using SearchProducts.Application.Products.DTOs;

namespace SearchProducts.Application.Products.Validators;

public class UpdatePriceValidator : AbstractValidator<UpdatePriceDto>
{
    public UpdatePriceValidator()
    {
        RuleFor(x => x.Price)
            .GreaterThan(0)
            .WithMessage("Price must be greater than 0.");

        RuleFor(x => x.Currency)
            .NotEmpty()
            .WithMessage("Currency must not be empty.")
            .MaximumLength(3)
            .WithMessage("Currency must be at most 3 characters.");
    }
}
