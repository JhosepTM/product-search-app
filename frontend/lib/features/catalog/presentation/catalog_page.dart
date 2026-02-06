import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/application/injector.dart';
import 'package:frontend/core/utils/toast_util.dart';
import 'package:frontend/features/catalog/domain/entities/profuct_filter_entity/product_filter_entity.dart';
import 'package:frontend/features/catalog/presentation/blocs/product_bloc/product_bloc.dart';
import 'package:frontend/features/catalog/presentation/widgets/catalog_search_bar.dart';
import 'package:frontend/features/catalog/presentation/widgets/product_card.dart';
import 'package:frontend/features/catalog/presentation/sheets/product_filter_sheet.dart';
import 'package:frontend/features/catalog/presentation/widgets/product_skeleton.dart';
import 'package:frontend/shared/widgets/empty_search_state.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  late ScrollController _scrollController;
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'Todos';
  Timer? _searchDebounce;
  ProductFilterEntity? _activeFilter;
  int _pageSize = 10;

  final List<String> _categories = ['Todos', 'Con stock', 'Sin stock'];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    Injector.get<ProductBloc>().add(
      ProductEvent.fetchProducts(page: 1, limit: _pageSize),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _searchDebounce?.cancel();
    super.dispose();
  }

  void _onScroll() {
    final state = context.read<ProductBloc>().state;

    // Cargar más productos cuando llega al final
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 500 &&
        state.records.pagination.hasNextPage &&
        state.status == ProductStatus.GOT_PRODUCTS) {
      final nextPage = state.records.pagination.page + 1;
      context.read<ProductBloc>().add(
        ProductEvent.fetchProducts(page: nextPage, limit: _pageSize),
      );
    }
  }

  void _onSearchChanged(String value) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 450), () {
      final search = value.trim();
      final baseFilter = _activeFilter ?? const ProductFilterEntity();
      final updatedFilter = baseFilter.copyWith(
        search: search.isEmpty ? null : search,
      );
      _activeFilter = updatedFilter;
      context.read<ProductBloc>().setFilter(updatedFilter);
      context.read<ProductBloc>().add(
        ProductEvent.fetchProducts(page: 1, limit: _pageSize),
      );
    });
  }

  Future<void> _openFilters() async {
    final result = await ProductFilterSheet.show(
      context,
      initialFilter: _activeFilter,
    );

    if (!mounted || result == null) return;
    final search = _searchController.text.trim();
    final updatedFilter = result.copyWith(
      search: search.isEmpty ? null : search,
    );
    _activeFilter = updatedFilter;
    context.read<ProductBloc>().setFilter(updatedFilter);
    context.read<ProductBloc>().add(
      ProductEvent.fetchProducts(page: 1, limit: _pageSize),
    );
  }

  void _applyStockFilter(String category) {
    bool? inStock;
    switch (category) {
      case 'Con stock':
        inStock = true;
        break;
      case 'Sin stock':
        inStock = false;
        break;
      case 'Todos':
      default:
        inStock = null;
        break;
    }

    final search = _searchController.text.trim();
    final baseFilter = _activeFilter ?? const ProductFilterEntity();
    final updatedFilter = baseFilter.copyWith(
      inStock: inStock,
      search: search.isEmpty ? null : search,
    );
    _activeFilter = updatedFilter;
    context.read<ProductBloc>().setFilter(updatedFilter);
    context.read<ProductBloc>().add(
      ProductEvent.fetchProducts(page: 1, limit: _pageSize),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(title: const Text('Catálogo'), elevation: 0),
      body: BlocListener<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state.status == ProductStatus.UPDATED_PRICE) {
            ThToast.success(
              context: context,
              title: 'Éxito',
              description: 'Precio actualizado correctamente',
            );
          } else if (state.status == ProductStatus.ERROR_UPDATING_PRICE) {
            ThToast.error(
              context: context,
              title: 'Error',
              description:
                  state.failure?.message ?? 'Error al actualizar el precio',
            );
          } else if (state.status == ProductStatus.ERROR_GETTING_PRODUCTS) {
            ThToast.error(
              context: context,
              title: 'Error',
              description:
                  state.failure?.message ?? 'Error al cargar productos',
            );
          }
        },
        child: Column(
          children: [
            // Barra de búsqueda
            CatalogSearchBar(
              controller: _searchController,
              onSearchChanged: _onSearchChanged,
              onOpenFilters: _openFilters,
            ),
            // Filtros de categoría
            Container(
              color: theme.scaffoldBackgroundColor,
              padding: const EdgeInsets.only(bottom: 12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: _categories.map((category) {
                    final isSelected = _selectedCategory == category;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterChip(
                        label: Text(category),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            _selectedCategory = category;
                          });
                          _applyStockFilter(category);
                        },
                        selectedColor: theme.colorScheme.primary,
                        labelStyle: TextStyle(
                          color: isSelected
                              ? theme.colorScheme.onPrimary
                              : theme.colorScheme.onSurface,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                        checkmarkColor: theme.colorScheme.onPrimary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            // Divider
            Divider(height: 1, thickness: 1, color: theme.dividerColor),
            // Lista de productos
            Expanded(
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  // Estado inicial o cargando
                  if (state.status == ProductStatus.GETTING_PRODUCTS ||
                      state.status == ProductStatus.NONE) {
                    return ListView.builder(
                      padding: const EdgeInsets.only(top: 8),
                      itemCount: 6,
                      itemBuilder: (context, index) => const ProductSkeleton(),
                    );
                  }

                  // Error
                  if (state.status == ProductStatus.ERROR_GETTING_PRODUCTS) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 64,
                            color: theme.colorScheme.error,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Error cargando productos',
                            style: theme.textTheme.titleLarge,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            state.failure?.message ?? 'Intenta de nuevo',
                            style: theme.textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              context.read<ProductBloc>().add(
                                const ProductEvent.fetchProducts(),
                              );
                            },
                            child: const Text('Reintentar'),
                          ),
                        ],
                      ),
                    );
                  }

                  // Productos cargados
                  if (state.records.data.isEmpty) {
                    return EmptySearchState(
                      searchQuery: _searchController.text.isNotEmpty
                          ? _searchController.text
                          : null,
                      title: 'No se encontraron productos',
                      message: _activeFilter != null
                          ? 'No hay productos que coincidan con los filtros aplicados.'
                          : 'No hay productos disponibles.',
                    );
                  }

                  return ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                    itemCount: state.records.data.length,
                    itemBuilder: (context, index) {
                      final product = state.records.data[index];
                      return ProductCard(product: product);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
