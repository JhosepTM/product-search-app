# Frontend - Search Product App

Aplicación Flutter para la búsqueda y gestión de catálogo de productos. Este proyecto implementa patrones arquitectónicos modernos y buenas prácticas de desarrollo.

## 📋 Tabla de Contenidos

- [Arquitectura](#arquitectura)
- [Dependencias](#dependencias)
- [Patrón BLoC](#patrón-bloc)
- [Configuración](#configuración)
- [Logs](#logs)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Instalación](#instalación)

---

## 🏗️ Arquitectura

El proyecto utiliza **Feature-First Architecture**, una arquitectura modular donde el código está organizado por features (características) del negocio, cada una siendo independiente y auto-contenida.

### Principios Clave

- **Separación por Capas**: Dentro de cada feature existen tres capas principales:
  - **Presentation**: UI, Widgets y BLoCs
  - **Domain**: Lógica de negocio, entidades y repositorios (interfaces)
  - **Data**: Implementación de repositorios, data sources y modelos

- **Independencia**: Cada feature es independiente y puede ser desarrollada, testeada y mantenida de forma aislada

- **Reutilización**: Código compartido se ubica en carpetas `core` y `shared`

### Estructura Visual

```
lib/
├── application/           # Configuración global (inyección, rutas, tema)
├── core/                  # Código compartido (configuración, utilidades, errores)
├── features/              # Features independientes
│   ├── catalog/          # Feature para catálogo de productos
│   ├── home/             # Feature para pantalla principal
│   ├── settings/         # Feature para configuraciones
│   └── splash/           # Feature para splash screen
└── shared/               # Utilidades y widgets compartidos
```

### Ventajas de Feature-First

✅ **Escalabilidad**: Fácil agregar nuevas features sin afectar existentes  
✅ **Mantenibilidad**: Código organizado y predecible  
✅ **Testabilidad**: Cada feature puede testearse de forma aislada  
✅ **Reusabilidad**: Lógica compartida en núcleos centrales  
✅ **Colaboración**: Múltiples equipos pueden trabajar en features paralelas

---

## 📦 Dependencias

### Dependencias Principales

| Paquete | Versión | Propósito |
|---------|---------|----------|
| **flutter_bloc** | ^9.1.1 | Gestión de estado con BLoC |
| **hydrated_bloc** | ^10.1.1 | Persistencia de estado BLoC |
| **flutter_form_builder** | ^10.3.0+1 | Construcción y validación de formularios |
| **dio** | ^5.9.1 | Cliente HTTP para peticiones API |
| **go_router** | ^17.1.0 | Sistema de enrutamiento y navegación |
| **flex_color_scheme** | ^8.4.0 | Sistema de temas de color avanzado |
| **freezed** | ^3.2.5 | Generación de código para modelos inmutables |
| **freezed_annotation** | ^3.1.0 | Anotaciones para freezed |
| **json_annotation** | ^4.10.0 | Anotaciones para serialización JSON |
| **dartz** | ^0.10.1 | Programación funcional (Either, Task, etc.) |
| **get_it** | ^9.2.0 | Inyección de dependencias |
| **equatable** | ^2.0.8 | Comparación de objetos por valor |
| **path_provider** | ^2.0.14 | Acceso a directorios del sistema |
| **flutter_dotenv** | ^6.0.0 | Carga de variables de entorno (.env) |
| **toastification** | ^3.0.3 | Notificaciones toast personalizables |
| **talker_flutter** | ^5.1.13 | Sistema de logging integrado |

### Dependencias de Desarrollo

| Paquete | Propósito |
|---------|----------|
| **build_runner** | Generación de código (freezed, json_serializable) |
| **json_serializable** | Serialización JSON automática |
| **mocktail** | Mocking para pruebas unitarias |

---

## 🎮 Patrón BLoC

El patrón **BLoC (Business Logic Component)** es el corazón de la gestión de estado en esta aplicación. Proporciona una forma clara de separar la lógica de negocios de la interfaz de usuario.

### Concepto General

```
Usuario/Evento
    ↓
   BLoC
    ↓
Estado
    ↓
UI Actualizada
```

### BLoCs Implementados

#### 1. **ProductBloc**
Gestiona toda la lógica relacionada con productos.

**Eventos (Events)**:
- `GetProductsEvent`: Obtiene productos paginados
- `UpdateProductPriceEvent`: Actualiza el precio de un producto
- `FilterProductsEvent`: Filtra productos según criterios

**Estados (States)**:
- `ProductInitial`: Estado inicial
- `ProductLoading`: Cargando productos
- `ProductSuccess`: Productos obtenidos exitosamente
- `ProductError`: Error al obtener productos
- `PriceUpdateLoading`: Actualizando precio
- `PriceUpdateSuccess`: Precio actualizado exitosamente
- `PriceUpdateError`: Error al actualizar precio

#### 2. **SettingsBloc**
Gestiona configuraciones de aplicación (tema, idioma, etc.).

**Eventos (Events)**:
- `ToggleDarkModeEvent`: Alterna entre modo claro y oscuro
- `ChangeSettingsEvent`: Cambia configuraciones generales

**Estados (States)**:
- `SettingsState`: Estado actual de configuraciones

**Características**:
- ✅ Persistencia automática con HydratedBloc
- ✅ Sincronización en tiempo real
- ✅ Recuperación de estado al reiniciar

### Inyección de Dependencias con GetIt

El archivo `application/injector.dart` maneja toda la inyección de dependencias para seguir un patron singleton donde solo se tenga una isntancai del bloc, repsoitorio, datasource y casos de uso

## ⚙️ Configuración

### Variables de Entorno (.env)

#### Crear archivo `.env`
1. Copia `.env.example` a `.env`
2. Rellena los valores según tu entorno:
   ```dotenv
   API_BASE_URL=http://tu-servidor-api:8080
   ```

### Configuración de Temas

El sistema de temas está en `application/theme/app_theme.dart` usando `FlexColorScheme`:

```dart
// Tema claro
ThemeData theme = AppTheme.light;

// Tema oscuro
ThemeData darkTheme = AppTheme.dark;

// Alternancia en tiempo real vía SettingsBloc
themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
```

---

## 📝 Logs

La aplicación utiliza **TalkerFlutter** para un sistema de logging robusto y visualizable. Talker proporciona una interfaz elegante para ver logs en tiempo real durante el desarrollo.

### Configuración de Talker

El archivo `core/utils/talker_util.dart` define la instancia global:

### Niveles de Log

| Nivel | Color | Uso |
|-------|-------|-----|
| **CRITICAL** | 🔴 Rojo Bold | Errores fatales que requieren atención inmediata |
| **ERROR** | 🔴 Rojo | Errores que afectan funcionalidad |
| **WARNING** | 🟡 Amarillo | Advertencias, situaciones inusuales |
| **INFO** | 🔵 Cyan | Información general, milestones |
| **DEBUG** | ⚫ Gris | Detalles para debugging |
| **VERBOSE** | ⚫ Gris | Información muy detallada |

### Tipos de Logs Específicos

```dart
// Log simple
talker.info('Usuario inició sesión');

// Log de error
talker.error('Fallo en conexión API', exception);

// Log de advertencia
talker.warning('Reintentando conexión...');

// Log crítico
talker.critical('Estado crítico detectado', exception);

// Log de debug
talker.debug('Valor de variable: $variableName');

// Logging de HTTP
talker.logTyped(HttpLogs('GET', '/api/products', response));
```

### Accesar a los Logs en la UI (Modo Debug)

#### **Shake Detector** (Agitar el dispositivo)
- En modo debug, agitar el dispositivo abre automáticamente la interfaz de TalkerFlutter
- Muestra todo el historial de logs en tiempo real
- Disponible en emuladores y dispositivos físicos

#### Pasos para Acceder a los Logs por Configuración (.env)

1. **Asegúrate de estar en Modo Debug**:
   ```sh
   flutter run -v
   ```

2. **Opción A - Agitar el Dispositivo**:
   - En emulador Android: Usa el menú de funciones (●) → Pinch
   - En iOS: Haz un gesto de agitación con el cursor
   - En dispositivo físico: Agita el teléfono

3. **Opción B - Acceso Automático**:
   - Los logs se muestran en la consola de Flutter automáticamente
   - Ejecuta: `flutter logs` en una terminal separada

4. **Opción C - Programático**:
   - Integral en tu código para logs específicos
   - Ver sección de Acceso Programático arriba

## 🚀 Instalación

### Requisitos Previos

- Flutter SDK (^3.10.4)
- Dart SDK (incluido en Flutter)
- Una IDE (VS Code, Android Studio, etc)

### Pasos de Instalación

1. **Clonar el repositorio**
   ```sh
   git clone <tu-repo>
   cd product-search-app/frontend
   ```

2. **Crear archivo .env**
   ```sh
   cp .env.example .env
   # Editar .env con tus valores
   ```

3. **Instalar dependencias**
   ```sh
   flutter pub get
   ```

4. **Generar código (freezed, json_serializable)**
   ```sh
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. **Ejecutar la aplicación**
   ```sh
   # En desarrollo
   flutter run -v
   
   # En un dispositivo específico
   flutter run -d <device-id>
   
   # En modo release
   flutter run --release
   ```

6. **Ver logs en desarrollo**
   - Agita tu dispositivo/emulador para abrir TalkerFlutter
   - O revisa los logs en la consola: `flutter logs`
