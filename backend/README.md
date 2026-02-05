# SearchProducts API - Backend

API REST construida con **.NET 9** y **Clean Architecture** para gestionar un catálogo de productos.

## Arquitectura

```
backend/
├── src/
│   ├── SearchProducts.Domain/          # Entidades e interfaces del dominio
│   ├── SearchProducts.Application/     # DTOs, Servicios, Validadores
│   ├── SearchProducts.Infrastructure/  # EF Core, Repositorios, Seeder
│   └── SearchProducts.API/            # Controllers, Middleware, Program.cs
├── Dockerfile
├── docker-compose.yml
└── .env
```

**Capas y responsabilidades:**
- **Domain**: Entidades (`Product`) e interfaces (`IProductRepository`). Sin dependencias externas.
- **Application**: Lógica de negocio, DTOs, validaciones con FluentValidation, respuestas paginadas.
- **Infrastructure**: Implementación de repositorios, EF Core con PostgreSQL, migraciones, seeder.
- **API**: Controladores REST, middleware de errores y autenticación por API Key.

## Endpoints

| Método | Ruta | Descripción |
|--------|------|-------------|
| `GET` | `/api/products` | Lista productos con filtros, ordenamiento y paginación |
| `GET` | `/api/products/{id}` | Obtiene un producto por ID |
| `PATCH` | `/api/products/{id}/price` | Actualiza solo el precio de un producto |

## Cómo ejecutar

### Con Docker (recomendado)

```bash
cd backend

# Copiar variables de entorno
cp .env.example .env

# Levantar los servicios
docker compose up -d

# La API estará disponible en http://localhost:8080
# Swagger UI en http://localhost:8080/swagger (solo en Development)
```

### Sin Docker (desarrollo local)

**Requisitos:**
- .NET 9 SDK
- PostgreSQL corriendo en localhost:5432

```bash
cd backend

# Restaurar dependencias
dotnet restore

# Aplicar migraciones (la API las aplica automáticamente al iniciar)
dotnet ef database update --project src/SearchProducts.Infrastructure --startup-project src/SearchProducts.API

# Ejecutar
dotnet run --project src/SearchProducts.API

# La API estará en http://localhost:5062
```

## Variables de entorno

| Variable | Descripción | Default |
|----------|-------------|---------|
| `POSTGRES_DB` | Nombre de la base de datos | `search_products` |
| `POSTGRES_USER` | Usuario de PostgreSQL | `postgres` |
| `POSTGRES_PASSWORD` | Contraseña de PostgreSQL | `postgres` |
| `DB_PORT` | Puerto expuesto de PostgreSQL | `5432` |
| `API_PORT` | Puerto expuesto de la API | `8080` |
| `ASPNETCORE_ENVIRONMENT` | Entorno de ejecución | `Production` |
