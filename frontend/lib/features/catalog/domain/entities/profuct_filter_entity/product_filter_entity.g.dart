// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_filter_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductFilterEntity _$ProductFilterEntityFromJson(Map<String, dynamic> json) =>
    _ProductFilterEntity(
      sortBy: json['sortBy'] as String? ?? null,
      sortDescending: json['sortDescending'] as bool? ?? null,
      inStock: json['inStock'] as bool? ?? null,
      currency: json['currency'] as String? ?? null,
      minPrice: (json['minPrice'] as num?)?.toDouble() ?? null,
      maxPrice: (json['maxPrice'] as num?)?.toDouble() ?? null,
      search: json['search'] as String? ?? null,
    );

Map<String, dynamic> _$ProductFilterEntityToJson(
  _ProductFilterEntity instance,
) => <String, dynamic>{
  'sortBy': instance.sortBy,
  'sortDescending': instance.sortDescending,
  'inStock': instance.inStock,
  'currency': instance.currency,
  'minPrice': instance.minPrice,
  'maxPrice': instance.maxPrice,
  'search': instance.search,
};
