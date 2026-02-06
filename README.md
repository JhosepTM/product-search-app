# Product Search App

Aplicación de búsqueda de productos con **Flutter** (frontend) y **.NET 9** (backend).

---

## ✅ Requisitos Cumplidos

### Backend (.NET)
| Requisito | Estado |
|-----------|--------|
| GET productos (listado) | ✅ |
| GET productos con filtro (name/sku) | ✅ |
| PATCH precio del producto | ✅ |
| Validación precio > 0 | ✅ |
| Producto no existe → 404 | ✅ |
| Persistencia (PostgreSQL + EF Core) | ✅ |
| DTOs y status codes HTTP correctos | ✅ |

### Frontend (Flutter)
| Requisito | Estado |
|-----------|--------|
| Listado de productos (nombre, sku, precio, moneda, stock) | ✅ |
| Indicador de carga (skeleton) | ✅ |
| Manejo de errores con mensajes claros | ✅ |
| Búsqueda por nombre o SKU con debounce | ✅ |
| Editar precio (solo ese campo) + PATCH | ✅ |
| Reflejar precio actualizado en listado | ✅ |

---

## ⭐ Plus Implementados

| Feature | Descripción |
|---------|-------------|
| **Paginación + Infinite Scroll** | Carga progresiva de productos al hacer scroll |
| **Ordenamiento** | Por precio (asc/desc), nombre, stock |
| **Filtros avanzados** | Rango de precio, con/sin stock, moneda |
| **Cache local** | HydratedBloc para persistir estado |
| **Tests unitarios** | 23 tests (Flutter: 14, .NET: 9) |
| **Logging (Talker)** | Registro de eventos y errores con pantalla de debug |
| **UI cuidada** | Tema claro/oscuro, estados vacíos, skeleton loaders |
| **Componentes reutilizables** | Widgets separados, sheets modularizados |
| **Toast notifications** | Feedback visual para éxito/error |
| **Arquitectura limpia** | Clean Architecture + BLoC pattern |

---

## 🚀 Ejecución

### Opción 1: Con Docker (Recomendado)

```bash
# 1. Clonar repositorio
git clone <repo-url>
cd product-search-app

# 2. Configurar variables de entorno del backend
cd backend
cp .env.example .env
# Editar .env si es necesario

# 3. Levantar servicios (PostgreSQL + API)
docker-compose up -d

# 4. Configurar frontend
cd ../frontend
cp .env.example .env
```

Editar `frontend/.env`:
```dotenv
# Para desarrollo local sin Docker:
API_BASE_URL=http://localhost:8080
API_KEY=

# Para Android emulator con localhost:
API_BASE_URL=http://10.0.2.2:8080
API_KEY=
```

```bash
# 5. Ejecutar Flutter
flutter pub get
flutter run
```

### Opción 2: Sin Docker

#### Requisitos
- .NET 9 SDK
- PostgreSQL 14+
- Flutter 3.10+

#### Backend

```bash
cd backend

# 1. Configurar PostgreSQL
# Crear base de datos: search_products

# 2. Configurar conexión en appsettings.Development.json
# ConnectionStrings.DefaultConnection = "Host=localhost;Port=5432;Database=search_products;Username=postgres;Password=tu_password"

# 3. Aplicar migraciones
dotnet ef database update --project src/SearchProducts.Infrastructure --startup-project src/SearchProducts.API

# 4. Ejecutar API
dotnet run --project src/SearchProducts.API
# API disponible en: http://localhost:8080
```

#### Frontend

```bash
cd frontend

# 1. Configurar .env
cp .env.example .env
```

Editar `frontend/.env`:
```dotenv
# Para desarrollo local sin Docker:
API_BASE_URL=http://localhost:8080
API_KEY=

# Para Android emulator con localhost:
API_BASE_URL=http://10.0.2.2:8080
API_KEY=
```

```bash
# 2. Instalar dependencias
flutter pub get

# 3. Ejecutar
flutter run
```

---

## 📁 Estructura del Proyecto

```
product-search-app/
├── backend/                    # .NET 9 API
│   ├── src/
│   │   ├── SearchProducts.API/           # Controllers, Middleware
│   │   ├── SearchProducts.Application/   # Services, DTOs, Validators
│   │   ├── SearchProducts.Domain/        # Entities, Interfaces
│   │   └── SearchProducts.Infrastructure/ # EF Core, Repositories
│   └── tests/
│       └── SearchProducts.Tests/         # Unit tests (xUnit + Moq)
│
└── frontend/                   # Flutter App
    ├── lib/
    │   ├── application/        # DI, Routes, Theme
    │   ├── core/               # Network, Errors, Utils
    │   ├── features/
    │   │   ├── catalog/        # Productos (domain/data/presentation)
    │   │   └── settings/       # Configuración
    │   └── shared/             # Widgets compartidos
    └── test/                   # Unit & Widget tests
```

---

## 🧪 Ejecutar Tests

```bash
# Backend
cd backend
dotnet test

# Frontend
cd frontend
flutter test
```

---

## 🔧 Decisiones Técnicas

| Área | Decisión | Justificación |
|------|----------|---------------|
| **Backend** | Clean Architecture + CQRS simplificado | Separación de responsabilidades, testeable |
| **Persistencia** | PostgreSQL + EF Core | Robusto, migrations, relacional |
| **Frontend** | BLoC + Freezed | Estado predecible, código generado inmutable |
| **Estado local** | HydratedBloc | Persistencia automática del estado |
| **HTTP** | Dio | Interceptors, manejo de errores centralizado |
| **Logging** | Talker | Debug visual en desarrollo |

---

## Resumen

La aplicación incluye:
- Listado con skeleton loading
- Filtros y búsqueda en tiempo real
- Bottom sheet para editar precio
- Indicadores de stock (normal, bajo, sin stock)
- Tema claro y oscuro

Nota: Cada repositorio de backend y frontend cuenta con un README que tiene mas detalles 
