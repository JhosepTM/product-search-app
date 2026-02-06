import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/features/catalog/domain/entities/profuct_filter_entity/product_filter_entity.dart';
import 'package:frontend/features/catalog/presentation/widgets/currency_chip.dart';
import 'package:frontend/features/catalog/presentation/widgets/direction_chip.dart';
import 'package:frontend/features/catalog/presentation/widgets/filter_section_title.dart';
import 'package:frontend/features/catalog/presentation/widgets/price_input_field.dart';
import 'package:frontend/shared/widgets/app_option_chip.dart';

class ProductFilterSheet extends StatefulWidget {
  const ProductFilterSheet({super.key, this.initialFilter});

  final ProductFilterEntity? initialFilter;

  static Future<ProductFilterEntity?> show(
    BuildContext context, {
    ProductFilterEntity? initialFilter,
  }) {
    return showModalBottomSheet<ProductFilterEntity?>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      useRootNavigator: true,
      builder: (_) => ProductFilterSheet(initialFilter: initialFilter),
    );
  }

  @override
  State<ProductFilterSheet> createState() => _ProductFilterSheetState();
}

class _ProductFilterSheetState extends State<ProductFilterSheet> {
  final _formKey = GlobalKey<FormBuilderState>();
  late RangeValues _currentRange;

  @override
  void initState() {
    super.initState();
    final min = (widget.initialFilter?.minPrice ?? 150)
        .clamp(0, 5000)
        .toDouble();
    final max = (widget.initialFilter?.maxPrice ?? 850)
        .clamp(0, 5000)
        .toDouble();
    final start = min <= max ? min : max;
    final end = max >= min ? max : min;
    _currentRange = RangeValues(start, end);
  }

  ProductFilterEntity _buildFilter(Map<String, dynamic> values) {
    final minPrice = _parseDouble(values['minPrice']) ?? _currentRange.start;
    final maxPrice = _parseDouble(values['maxPrice']) ?? _currentRange.end;
    final inStock = values['inStock'] as bool?;
    final currency = values['currency'] as String?;
    final sortBy = values['sortBy'] as String?;
    final sortDescending = values['sortDescending'] as bool?;

    return ProductFilterEntity(
      minPrice: minPrice,
      maxPrice: maxPrice,
      inStock: inStock == true ? true : null,
      currency: currency,
      sortBy: sortBy,
      sortDescending: sortBy == null ? null : (sortDescending ?? false),
    );
  }

