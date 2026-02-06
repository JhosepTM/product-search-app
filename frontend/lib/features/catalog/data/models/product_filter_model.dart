import 'package:frontend/features/catalog/domain/entities/profuct_filter_entity/product_filter_entity.dart';

class ProductFilterModel {
  const ProductFilterModel({
    this.sortBy,
    this.sortDescending,
    this.inStock,
    this.currency,
    this.minPrice,
    this.maxPrice,
    this.search,
  });

  final String? sortBy;
  final bool? sortDescending;
  final bool? inStock;
  final String? currency;
  final double? minPrice;
  final double? maxPrice;
  final String? search;

  factory ProductFilterModel.fromEntity(ProductFilterEntity entity) {
    return ProductFilterModel(
      sortBy: entity.sortBy,
      sortDescending: entity.sortDescending,
      inStock: entity.inStock,
      currency: entity.currency,
      minPrice: entity.minPrice,
      maxPrice: entity.maxPrice,
      search: entity.search,
    );
  }

  Map<String, dynamic> toQueryParameters() {
    final params = <String, dynamic>{};

    if (search != null && search!.isNotEmpty) {
      params['Search'] = search;
    }
    if (minPrice != null) {
      params['MinPrice'] = minPrice;
    }
    if (maxPrice != null) {
      params['MaxPrice'] = maxPrice;
    }
    if (currency != null && currency!.isNotEmpty) {
      params['Currency'] = currency;
    }
    // inStock puede ser true o false, pero no null
    if (inStock != null) {
      params['InStock'] = inStock;
    }
    if (sortBy != null && sortBy!.isNotEmpty) {
      params['SortBy'] = sortBy;
    }
    if (sortDescending != null) {
      params['SortDescending'] = sortDescending;
    }

    return params;
  }
}
