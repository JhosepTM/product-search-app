import 'package:freezed_annotation/freezed_annotation.dart';

part 'records_model.freezed.dart';
part 'records_model.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class RecordsModel<T> with _$RecordsModel<T> {
  const factory RecordsModel({
    required List<T> data,
    required PaginationInfoModel pagination,
  }) = _RecordsModel<T>;

  factory RecordsModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$RecordsModelFromJson(json, fromJsonT);
}

/// Describes the pagination state for a `ListRecords` result.
@freezed
abstract class PaginationInfoModel with _$PaginationInfoModel {
  const factory PaginationInfoModel({
    @Default(0) int limit,
    @Default(0) int offset,
    @Default(0) int total,
    @Default(0) int page,
    @Default(0) int totalPages,
    @Default(false) bool hasNextPage,
    @Default(false) bool hasPreviousPage,
  }) = _PaginationInfoModel;

  factory PaginationInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationInfoModelFromJson(json);
}
