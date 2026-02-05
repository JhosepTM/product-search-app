# Build stage
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copy solution and project files for restore
COPY SearchProducts.sln .
COPY src/SearchProducts.Domain/SearchProducts.Domain.csproj src/SearchProducts.Domain/
COPY src/SearchProducts.Application/SearchProducts.Application.csproj src/SearchProducts.Application/
COPY src/SearchProducts.Infrastructure/SearchProducts.Infrastructure.csproj src/SearchProducts.Infrastructure/
COPY src/SearchProducts.API/SearchProducts.API.csproj src/SearchProducts.API/

# Restore dependencies
RUN dotnet restore

# Copy all source code
COPY src/ src/

# Build and publish
RUN dotnet publish src/SearchProducts.API/SearchProducts.API.csproj -c Release -o /app/publish --no-restore

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app

# Create non-root user
RUN adduser --disabled-password --gecos "" appuser

COPY --from=build /app/publish .

# Switch to non-root user
USER appuser

EXPOSE 8080

ENV ASPNETCORE_URLS=http://+:8080
ENV ASPNETCORE_ENVIRONMENT=Production

ENTRYPOINT ["dotnet", "SearchProducts.API.dll"]
