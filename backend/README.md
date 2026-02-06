# SearchProducts API - Backend

API REST construida con **.NET 9** y **Clean Architecture** para gestionar un catálogo de productos.

## 📋 Tabla de Contenidos

- [Arquitectura](#-arquitectura)
- [Tecnologías](#-tecnologías)
- [Endpoints](#-endpoints)
- [DTOs y Validaciones](#-dtos-y-validaciones)
- [Middlewares](#-middlewares)
- [Cómo Ejecutar](#-cómo-ejecutar)
- [Tests](#-tests)
- [Variables de Entorno](#-variables-de-entorno)

---

## 🏗️ Arquitectura

El proyecto implementa **Clean Architecture** siguiendo los principios de separación de responsabilidades y dependencias hacia adentro.

### Estructura del Proyecto

```
backend/
├── src/
│   ├── SearchProducts.Domain/          # Capa de Dominio
│   │   └── Products/
│   │       ├── Product.cs              # Entidad del dominio
│   │       └── IProductRepository.cs   # Interfaz del repositorio
│   │
│   ├── SearchProducts.Application/     # Capa de Aplicación
│   │   ├── Common/                     # Respuestas genéricas
│   │   │   ├── ApiResponse.cs
│   │   │   ├── ApiErrorResponse.cs
│   │   │   └── PaginatedResponse.cs
│   │   └── Products/
│   │       ├── DTOs/                   # Data Transfer Objects
│   │       ├── Services/               # Servicios de negocio
│   │       └── Validators/             # Validadores FluentValidation
│   │
│   ├── SearchProducts.Infrastructure/  # Capa de Infraestructura
│   │   ├── Persistence/
│   │   │   ├── AppDbContext.cs         # DbContext EF Core
│   │   │   ├── Migrations/             # Migraciones
│   │   │   └── ProductConfiguration.cs # Configuración Fluent API
│   │   └── Products/
│   │       ├── ProductRepository.cs    # Implementación repositorio
│   │       └── ProductSeeder.cs        # Datos de prueba
│   │
│   └── SearchProducts.API/             # Capa de Presentación
│       ├── Products/
│       │   └── ProductsController.cs   # Controlador REST
│       ├── Middleware/
│       │   ├── ApiKeyMiddleware.cs     # Autenticación por API Key
│       │   └── ExceptionHandlingMiddleware.cs
│       └── Program.cs                  # Punto de entrada
│
├── tests/
│   └── SearchProducts.Tests/           # Pruebas unitarias
│       └── Products/
│           └── ProductServiceTests.cs
│
├── Dockerfile
├── docker-compose.yml
└── .env
```

### Capas y Responsabilidades

| Capa | Responsabilidad | Dependencias |
|------|-----------------|--------------|
| **Domain** | Entidades del negocio e interfaces de repositorio | Ninguna |
| **Application** | DTOs, Servicios, Validadores, Lógica de negocio | Domain |
| **Infrastructure** | EF Core, Repositorios, Migraciones, Seeders | Domain, Application |
| **API** | Controllers, Middlewares, Configuración | Application |

### Principios Aplicados

✅ **Dependency Inversion**: Las capas superiores dependen de abstracciones  
✅ **Single Responsibility**: Cada clase tiene una única responsabilidad  
✅ **Separation of Concerns**: Lógica separada por capas  
✅ **Repository Pattern**: Abstracción del acceso a datos

---

## 🛠️ Tecnologías

### Framework y Runtime

| Tecnología | Versión | Propósito |
|------------|---------|-----------|
| **.NET** | 9.0 | Framework principal |
| **ASP.NET Core** | 9.0 | Web API |
| **C#** | 13 | Lenguaje de programación |

### Dependencias Principales

| Paquete | Propósito |
|---------|-----------|
| **Entity Framework Core** | ORM para acceso a datos |
| **Npgsql.EntityFrameworkCore** | Proveedor PostgreSQL para EF Core |
| **FluentValidation** | Validación de DTOs con reglas fluidas |
| **Swashbuckle** | Generación de documentación OpenAPI/Swagger |

### Dependencias de Testing

| Paquete | Propósito |
|---------|-----------|
| **xUnit** | Framework de pruebas unitarias |
| **Moq** | Mocking de dependencias |
| **FluentAssertions** | Assertions expresivas (opcional) |

---

## 🌐 Endpoints

### GET /api/products

Obtiene una lista paginada de productos con filtros opcionales.

**Query Parameters:**

| Parámetro | Tipo | Default | Descripción |
|-----------|------|---------|-------------|
| `search` | string | null | Búsqueda por nombre o SKU |
| `minPrice` | decimal | null | Precio mínimo |
| `maxPrice` | decimal | null | Precio máximo |
| `currency` | string | null | Filtrar por moneda |
| `inStock` | bool | null | Filtrar por disponibilidad |
| `sortBy` | string | null | Campo para ordenar: `name`, `price`, `stock`, `sku` |
| `sortDescending` | bool | false | Orden descendente |
| `page` | int | 1 | Número de página |
| `pageSize` | int | 10 | Elementos por página (máx. 100) |

**Ejemplo de Request:**
```http
GET /api/products?search=laptop&minPrice=500&sortBy=price&page=1&pageSize=20
X-Api-Key: your-api-key
```

**Ejemplo de Response:**
```json
{
  "success": true,
  "data": {
    "items": [
      {
        "id": 1,
        "sku": "LAPTOP-001",
        "name": "Laptop Gaming Pro",
        "price": 999.99,
        "currency": "USD",
        "stock": 15,
        "imageUrl": "https://example.com/laptop.jpg"
      }
    ],
    "totalCount": 50,
    "page": 1,
    "pageSize": 20,
    "totalPages": 3
  }
}
```

---

### GET /api/products/{id}

Obtiene un producto por su ID.

**Ejemplo de Request:**
```http
GET /api/products/1
X-Api-Key: your-api-key
```

**Ejemplo de Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "id": 1,
    "sku": "LAPTOP-001",
    "name": "Laptop Gaming Pro",
    "price": 999.99,
    "currency": "USD",
    "stock": 15,
    "imageUrl": "https://example.com/laptop.jpg"
  }
}
```

**Ejemplo de Response (404 Not Found):**
```json
{
  "success": false,
  "message": "Product with ID 999 not found."
}
```

---

### PATCH /api/products/{id}/price

Actualiza únicamente el precio y moneda de un producto.

**Body:**
```json
{
  "price": 899.99,
  "currency": "USD"
}
```

**Ejemplo de Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "id": 1,
    "sku": "LAPTOP-001",
    "name": "Laptop Gaming Pro",
    "price": 899.99,
    "currency": "USD",
    "stock": 15,
    "imageUrl": "https://example.com/laptop.jpg"
  },
  "message": "Price updated successfully."
}
```

---

## 📝 DTOs y Validaciones

### ProductDto

DTO de salida que representa un producto.

```csharp
public record ProductDto(
    int Id,
    string Sku,
    string Name,
    decimal Price,
    string Currency,
    int Stock,
    string? ImageUrl);
```

### ProductFilterDto

DTO para filtrar y paginar productos.

```csharp
public record ProductFilterDto(
    string? Search = null,
    decimal? MinPrice = null,
    decimal? MaxPrice = null,
    string? Currency = null,
    bool? InStock = null,
    string? SortBy = null,
    bool SortDescending = false,
    int Page = 1,
    int PageSize = 10);
```

**Reglas de Validación:**
- `Page` >= 1
- `PageSize` entre 1 y 100
- `MinPrice` >= 0
- `MaxPrice` > 0
- `MinPrice` <= `MaxPrice` (si ambos están presentes)
- `SortBy` debe ser uno de: `name`, `price`, `stock`, `sku`

### UpdatePriceDto

DTO para actualizar el precio de un producto.

```csharp
public record UpdatePriceDto(decimal Price, string Currency);
```

**Reglas de Validación:**
- `Price` > 0
- `Currency` no puede estar vacío
- `Currency` máximo 3 caracteres

---

## 🛡️ Middlewares

### ApiKeyMiddleware

Middleware de autenticación por API Key.

**Características:**
- Header requerido: `X-Api-Key`
- Swagger/OpenAPI excluido de autenticación
- Si no hay API Key configurada, se permite el acceso

**Respuesta de Error (401):**
```json
{
  "success": false,
  "message": "Invalid or missing API key."
}
```

### ExceptionHandlingMiddleware

Middleware global para manejo de excepciones no controladas.

**Características:**
- Captura todas las excepciones no manejadas
- Registra en logs el error completo
- Retorna respuesta genérica al cliente

**Respuesta de Error (500):**
```json
{
  "success": false,
  "message": "An internal server error occurred."
}
```

---

## 🚀 Cómo Ejecutar

### Con Docker (Recomendado)

```bash
cd backend

# Copiar variables de entorno
cp .env.example .env

# Levantar servicios (PostgreSQL + API)
docker compose up -d

# Ver logs
docker compose logs -f api

# La API estará disponible en:
# - http://localhost:8080/api/products
# - http://localhost:8080/swagger (Swagger UI)
```

### Sin Docker (Desarrollo Local)

**Requisitos:**
- .NET 9 SDK
- PostgreSQL corriendo en localhost:5432

```bash
cd backend

# Restaurar dependencias
dotnet restore

# Aplicar migraciones (opcional, se aplican automáticamente)
dotnet ef database update \
    --project src/SearchProducts.Infrastructure \
    --startup-project src/SearchProducts.API

# Ejecutar en modo desarrollo
dotnet run --project src/SearchProducts.API

# La API estará en http://localhost:5062
```

---

## 🧪 Tests

### Ejecutar Tests

```bash
cd backend

# Ejecutar todas las pruebas
dotnet test

# Con cobertura
dotnet test --collect:"XPlat Code Coverage"

# Verbose output
dotnet test --verbosity detailed
```

### Tests Implementados

| Test | Descripción |
|------|-------------|
| `GetProductsAsync_ReturnsProducts` | Verifica paginación correcta |
| `GetProductsAsync_EmptySearch_ReturnsEmpty` | Verifica respuesta vacía |
| `GetProductsAsync_WithSearch_FiltersCorrectly` | Verifica filtro de búsqueda |
| `GetProductByIdAsync_ExistingId_ReturnsProduct` | Verifica obtener producto |
| `GetProductByIdAsync_NonExistingId_ReturnsNull` | Verifica producto no encontrado |
| `UpdatePriceAsync_ExistingProduct_UpdatesSuccessfully` | Verifica actualización |
| `UpdatePriceAsync_NonExistingProduct_ReturnsNull` | Verifica error de actualización |
| `GetProductsAsync_WithPriceFilter_FiltersCorrectly` | Verifica filtro por precio |
| `GetProductsAsync_Pagination_ReturnsCorrectPage` | Verifica paginación |

---

## ⚙️ Variables de Entorno

### Archivo `.env.example`

```env
# PostgreSQL
POSTGRES_DB=search_products
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
DB_PORT=5432

# API
API_PORT=8080
API_KEY=your-secret-api-key
ASPNETCORE_ENVIRONMENT=Development
```

### Descripción de Variables

| Variable | Descripción | Default |
|----------|-------------|---------|
| `POSTGRES_DB` | Nombre de la base de datos | `search_products` |
| `POSTGRES_USER` | Usuario de PostgreSQL | `postgres` |
| `POSTGRES_PASSWORD` | Contraseña de PostgreSQL | `postgres` |
| `DB_PORT` | Puerto expuesto de PostgreSQL | `5432` |
| `API_PORT` | Puerto expuesto de la API | `8080` |
| `ASPNETCORE_ENVIRONMENT` | Entorno de ejecución | `Production` |

