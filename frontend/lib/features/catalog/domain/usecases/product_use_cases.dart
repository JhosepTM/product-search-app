import 'package:frontend/core/core.dart';
import 'package:frontend/core/shared/domain/entities/records_entity.dart';
import 'package:frontend/features/catalog/domain/entities/product_entity.dart';
import 'package:frontend/features/catalog/domain/repositories/product_repository.dart';

class ProductUseCases {
  const ProductUseCases({required ProductRepository repository})
      : _productRepository = repository;

  final ProductRepository _productRepository;

  /// Obtiene los productos de forma paginada
  ///
  /// Parámetros:
  /// - [page]: Número de página (comenzando en 1)
  /// - [limit]: Cantidad de registros por página (por defecto 10)
  ///
  /// Retorna un [Future] con [Either]:
  /// - [Right]: [RecordsEntity<ProductEntity>] con los productos y paginación
  /// - [Left]: [Failure] en caso de error
  Future<Either<Failure, RecordsEntity<ProductEntity>>> getPaginatedProducts({
    required int page,
    int limit = 10,
  }) async {
    return await _productRepository.getPaginatedProducts(
      page: page,
      limit: limit,
    );
  }

  /// Actualiza el precio de un producto específico
  ///
  /// Parámetros:
  /// - [productId]: ID del producto a actualizar
  /// - [newPrice]: Nuevo precio del producto
  ///
  /// Retorna un [Future] con [Either]:
  /// - [Right]: true si la actualización fue exitosa
  /// - [Left]: [Failure] en caso de error
  Future<Either<Failure, bool>> updateProductPrice({
    required int productId,
    required double newPrice,
  }) async {
    if (newPrice < 0) {
      return Left(
        ExampleFailure(message: 'El precio no puede ser negativo'),
      );
    }

    return await _productRepository.updateProductPrice(
      productId: productId,
      newPrice: newPrice,
    );
  }
}
