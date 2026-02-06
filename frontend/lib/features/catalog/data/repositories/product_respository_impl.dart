import 'package:dartz/dartz.dart';
import 'package:frontend/core/errors/failures.dart';
import 'package:frontend/core/shared/domain/entities/records_entity.dart';
import 'package:frontend/features/catalog/data/datasources/product_remote_datasource.dart';
import 'package:frontend/features/catalog/data/models/product_filter_model.dart';
import 'package:frontend/features/catalog/domain/entities/profuct_filter_entity/product_filter_entity.dart';
import 'package:frontend/features/catalog/domain/entities/product_entity/product_entity.dart';
import 'package:frontend/features/catalog/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl({required this.productRemoteDataSource});

  final ProductRemoteDataSource productRemoteDataSource;

  @override
  Future<Either<Failure, RecordsEntity<ProductEntity>>> getPaginatedProducts({
    required int page,
    required int limit,
    ProductFilterEntity? filter,
  }) async {
    final filterModel = filter == null ? null : ProductFilterModel.fromEntity(filter);
    final result = await productRemoteDataSource.fetchPaginatedProducts(
      page: page,
      limit: limit,
      filter: filterModel,
    );

    return result.fold(
      (failure) => Left(failure),
      (recordsModel) {
        // Convertir ProductModel a ProductEntity
        final products = recordsModel.data
            .map((model) => ProductEntity.fromEntity(model))
            .toList();

        // Convertir PaginationInfoModel a PaginationInfoEntity
        final pagination = PaginationInfoEntity(
          limit: recordsModel.pagination.limit,
          offset: recordsModel.pagination.offset,
          total: recordsModel.pagination.total,
          page: recordsModel.pagination.page,
          totalPages: recordsModel.pagination.totalPages,
          hasNextPage: recordsModel.pagination.hasNextPage,
          hasPreviousPage: recordsModel.pagination.hasPreviousPage,
        );

        final records = RecordsEntity<ProductEntity>(
          data: products,
          pagination: pagination,
        );

        return Right(records);
      },
    );
  }

  @override
  Future<Either<Failure, bool>> updateProductPrice({
    required int productId,
    required double newPrice,
    required String currency,
  }) async {
    return await productRemoteDataSource.patchProductPrice(
      id: productId,
      price: newPrice,
      currency: currency,
    );
  }
}
