import 'package:flutter/material.dart';

class AppOptionChip extends StatelessWidget {
  const AppOptionChip({
    super.key,
    required this.label,
    required this.selected,
    this.onTap,
    this.leading,
    this.trailing,
    this.padding,
    this.minWidth,
    this.minHeight,
    this.borderRadius,
    this.filled = true,
    this.showShadow = true,
    this.textStyle,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;
  final double? minWidth;
  final double? minHeight;
  final BorderRadius? borderRadius;
  final bool filled;
  final bool showShadow;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = filled
        ? (selected
            ? theme.colorScheme.primary
            : theme.colorScheme.surfaceVariant)
        : theme.colorScheme.surface;
    final foregroundColor = selected
        ? (filled ? theme.colorScheme.onPrimary : theme.colorScheme.primary)
        : theme.colorScheme.onSurface;
    final borderColor = selected
        ? theme.colorScheme.primary
        : theme.colorScheme.outline.withOpacity(0.4);

    final chipRadius = borderRadius ?? BorderRadius.circular(22);
    final chipPadding =
        padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 10);

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null) ...[
          leading!,
          const SizedBox(width: 6),
        ],
        Flexible(
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: (textStyle ?? theme.textTheme.labelLarge)?.copyWith(
              color: foregroundColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        if (trailing != null) ...[
          const SizedBox(width: 8),
          trailing!,
        ],
      ],
    );

    return InkWell(
      onTap: onTap,
      borderRadius: chipRadius,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        padding: chipPadding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: chipRadius,
          border: Border.all(color: borderColor),
          boxShadow: selected && showShadow
              ? [
                  BoxShadow(
                    color: theme.colorScheme.primary.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        constraints: BoxConstraints(
          minWidth: minWidth ?? 0,
          minHeight: minHeight ?? 0,
        ),
        alignment: Alignment.center,
        child: content,
      ),
    );
  }
}
