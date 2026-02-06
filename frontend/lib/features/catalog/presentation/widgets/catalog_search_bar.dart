import 'package:flutter/material.dart';

class CatalogSearchBar extends StatelessWidget {
  const CatalogSearchBar({
    super.key,
    required this.controller,
    required this.onSearchChanged,
    required this.onOpenFilters,
  });

  final TextEditingController controller;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onOpenFilters;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
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
              onChanged: onSearchChanged,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            tooltip: 'Filtros',
            onPressed: onOpenFilters,
            icon: const Icon(Icons.tune_outlined),
          ),
        ],
      ),
    );
  }
}
