import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/features/catalog/domain/entities/product_entity.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int id,
    required String sku,
    required String name,
    required double price,
    required String currency,
    required int stock,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  factory ProductModel.fromEntity(ProductEntity entity) =>
      ProductModel(id: entity.id, sku: entity.sku, name: entity.name, price: entity.price, currency: entity.currency, stock: entity.stock);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
