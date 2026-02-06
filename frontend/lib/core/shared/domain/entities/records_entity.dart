import 'package:freezed_annotation/freezed_annotation.dart';

part 'records_entity.freezed.dart';

@freezed
abstract class RecordsEntity<T> with _$RecordsEntity<T> {
  const factory RecordsEntity({required List<T> data, required PaginationInfoEntity pagination}) =
      _RecordsEntity<T>;

  const RecordsEntity._();

  factory RecordsEntity.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    final data = (json['data'] as List?)
            ?.map((e) => fromJsonT(e as Map<String, dynamic>))
            .toList() ??
        [];

    final paginationJson = json['pagination'] as Map<String, dynamic>? ?? {};
    final pagination = PaginationInfoEntity(
      limit: paginationJson['limit'] as int? ?? 0,
      offset: paginationJson['offset'] as int? ?? 0,
      total: paginationJson['total'] as int? ?? 0,
      page: paginationJson['page'] as int? ?? 0,
      totalPages: paginationJson['totalPages'] as int? ?? 0,
      hasNextPage: paginationJson['hasNextPage'] as bool? ?? false,
      hasPreviousPage: paginationJson['hasPreviousPage'] as bool? ?? false,
    );

    return RecordsEntity<T>(
      data: data,
      pagination: pagination,
    );
  }
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
