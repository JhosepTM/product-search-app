namespace SearchProducts.Application.Common;

public record ApiResponse<T>(bool Success, T? Data, string? Message = null);

public record ApiErrorResponse(bool Success, string Message, IDictionary<string, string[]>? Errors = null);
