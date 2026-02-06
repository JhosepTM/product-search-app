import 'package:flutter/material.dart';
import 'package:frontend/features/catalog/domain/entities/product_entity/product_entity.dart';
import 'package:frontend/features/catalog/presentation/sheets/edit_price_bottom_sheet.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  const ProductCard({super.key, required this.product});

  bool get _isLowStock => product.stock < 10 && product.stock > 0;
  bool get _isOutOfStock => product.stock == 0;
  bool get _hasStockWarning => _isLowStock || _isOutOfStock;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _isOutOfStock
              // ignore: deprecated_member_use
              ? Colors.red.withOpacity(0.3)
              : _isLowStock
              // ignore: deprecated_member_use
              ? Colors.orange.withOpacity(0.3)
              : theme.colorScheme.outlineVariant,
          width: 1.5,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            useRootNavigator: true,
            builder: (context) => EditPriceBottomSheet(product: product),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Imagen del producto
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(
                          Icons.image_not_supported,
                          color: theme.colorScheme.onSurfaceVariant,
                          size: 32,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Información del producto
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nombre del producto
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // SKU
                    Text(
                      'SKU: ${product.sku}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Precio y Stock
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Precio con moneda
                        Text(
                          '${product.currency} ${product.price.toStringAsFixed(2)}',
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        // Stock con warning encima
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // Warning badge
                            if (_hasStockWarning)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      _isOutOfStock
                                          ? Icons.error_rounded
                                          : Icons.warning_amber_rounded,
                                      color: _isOutOfStock
                                          ? Colors.red[700]
                                          : Colors.orange[700],
                                      size: 14,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      _isOutOfStock
                                          ? 'Sin stock'
                                          : 'Stock bajo',
                                      style: TextStyle(
                                        color: _isOutOfStock
                                            ? Colors.red[700]
                                            : Colors.orange[700],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            // Stock badge
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: _isOutOfStock
                                    // ignore: deprecated_member_use
                                    ? Colors.red.withOpacity(0.15)
                                    : _isLowStock
                                    // ignore: deprecated_member_use
                                    ? Colors.orange.withOpacity(0.15)
                                    // ignore: deprecated_member_use
                                    : Colors.green.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.inventory_2,
                                    color: _isOutOfStock
                                        ? Colors.red[700]
                                        : _isLowStock
                                        ? Colors.orange[700]
                                        : Colors.green[700],
                                    size: 14,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${product.stock} Unidades',
                                    style: TextStyle(
                                      color: _isOutOfStock
                                          ? Colors.red[700]
                                          : _isLowStock
                                          ? Colors.orange[700]
                                          : Colors.green[700],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Chevron
              Icon(
                Icons.chevron_right,
                color: theme.colorScheme.onSurfaceVariant,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
