import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/features/catalog/data/models/product_model.dart';

part 'product_entity.freezed.dart';
part 'product_entity.g.dart';

@freezed
class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    required int id,
    required String sku,
    required String name,
    required double price,
    required String currency,
    required int stock,
    required String imageUrl,
  }) = _ProductEntity;

  factory ProductEntity.fromJson(Map<String, dynamic> json) => _$ProductEntityFromJson(json);

  factory ProductEntity.fromEntity(ProductModel entity) =>
      ProductEntity(
        id: entity.id,
        sku: entity.sku,
        name: entity.name,
        price: entity.price,
        currency: entity.currency,
        stock: entity.stock,
        imageUrl: entity.imageUrl,
      );

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
