import 'package:frontend/core/core.dart';
import 'package:frontend/core/shared/domain/entities/records_entity.dart';
import 'package:frontend/features/catalog/domain/entities/product_entity.dart';
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
  }

  final ProductUseCases _productUseCases;

  Future<void> _onFetchProducts(
    _FetchProducts event,
    Emitter<ProductState> emit,
  ) async {
    // Si es la primera página, mostrar loading. Si es página siguiente, mantener loading discreto
    if (event.page == 1) {
      emit(state.copyWith(status: ProductStatus.loading));
    }

    final result = await _productUseCases.getPaginatedProducts(
      page: event.page,
      limit: event.limit,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ProductStatus.failure,
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
            status: ProductStatus.success,
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
