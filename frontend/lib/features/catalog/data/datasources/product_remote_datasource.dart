import 'package:dartz/dartz.dart';
import 'package:frontend/core/errors/failures.dart';
import 'package:frontend/core/shared/data/models/records_model.dart';
import 'package:frontend/features/catalog/data/models/product_model.dart';

abstract interface class ProductRemoteDataSource {
  Future<Either<Failure, RecordsModel<ProductModel>>> fetchPaginatedProducts({
    required int page,
    required int limit,
  });
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  @override
  Future<Either<Failure, RecordsModel<ProductModel>>> fetchPaginatedProducts({
    required int page,
    required int limit,
  }) async {
    try {
      // Simulando respuesta del backend
      await Future.delayed(const Duration(seconds: 1));

      // Response simulado del backend
      final mockResponse = {
        'products': [
          {
            'id': 1,
            'sku': 'SKU-1001',
            'name': 'Auriculares Bluetooth',
            'price': 199.90,
            'currency': 'BOB',
            'stock': 25
          },
          {
            'id': 2,
            'sku': 'SKU-1002',
            'name': 'Mouse Inalámbrico',
            'price': 89.90,
            'currency': 'BOB',
            'stock': 50
          },
          {
            'id': 3,
            'sku': 'SKU-1003',
            'name': 'Teclado Mecánico',
            'price': 299.90,
            'currency': 'BOB',
            'stock': 15
          },
        ],
        'pagination': {
          'limit': limit,
          'offset': (page - 1) * limit,
          'total': 42,
          'page': page,
          'totalPages': 5,
          'hasNextPage': page < 5,
          'hasPreviousPage': page > 1,
        }
      };

      // Convertir respuesta a RecordsModel
      final products = (mockResponse['products'] as List)
          .map((p) => ProductModel.fromJson(p as Map<String, dynamic>))
          .toList();

      final paginationInfo = PaginationInfoModel.fromJson(
        mockResponse['pagination'] as Map<String, dynamic>,
      );

      final records = RecordsModel<ProductModel>(
        data: products,
        pagination: paginationInfo,
      );

      return Right(records);
    } catch (e) {
      return Left<Failure, RecordsModel<ProductModel>>(
        ExampleFailure(message: 'Failed to fetch paginated products: \$e'),
      );
    }
  }
}
