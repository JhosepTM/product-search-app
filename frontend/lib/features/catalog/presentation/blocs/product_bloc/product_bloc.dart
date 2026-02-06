import 'package:frontend/core/core.dart';
import 'package:frontend/core/shared/domain/entities/records_entity.dart';
import 'package:frontend/features/catalog/domain/entities/profuct_filter_entity/product_filter_entity.dart';
import 'package:frontend/features/catalog/domain/entities/product_entity/product_entity.dart';
import 'package:frontend/features/catalog/domain/usecases/product_use_cases.dart';

part 'product_bloc.freezed.dart';
part 'product_bloc.g.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends HydratedBloc<ProductEvent, ProductState> {
  ProductBloc({required ProductUseCases productUseCases})
    : _productUseCases = productUseCases,
      super(const ProductState()) {
    on<_FetchProducts>(_onFetchProducts);
    on<_UpdateProductPrice>(_onUpdateProductPrice);
  }

  final ProductUseCases _productUseCases;
  ProductFilterEntity? _activeFilter;

  void setFilter(ProductFilterEntity? filter) {
    _activeFilter = filter;
  }

  Future<void> _onFetchProducts(
    _FetchProducts event,
    Emitter<ProductState> emit,
  ) async {
    // Si es la primera página, mostrar loading. Si es página siguiente, mantener loading discreto
    if (event.page == 1) {
      emit(state.copyWith(status: ProductStatus.GETTING_PRODUCTS));
    }

    final result = await _productUseCases.getPaginatedProducts(
      page: event.page,
      limit: event.limit,
      filter: _activeFilter,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ProductStatus.ERROR_GETTING_PRODUCTS,
          failure: failure,
        ),
      ),
      (newRecords) {
        // Si es la primera página, reemplazar. Si no, concatenar
        final updatedProducts = event.page == 1
            ? newRecords.data
            : [...state.records.data, ...newRecords.data];

        final updatedRecords = RecordsEntity<ProductEntity>(
          data: updatedProducts,
          pagination: newRecords.pagination,
        );

        emit(
          state.copyWith(
            status: ProductStatus.GOT_PRODUCTS,
            records: updatedRecords,
          ),
        );
      },
    );
  }

  Future<void> _onUpdateProductPrice(
    _UpdateProductPrice event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(status: ProductStatus.UPDATING_PRICE));

    final result = await _productUseCases.updateProductPrice(
      productId: event.productId,
      newPrice: event.newPrice,
      currency: event.currency,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ProductStatus.ERROR_UPDATING_PRICE,
          failure: failure,
        ),
      ),
      (_) {
        // Actualizar el producto en la lista local
        final updatedProducts = state.records.data.map((product) {
          if (product.id == event.productId) {
            return product.copyWith(
              price: event.newPrice,
              currency: event.currency,
            );
          }
          return product;
        }).toList();

        final updatedRecords = RecordsEntity<ProductEntity>(
          data: updatedProducts,
          pagination: state.records.pagination,
        );

        emit(
          state.copyWith(
            status: ProductStatus.UPDATED_PRICE,
            records: updatedRecords,
          ),
        );
      },
    );
  }

  @override
  ProductState? fromJson(Map<String, dynamic> json) {
    try {
      return ProductState.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ProductState state) {
    try {
      return state.toJson();
    } catch (_) {
      return null;
    }
  }
}
