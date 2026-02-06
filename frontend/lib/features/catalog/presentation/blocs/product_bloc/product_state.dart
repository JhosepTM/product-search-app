part of 'product_bloc.dart';

enum ProductStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
sealed class ProductState with _$ProductState {
  const factory ProductState({
    @Default(ProductStatus.initial) ProductStatus status,
    @JsonKey(
      fromJson: _recordsFromJson,
      toJson: _recordsToJson,
    )
    @Default(RecordsEntity<ProductEntity>(
      data: [],
      pagination: PaginationInfoEntity(),
    ))
    RecordsEntity<ProductEntity> records,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(null)
    Failure? failure,
  }) = _ProductState;

  factory ProductState.fromJson(Map<String, dynamic> json) =>
      _$ProductStateFromJson(json);
}

RecordsEntity<ProductEntity> _recordsFromJson(Map<String, dynamic> json) {
  return RecordsEntity.fromJson(json, ProductEntity.fromJson);
}

Map<String, dynamic> _recordsToJson(RecordsEntity<ProductEntity> records) {
  return {
    'data': records.data.map((e) => e.toJson()).toList(),
    'pagination': {
      'limit': records.pagination.limit,
      'offset': records.pagination.offset,
      'total': records.pagination.total,
      'page': records.pagination.page,
      'totalPages': records.pagination.totalPages,
      'hasNextPage': records.pagination.hasNextPage,
      'hasPreviousPage': records.pagination.hasPreviousPage,
    },
  };
}
