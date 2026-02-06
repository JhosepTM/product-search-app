import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/errors/failures.dart';
import 'package:frontend/core/shared/domain/entities/records_entity.dart';
import 'package:frontend/features/catalog/domain/entities/product_entity/product_entity.dart';
import 'package:frontend/features/catalog/domain/repositories/product_repository.dart';
import 'package:frontend/features/catalog/domain/usecases/product_use_cases.dart';
import 'package:frontend/features/catalog/presentation/blocs/product_bloc/product_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockProductRepository extends Mock implements ProductRepository {}

class MockStorage extends Mock implements Storage {}

void main() {
  late ProductBloc productBloc;
  late MockProductRepository mockRepository;
  late ProductUseCases productUseCases;
  late Storage storage;

  setUpAll(() {
    storage = MockStorage();
    when(() => storage.write(any(), any<dynamic>())).thenAnswer((_) async {});
    when(() => storage.read(any())).thenReturn(null);
    when(() => storage.delete(any())).thenAnswer((_) async {});
    when(() => storage.clear()).thenAnswer((_) async {});
    HydratedBloc.storage = storage;
  });

  setUp(() {
    mockRepository = MockProductRepository();
    productUseCases = ProductUseCases(repository: mockRepository);
    productBloc = ProductBloc(productUseCases: productUseCases);
  });

  tearDown(() {
    productBloc.close();
  });

  group('ProductBloc', () {
    final tProducts = [
      const ProductEntity(
        id: 1,
        sku: 'SKU-001',
        name: 'Product 1',
        price: 100.0,
        currency: 'BOB',
        stock: 10,
        imageUrl: 'https://example.com/image1.jpg',
      ),
      const ProductEntity(
        id: 2,
        sku: 'SKU-002',
        name: 'Product 2',
        price: 200.0,
        currency: 'USD',
        stock: 5,
        imageUrl: 'https://example.com/image2.jpg',
      ),
    ];

    final tRecords = RecordsEntity<ProductEntity>(
      data: tProducts,
      pagination: const PaginationInfoEntity(
        limit: 10,
        offset: 0,
        total: 2,
        page: 1,
        totalPages: 1,
        hasNextPage: false,
        hasPreviousPage: false,
      ),
    );

    test('initial state should be ProductState with NONE status', () {
      expect(productBloc.state.status, ProductStatus.NONE);
      expect(productBloc.state.records.data, isEmpty);
    });

    group('FetchProducts', () {
      test('should emit [GETTING_PRODUCTS, GOT_PRODUCTS] when fetch is successful', () async {
        // Arrange
        when(() => mockRepository.getPaginatedProducts(
              page: any(named: 'page'),
              limit: any(named: 'limit'),
              filter: any(named: 'filter'),
            )).thenAnswer((_) async => Right(tRecords));

        // Act
        productBloc.add(const ProductEvent.fetchProducts(page: 1, limit: 10));

        // Assert
        await expectLater(
          productBloc.stream,
          emitsInOrder([
            isA<ProductState>().having((s) => s.status, 'status', ProductStatus.GETTING_PRODUCTS),
            isA<ProductState>()
                .having((s) => s.status, 'status', ProductStatus.GOT_PRODUCTS)
                .having((s) => s.records.data.length, 'data length', 2),
          ]),
        );

        verify(() => mockRepository.getPaginatedProducts(
              page: 1,
              limit: 10,
              filter: null,
            )).called(1);
      });

      test('should emit [GETTING_PRODUCTS, ERROR_GETTING_PRODUCTS] when fetch fails', () async {
        // Arrange
        when(() => mockRepository.getPaginatedProducts(
              page: any(named: 'page'),
              limit: any(named: 'limit'),
              filter: any(named: 'filter'),
            )).thenAnswer((_) async => const Left(ServerFailure(message: 'Server error')));

        // Act
        productBloc.add(const ProductEvent.fetchProducts(page: 1, limit: 10));

        // Assert
        await expectLater(
          productBloc.stream,
          emitsInOrder([
            isA<ProductState>().having((s) => s.status, 'status', ProductStatus.GETTING_PRODUCTS),
            isA<ProductState>()
                .having((s) => s.status, 'status', ProductStatus.ERROR_GETTING_PRODUCTS)
                .having((s) => s.failure, 'failure', isNotNull),
          ]),
        );
      });
    });

    group('UpdateProductPrice', () {
      test('should emit [UPDATING_PRICE, UPDATED_PRICE] when update is successful', () async {
        // Arrange - First load products
        when(() => mockRepository.getPaginatedProducts(
              page: any(named: 'page'),
              limit: any(named: 'limit'),
              filter: any(named: 'filter'),
            )).thenAnswer((_) async => Right(tRecords));

        when(() => mockRepository.updateProductPrice(
              productId: any(named: 'productId'),
              newPrice: any(named: 'newPrice'),
              currency: any(named: 'currency'),
            )).thenAnswer((_) async => const Right(true));

        // Load products first
        productBloc.add(const ProductEvent.fetchProducts(page: 1, limit: 10));
        await Future.delayed(const Duration(milliseconds: 100));

        // Act
        productBloc.add(const ProductEvent.updateProductPrice(
          productId: 1,
          newPrice: 150.0,
          currency: 'BOB',
        ));

        // Assert
        await expectLater(
          productBloc.stream,
          emitsInOrder([
            isA<ProductState>().having((s) => s.status, 'status', ProductStatus.UPDATING_PRICE),
            isA<ProductState>()
                .having((s) => s.status, 'status', ProductStatus.UPDATED_PRICE)
                .having(
                  (s) => s.records.data.firstWhere((p) => p.id == 1).price,
                  'updated price',
                  150.0,
                ),
          ]),
        );

        verify(() => mockRepository.updateProductPrice(
              productId: 1,
              newPrice: 150.0,
              currency: 'BOB',
            )).called(1);
      });

      test('should emit [UPDATING_PRICE, ERROR_UPDATING_PRICE] when update fails', () async {
        // Arrange
        when(() => mockRepository.updateProductPrice(
              productId: any(named: 'productId'),
              newPrice: any(named: 'newPrice'),
              currency: any(named: 'currency'),
            )).thenAnswer((_) async => const Left(ServerFailure(message: 'Update failed')));

        // Act
        productBloc.add(const ProductEvent.updateProductPrice(
          productId: 1,
          newPrice: 150.0,
          currency: 'BOB',
        ));

        // Assert
        await expectLater(
          productBloc.stream,
          emitsInOrder([
            isA<ProductState>().having((s) => s.status, 'status', ProductStatus.UPDATING_PRICE),
            isA<ProductState>()
                .having((s) => s.status, 'status', ProductStatus.ERROR_UPDATING_PRICE)
                .having((s) => s.failure, 'failure', isNotNull),
          ]),
        );
      });
    });
  });
}
