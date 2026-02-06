import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/application/injector.dart';
import 'package:frontend/features/catalog/presentation/blocs/product_bloc/product_bloc.dart';
import 'package:frontend/features/catalog/presentation/widgets/product_card.dart';
import 'package:frontend/features/catalog/presentation/widgets/product_skeleton.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  late ScrollController _scrollController;
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'Todos';

  final List<String> _categories = [
    'Todos',
    'Electrónica',
    'Periféricos',
    'Stock Bajo',
  ];

  @override
  void initState() {
    super.initState();
    Injector.get<ProductBloc>().add(const ProductEvent.fetchProducts());
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final state = context.read<ProductBloc>().state;
    
    // Cargar más productos cuando llega al final
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 500 &&
        state.records.pagination.hasNextPage &&
        state.status == ProductStatus.success) {
      final nextPage = state.records.pagination.page + 1;
      context.read<ProductBloc>().add(
            ProductEvent.fetchProducts(page: nextPage),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: const Text('Catálogo'),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Barra de búsqueda
          Container(
            color: theme.scaffoldBackgroundColor,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar por nombre o SKU',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              onChanged: (value) {
                // TODO: Implementar búsqueda
              },
            ),
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
                          // TODO: Implementar filtrado por categoría
                        });
                      },
                      selectedColor: theme.colorScheme.primary,
                      labelStyle: TextStyle(
                        color: isSelected
                            ? theme.colorScheme.onPrimary
                            : theme.colorScheme.onSurface,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.normal,
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
          Divider(
            height: 1,
            thickness: 1,
            color: theme.dividerColor,
          ),
          // Lista de productos
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                // Estado inicial o cargando
                if (state.status == ProductStatus.loading) {
                  return ListView.builder(
                    padding: const EdgeInsets.only(top: 8),
                    itemCount: 6,
                    itemBuilder: (context, index) => const ProductSkeleton(),
                  );
                }

                // Error
                if (state.status == ProductStatus.failure) {
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
                            context
                                .read<ProductBloc>()
                                .add(const ProductEvent.fetchProducts());
                          },
                          child: const Text('Reintentar'),
                        ),
                      ],
                    ),
                  );
                }

                // Productos cargados
                if (state.records.data.isEmpty) {
                  return Center(
                    child: Text(
                      'No hay productos disponibles',
                      style: theme.textTheme.titleLarge,
                    ),
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
    );
  }
}
