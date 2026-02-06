import 'package:flutter/material.dart';

class FilterSectionTitle extends StatelessWidget {
  const FilterSectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
        color: Colors.grey.shade600,
      ),
    );
  }
}
