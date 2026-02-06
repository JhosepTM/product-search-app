// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductState _$ProductStateFromJson(Map<String, dynamic> json) =>
    _ProductState(
      status:
          $enumDecodeNullable(_$ProductStatusEnumMap, json['status']) ??
          ProductStatus.NONE,
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
  ProductStatus.NONE: 'NONE',
  ProductStatus.GETTING_PRODUCTS: 'GETTING_PRODUCTS',
  ProductStatus.GOT_PRODUCTS: 'GOT_PRODUCTS',
  ProductStatus.ERROR_GETTING_PRODUCTS: 'ERROR_GETTING_PRODUCTS',
  ProductStatus.UPDATING_PRICE: 'UPDATING_PRICE',
  ProductStatus.UPDATED_PRICE: 'UPDATED_PRICE',
  ProductStatus.ERROR_UPDATING_PRICE: 'ERROR_UPDATING_PRICE',
};
