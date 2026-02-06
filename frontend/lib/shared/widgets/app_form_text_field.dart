import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppFormTextField extends StatelessWidget {
  const AppFormTextField({
    super.key,
    required this.name,
    required this.label,
    this.hintText,
    this.keyboardType,
    this.initialValue,
    this.onChanged,
    this.prefixIcon,
    this.prefixText,
    this.prefixStyle,
    this.enabled = true,
  });

  final String name;
  final String label;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? initialValue;
  final ValueChanged<String?>? onChanged;
  final Widget? prefixIcon;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FormBuilderTextField(
      name: name,
      initialValue: initialValue,
      enabled: enabled,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefixText: prefixText,
        prefixStyle: prefixStyle,
        filled: true,
        fillColor: theme.colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: theme.colorScheme.primary,
            width: 1.4,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
      ),
    );
  }
}
