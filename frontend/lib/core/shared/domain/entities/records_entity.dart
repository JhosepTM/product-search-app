import 'package:freezed_annotation/freezed_annotation.dart';

part 'records_entity.freezed.dart';

@freezed
abstract class RecordsEntity<T> with _$RecordsEntity<T> {
  const factory RecordsEntity({required List<T> data, required PaginationInfoEntity pagination}) =
      _RecordsEntity<T>;
}

/// Describes the pagination state for a `ListRecords` result.
@freezed
abstract class PaginationInfoEntity with _$PaginationInfoEntity {
  const factory PaginationInfoEntity({
    @Default(0) int limit,
    @Default(0) int offset,
    @Default(0) int total,
    @Default(0) int page,
    @Default(0) int totalPages,
    @Default(false) bool hasNextPage,
    @Default(false) bool hasPreviousPage,
  }) = _PaginationInfoEntity;
}
