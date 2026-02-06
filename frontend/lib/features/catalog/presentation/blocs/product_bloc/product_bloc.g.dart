// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductState _$ProductStateFromJson(Map<String, dynamic> json) =>
    _ProductState(
      status:
          $enumDecodeNullable(_$ProductStatusEnumMap, json['status']) ??
          ProductStatus.none,
      records: json['records'] == null
          ? const RecordsEntity<ProductEntity>(
              data: [],
              pagination: PaginationInfoEntity(),
            )
          : _recordsFromJson(json['records'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductStateToJson(_ProductState instance) =>
    <String, dynamic>{
      'status': _$ProductStatusEnumMap[instance.status]!,
      'records': _recordsToJson(instance.records),
    };

const _$ProductStatusEnumMap = {
  ProductStatus.none: 'none',
  ProductStatus.gettingProducts: 'gettingProducts',
  ProductStatus.gotProducts: 'gotProducts',
  ProductStatus.errorGettingProducts: 'errorGettingProducts',
  ProductStatus.updatingPrice: 'updatingPrice',
  ProductStatus.updatedPrice: 'updatedPrice',
  ProductStatus.errorUpdatingPrice: 'errorUpdatingPrice',
};
