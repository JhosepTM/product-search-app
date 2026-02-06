import 'package:dartz/dartz.dart';
import 'package:frontend/core/errors/failures.dart';
import 'package:frontend/core/network/http_client.dart';
import 'package:frontend/core/shared/data/models/records_model.dart';
import 'package:frontend/features/catalog/data/models/product_filter_model.dart';
import 'package:frontend/features/catalog/data/models/product_model.dart';

abstract interface class ProductRemoteDataSource {
  Future<Either<Failure, RecordsModel<ProductModel>>> fetchPaginatedProducts({
    required int page,
    required int limit,
    ProductFilterModel? filter,
  });

  Future<Either<Failure, bool>> patchProductPrice({
    required int id,
    required double price,
    required String currency,
  });
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final HttpClientHelper _httpClient;

  ProductRemoteDataSourceImpl({required HttpClientHelper httpClient})
    : _httpClient = httpClient;

  @override
  Future<Either<Failure, RecordsModel<ProductModel>>> fetchPaginatedProducts({
    required int page,
    required int limit,
    ProductFilterModel? filter,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'Price': page,
        'PageSize': limit,
        ...?filter?.toQueryParameters(),
      };

      final response = await _httpClient.requestHelper(
        endpoint: '/api/products',
        typeOfRequests: TypeRequests.get,
        queryParameters: queryParameters,
      );

      final body = response.data as Map<String, dynamic>;

      if (body['success'] != true) {
        return const Left(
          ServerFailure(message: 'API returned an error response.'),
        );
      }

      final data = body['data'] as Map<String, dynamic>;
      final itemsList = data['items'] as List;
      final totalCount = data['totalCount'] as int;
      final currentPage = data['page'] as int;
      final pageSize = data['pageSize'] as int;
      final totalPages = data['totalPages'] as int;

      final products = itemsList
          .map((p) => ProductModel.fromJson(p as Map<String, dynamic>))
          .toList();

      final pagination = PaginationInfoModel(
        limit: pageSize,
        offset: (currentPage - 1) * pageSize,
        total: totalCount,
        page: currentPage,
        totalPages: totalPages,
        hasNextPage: currentPage < totalPages,
        hasPreviousPage: currentPage > 1,
      );

      return Right(
        RecordsModel<ProductModel>(data: products, pagination: pagination),
      );
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to fetch products: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> patchProductPrice({
    required int id,
    required double price,
    required String currency,
  }) async {
    try {
      final response = await _httpClient.requestHelper(
        endpoint: '/api/Products/$id/price',
        typeOfRequests: TypeRequests.patch,
        data: {'price': price, 'currency': currency},
      );

      final body = response.data as Map<String, dynamic>;

      if (body['success'] != true) {
        return const Left(
          ServerFailure(message: 'Error al actualizar el precio del producto.'),
        );
      }

      return const Right(true);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to update product price: $e'));
    }
  }
}
