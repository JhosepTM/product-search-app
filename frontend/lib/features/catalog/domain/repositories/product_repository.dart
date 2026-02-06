import 'package:dartz/dartz.dart';
import 'package:frontend/core/errors/failures.dart';
import 'package:frontend/core/shared/domain/entities/records_entity.dart';
import 'package:frontend/features/catalog/domain/entities/profuct_filter_entity/product_filter_entity.dart';
import 'package:frontend/features/catalog/domain/entities/product_entity/product_entity.dart';

abstract interface class ProductRepository {
  /// Obtiene los productos de forma paginada
  ///
  /// Parámetros:
  /// - [page]: Número de página (comenzando en 1)
  /// - [limit]: Cantidad de registros por página
  ///
  /// Retorna [RecordsEntity<ProductEntity>] con los productos e información de paginación
  Future<Either<Failure, RecordsEntity<ProductEntity>>> getPaginatedProducts({
    required int page,
    required int limit,
    ProductFilterEntity? filter,
  });

  /// Actualiza el precio de un producto específico
  ///
  /// Parámetros:
  /// - [productId]: ID del producto a actualizar
  /// - [newPrice]: Nuevo precio del producto
  ///
  /// Retorna true si la actualización fue exitosa
  Future<Either<Failure, bool>> updateProductPrice({
    required int productId,
    required double newPrice,
  });
}
