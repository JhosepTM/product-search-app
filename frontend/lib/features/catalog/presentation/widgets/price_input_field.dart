import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PriceInputField extends StatelessWidget {
  const PriceInputField({
    super.key,
    required this.name,
    required this.label,
    this.onChanged,
  });

  final String name;
  final String label;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: theme.colorScheme.onSurfaceVariant,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        FormBuilderTextField(
          name: name,
          onChanged: onChanged,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: theme.colorScheme.onSurface,
          ),
          decoration: InputDecoration(
            prefixText: '\$ ',
            prefixStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            filled: true,
            fillColor: theme.colorScheme.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 18,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: theme.dividerColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: theme.dividerColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
