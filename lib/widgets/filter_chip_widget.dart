import 'package:flutter/material.dart';

class FilterChipWidget extends StatelessWidget {
  final String text;
  final bool selected;
  final ValueChanged<bool>? onSelected;

  const FilterChipWidget({
    super.key,
    this.text = '',
    this.selected = false,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        ),
        maxLines: 1,
      ),
      selected: selected,
      onSelected: onSelected,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      selectedShadowColor: Theme.of(context).secondaryHeaderColor,
      selectedColor: Theme.of(context).secondaryHeaderColor,
      labelStyle: TextStyle(
        color:
            selected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
      ),
      showCheckmark: true,
    );
  }
}
