import 'package:flutter/material.dart';

class FilterChipWidget extends StatelessWidget {
  final String text;
  final bool selected;

  const FilterChipWidget({super.key, this.text = '', this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          decoration: selected ? TextDecoration.underline : TextDecoration.none,
        ),
      ),
    );
  }
}
