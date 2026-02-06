import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_filter_entity.freezed.dart';
part 'product_filter_entity.g.dart';

@freezed
sealed class ProductFilterEntity with _$ProductFilterEntity {
  const factory ProductFilterEntity({
    @Default(null) String? sortBy,
    @Default(null) bool? sortDescending,
    @Default(null) bool? inStock,
    @Default(null) String? currency,
    @Default(null) double? minPrice,
    @Default(null) double? maxPrice,
    @Default(null) String? search
  }) = _ProductFilterEntity;

  factory ProductFilterEntity.fromJson(Map<String, dynamic> json) => _$ProductFilterEntityFromJson(json);

  // factory ProductFilterEntity.fromEntity(ProductModel entity) =>
  //     ProductFilterEntity(
  //       id: entity.id,
  //       sku: entity.sku,
  //       name: entity.name,
  //       price: entity.price,
  //       currency: entity.currency,
  //       stock: entity.stock,
  //       imageUrl: entity.imageUrl,
  //     );
}