  double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is num) return value.toDouble();
    final text = value.toString().replaceAll(',', '.').trim();
    if (text.isEmpty) return null;
    return double.tryParse(text);
  }

  void _clearAll() {
    _formKey.currentState?.patchValue({
      'sortBy': null,
      'sortDescending': false,
      'minPrice': '150',
      'maxPrice': '850',
      'inStock': false,
      'currency': null,
    });
    setState(() {
      _currentRange = const RangeValues(150, 850);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final initialFilter = widget.initialFilter;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: theme.colorScheme.primary.withOpacity(0.08),
            blurRadius: 24,
            offset: const Offset(0, -8),
          ),
          BoxShadow(
            // ignore: deprecated_member_use
            color: theme.shadowColor.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 14,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          child: FormBuilder(
            key: _formKey,
            initialValue: {
              'minPrice': (initialFilter?.minPrice ?? 150).toStringAsFixed(0),
              'maxPrice': (initialFilter?.maxPrice ?? 850).toStringAsFixed(0),
              'inStock': initialFilter?.inStock ?? false,
              'currency': initialFilter?.currency,
              'sortBy': initialFilter?.sortBy ?? 'name',
              'sortDescending': initialFilter?.sortDescending ?? false,
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Handle bar
                Center(
                  child: Container(
                    width: 40,
                    height: 5,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: theme.dividerColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filtros y Orden',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    TextButton(
                      onPressed: _clearAll,
                      style: TextButton.styleFrom(
                        foregroundColor: theme.colorScheme.primary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                      child: Text(
                        'Limpiar todo',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // ORDENAR POR
                const FilterSectionTitle(title: 'ORDENAR POR'),
                const SizedBox(height: 12),
                FormBuilderField<String>(
                  name: 'sortBy',
                  builder: (field) {
                    return Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        _buildSortChip(field, 'name', 'Nombre'),
                        _buildSortChip(field, 'price', 'Precio'),
                        _buildSortChip(field, 'stock', 'Stock'),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 14),

                // Descendente / Ascendente
                FormBuilderField<bool>(
                  name: 'sortDescending',
                  builder: (field) {
                    final isDescending = field.value ?? false;
                    return Row(
                      children: [
                        Expanded(
                          child: DirectionChip(
                            label: 'Descendente',
                            icon: Icons.arrow_downward_rounded,
                            selected: isDescending,
                            onTap: () => field.didChange(true),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: DirectionChip(
                            label: 'Ascendente',
                            icon: Icons.arrow_upward_rounded,
                            selected: !isDescending,
                            onTap: () => field.didChange(false),
                          ),
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 28),

                // RANGO DE PRECIO
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const FilterSectionTitle(title: 'RANGO DE PRECIO'),
                    Text(
                      '\$${_currentRange.start.toStringAsFixed(0)} - \$${_currentRange.end.toStringAsFixed(0)}',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Slider
                SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: theme.colorScheme.primary,
                    inactiveTrackColor: theme.dividerColor,
                    thumbColor: theme.colorScheme.surface,
                    // ignore: deprecated_member_use
                    overlayColor: theme.colorScheme.primary.withOpacity(0.1),
                    trackHeight: 4,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 12,
                      elevation: 4,
                    ),
                    rangeThumbShape: const RoundRangeSliderThumbShape(
                      enabledThumbRadius: 12,
                      elevation: 4,
                    ),
                  ),
                  child: RangeSlider(
                    values: _currentRange,
                    min: 0,
                    max: 5000,
                    divisions: 50,
                    onChanged: (values) {
                      setState(() => _currentRange = values);
                      _formKey.currentState?.fields['minPrice']?.didChange(
                        values.start.toStringAsFixed(0),
                      );
                      _formKey.currentState?.fields['maxPrice']?.didChange(
                        values.end.toStringAsFixed(0),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 12),

                // Min/Max inputs
                Row(
                  children: [
                    Expanded(
                      child: PriceInputField(
                        name: 'minPrice',
                        label: 'Minimo',
                        onChanged: (val) {
                          final v = _parseDouble(val);
                          if (v != null) {
                            setState(() {
                              _currentRange = RangeValues(
                                v.clamp(0, _currentRange.end),
                                _currentRange.end,
                              );
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: PriceInputField(
                        name: 'maxPrice',
                        label: 'Maximo',
                        onChanged: (val) {
                          final v = _parseDouble(val);
                          if (v != null) {
                            setState(() {
                              _currentRange = RangeValues(
                                _currentRange.start,
                                v.clamp(_currentRange.start, 5000),
                              );
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Solo con stock
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Solo con stock',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Mostrar solo productos disponibles',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FormBuilderField<bool>(
                      name: 'inStock',
                      builder: (field) {
                        return Switch(
                          value: field.value ?? false,
                          onChanged: field.didChange,
                          activeColor: theme.colorScheme.surface,
                          activeTrackColor: theme.colorScheme.primary,
                          inactiveThumbColor: theme.colorScheme.surface,
                          inactiveTrackColor: theme.dividerColor,
                        );
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // MONEDA
                const FilterSectionTitle(title: 'MONEDA'),
                const SizedBox(height: 12),
                FormBuilderField<String>(
                  name: 'currency',
                  builder: (field) {
                    return Row(
                      children: [
                        Expanded(
                          child: CurrencyChip(
                            label: 'BOB',
                            selected: field.value == 'BOB',
                            onTap: () => field.didChange(
                              field.value == 'BOB' ? null : 'BOB',
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CurrencyChip(
                            label: 'USD',
                            selected: field.value == 'USD',
                            onTap: () => field.didChange(
                              field.value == 'USD' ? null : 'USD',
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 28),

                // Aplicar Filtros
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      _formKey.currentState?.save();
                      final values = _formKey.currentState?.value ?? {};
                      final filter = _buildFilter(values);
                      Navigator.of(context).pop(filter);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text(
                      'Aplicar Filtros',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSortChip(
    FormFieldState<String> field,
    String value,
    String label,
  ) {
    final isSelected = field.value == value;

    return AppOptionChip(
      label: label,
      selected: isSelected,
      onTap: () => field.didChange(value),
      filled: true,
      showShadow: false,
      minHeight: 40,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    );
  }
}
